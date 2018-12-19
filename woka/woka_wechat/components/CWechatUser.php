<?php
namespace  wechat\components;

use yii\base\Object;
use wokaextend\wechat\UserManage;
use  common\models\common\user\Wxuser;
use  common\models\common\user\UserExtend;
use  yii\helpers\Json;

class  CWechatUser  extends Object
{

    public function init()
    {

    }
/**
 *存储||更新用户信息
 * @param unknown $openid 用户唯一标识
 */
   public  static  function saveUserInfoByOpenid($openid) {
       //保存更新微信用户信息
       $wechatUserinfo= UserManage::getUserInfo($openid);

       $modelWechatUser= Wxuser::findOne(array('openid'=>$openid));
      //是否存在老用户，存在则进行资料更新
       if($modelWechatUser)
       {
           $modelWechatUser->openid=$wechatUserinfo['openid'];
           $modelWechatUser->sex=$wechatUserinfo['sex'];
           $modelWechatUser->nickname=$wechatUserinfo['nickname'];
           $modelWechatUser->city=$wechatUserinfo['city'];
           $modelWechatUser->province=$wechatUserinfo['province'];
           $modelWechatUser->country=$wechatUserinfo['country'];
           $modelWechatUser->headimgurl=$wechatUserinfo['headimgurl'];
           $modelWechatUser->issubscribe=1;      
           $modelWechatUser->update();
       }else{
           //新用户-则新初始化对象
           $modelWechatUser->openid=$wechatUserinfo['openid'];
           $modelWechatUser->sex=$wechatUserinfo['sex'];
           $modelWechatUser->nickname=$wechatUserinfo['nickname'];
           $modelWechatUser->city=$wechatUserinfo['city'];
           $modelWechatUser->province=$wechatUserinfo['province'];
           $modelWechatUser->country=$wechatUserinfo['country'];
           $modelWechatUser->headimgurl=$wechatUserinfo['headimgurl'];
           $modelWechatUser->issubscribe=1;           
           $modelWechatUser->addtime=time();
     
           if( $modelWechatUser->save())
           {
               $modelUE=new UserExtend();
               $modelUE->uid=$modelWechatUser->id;
               
           }
           
       }
       //返回存储的用户信息
       return true;
   }

}