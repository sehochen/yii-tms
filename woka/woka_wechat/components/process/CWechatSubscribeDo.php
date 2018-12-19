<?php
namespace  wechat\components\process;

use yii;
use yii\base\Object;
use wokaextend\wechat\UserManage;
use wechat\components\template\Template;
use common\models\common\wechat\WechatSubscribe;
use common\models\wechat\QrcodeM\WechatNewUqrcode;
use common\models\wechat\QrcodeM\WechatQrcodeUser;
use common\models\wechat\QrcodeM\WechatSimQrcode;
use common\models\common\user\Wxuser;
use common\models\common\user\UserExtend;
use common\models\common\wechat\WechatText;
use wokaextend\wechat\ResponsePassive;
use frontend\components\common\cash\CashOption;
/**
 * Summary of CWechatDo
 * 拓展分类
 */
class  CWechatSubscribeDo  extends Object
{

    public function init()
    {

    }
    
    /**
     * Summary of setSubscribeText
     * 关注处理接口
     * @return mixed
     */
    public function doSubscribeText($openid,$curr_id,$ticket=false)
    {
        $wxid=Yii::$app->request->get('id');
        if(!$wxid)
        {
            $wxid=1;
        }
   
        if($ticket ){
            //扫码结果
            $modelSimQ=new WechatSimQrcode();
            $modelSimQ->ticketcode=$ticket;
            $modelSimQ->openid=$openid;
            $modelSimQ->date=date("Y-m-d H:i:s");
            $modelSimQ->save();
        }
      
        
        
        $uinfo=self::saveUserInfo($wxid,$openid);
        if($uinfo)
        {
            //如果有扫码推广信息
            if($ticket )
            {
                self::extendSubscribe($wxid,$ticket,$uinfo);
            }
        }       
        
        //关注-消息配置
        $modelSub=WechatSubscribe::findOne(['wx_id'=>$wxid]);
        if($modelSub)
        {           
            switch ($modelSub->type)
            {
                //文本消息
                case 1:
                    $modelText=WechatText::findOne($modelSub->message_id);
                    if($modelText)
                    {
                        return ResponsePassive::text($openid, $curr_id, $modelText->text);
                        exit;
                    }
                    break;  
                case 2:
                    
                    break;
                default:
                    ;
            }
        }
        return false;       
    }
    /**
     * Summary of saveUserInfo
     * 保存用户信息
     * @param mixed $openId 
     */
    public function saveUserInfo($wxid,$openid)
    {
       
        $modelWxuser=Wxuser::findOne(["openid"=>$openid]);     
            //如果用户不存在则获取用户信息 
        if(!$modelWxuser)
        {
            try{                    
                $modelWxuser=new Wxuser();
                $userinfo=  UserManage::getUserInfo($wxid,$openid);
                if(!isset($userinfo['nickname']))
                {                        
                    return false;                        
                }                    
                $modelWxuser->openid=$openid;
                $modelWxuser->openid=$openid;
                $modelWxuser->nickname= self::filterEmoji($userinfo["nickname"]) ;
                if(empty($modelWxuser->nickname))
                {
                    $modelWxuser->nickname='we鱼用户-非法昵称';
                }
                $modelWxuser->sex=$userinfo['sex'];              
                $modelWxuser->city=$userinfo['city'];
                $modelWxuser->country=$userinfo['country'];                
                $modelWxuser->province=$userinfo['province'];
                $modelWxuser->headimgurl=$userinfo['headimgurl'];  
                $modelWxuser->addtime=time();
                $modelWxuser->issubscribe=1;
                if($modelWxuser->save())
                {
                    return $modelWxuser;
                }else
                {
                    return false;
                    //保存错误
                    
                }         
            }
            catch  (Exception $e){               
            }    
        }
        return false;        
    }
    
    
    /**
     * Summary of extendSubscribe
     * 二维码推广设置
     * @param mixed $ticket 
     * @param mixed $openid 
     */
    public function extendSubscribe($wxid,$ticket,$uinfo)
    {
        //新推广的用户
        $modelTG=WechatNewUqrcode::findOne(['ticket'=>$ticket]);
        if($modelTG)
        {
            $modelQU=new WechatQrcodeUser();
            $modelQU->uid=$modelTG->userid;
            $modelQU->subuid=$uinfo->id;
            $modelQU->time=time();
            $modelQU->date=date("Y-m-d H:i:s");
            if($modelQU->save())
            {
                $modelUser=Wxuser::findOne($modelTG->userid);
                if($modelUser)
                {
                $money=0.5;
                $flag=    CashOption::changeSubscribe($modelTG->userid,$money);   
                if($flag !== false)
                {
                    //推广奖励消息
                    Template::sendTj($wxid,$modelUser->openid,$uinfo->nickname,round( floatval( $flag['change']),2),round( floatval( $flag['end']),2));
                }else{
                    //推广奖励消息
                    Template::sendTj($wxid,$modelUser->openid,$uinfo->nickname,'获取失败','获取失败');
                }
             
                }
                
            }
            
        }        
        return true;
    }
    
   
    
    /**
     * Summary of filterEmoji
     * 去除特殊表情符
     * @param mixed $str 
     * @return mixed
     */
    public  function filterEmoji($str)
    {
        $str = preg_replace_callback(
                '/./u',
                function (array $match) {
                    return strlen($match[0]) >= 4 ? '' : $match[0];
                },
                $str);

        if(empty($str))
        {
            $str="FQ".uniqid();
        }

        return $str;
    }

}