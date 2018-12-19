<?php
namespace frontend\components\project;

use Yii;
use frontend\components\project\SysLog;
use common\models\project\Wxuser;
use common\models\project\CashLog;
use common\models\project\WithdrawCash;
use frontend\components\project\CashProcess;
use yii\helpers\Json;
use frontend\components\project\Common;
use common\models\project\Qylogsend;
use wokaextend\components\pay\wechatpay\wxQiYe;
use wechat\components\template\Template;


/**
 * Summary of Woka
 * 基础操作
 * 
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class DakaCash
{
    /**
     * Summary of getUserMoney
     * 返回用户金额
     * @param mixed $uid 
     * @return mixed
     */
    public static function getUserMoney($uid)
    {
        $modelUser=Wxuser::find()->select("current_money")->where("id =".$uid)->one();
        if($modelUser)
        {
            return $modelUser->current_money;
        }
        return 0;

    }
  
    /**
     * Summary of getCashLog
     * 查看用户资产记录
     * @param mixed $uid 
     * @param mixed $type 
     * @param mixed $page 
     */
    public static function  getCashLog($uid,$page=1)
    {    
        $arrData=[];
        //检索缓存
        $cache=Yii::$app->cache;     
        $cacheRank=$cache->get("cashlog".$uid.'-'.$page);
        //如果存在则返回缓存
        if($cacheRank)
        {
            return $cacheRank;
        }           
            $pageNum=20;
            $beginId=($page-1)*$pageNum;
            $modelCashLogList=CashLog::find()->where('uid ='.$uid)
            ->orderBy("id desc")
            ->offset($beginId)
            ->limit($pageNum)
            ->all();          
            if($modelCashLogList)
            {
                foreach($modelCashLogList as $rowDataModel)
                {
                    $rowData=[];
                    $rowData["date"]=$rowDataModel->change_date;
                    $rowData["content"]=$rowDataModel->content;
                    $rowData["change_money"]=$rowDataModel->change_money;
                    $arrData[]= $rowData;
            
                }
            }
            //设置缓存10秒
            $cache->set("cashlog".$uid.'-'.$page,$arrData,10);           
           
        return $arrData;
    }

    /**
     * Summary of addWithdrawCash
     * 添加提现 
     */
    public static function addWithdrawCash($uid,$money,$wechat,$tel,$openid)
    {
      
        $money=floatval($money);
        
        $content='提现';
        //提现金额小于最小提现限制
        if($money < Yii::$app->params["minWithdrawCash"])
        {
            $content='提现申请提交-小于最小提现金额，用户id【'.$uid.'】提现金额【'.$money.'】';
            SysLog::addError($content,100);          
            return  '小于最小提现金额'; 
        }

        $subFlag=CashProcess::subUserMoney($uid,$money,$content,49);
        if($subFlag === true)
        {
            $modelWithdraw=new WithdrawCash();
            $modelWithdraw->uid=$uid;
            $modelWithdraw->money=$money;
            $modelWithdraw->wechat=$wechat;
            $modelWithdraw->tel=$tel;
            $modelWithdraw->status=0;
            $modelWithdraw->openid=$openid;
            $modelWithdraw->time=time();
            if($modelWithdraw->save())
            {
                $content='提现申请提交，用户id【'.$uid.'】提现金额【'.$money.'】';
                SysLog::addError($content,100);
                /****/
             
               $modelQY=new  wxQiYe();
               $trade_no = date('YmdHis').mt_rand(10000,99999); 
               
               //收取百分之一手续费
               $realMoney=$money * 0.99;        
             //    $realMoney=$money;   			   
               $realMoney=   round($realMoney,2);  
               //发送企业付款
               $res = $modelQY->pay( $modelWithdraw->openid,$trade_no,$realMoney,'早起分钱提现【'.$money.'】收取1%手续费，实际到账【'.$realMoney.'】。');  
               //添加红包记录
             $flagStatus=  self::setLog($res,$money,$uid,$trade_no);
             if($flagStatus === true)
             {
                 $modelWithdraw->status=1; 
                 $modelWithdraw->save();
                 return true;
             }else{
                 return  '微信领取到账失败，请联系客服';
             }
                    // exit();
               
               
                return true;
            }else{
                $content='提现申请保存错误，用户id【'.$uid.'】提现金额【'.$money.'】';
                
                SysLog::addCashError($content,99);
                return  '提现申请保存错误';
            }
        }else{
            //错误日志
            $content='修改用户金额错误请查看系统错误日志【49】，用户id【'.$uid.'】'.$subFlag;
            SysLog::addCashError($content,1);
            return $subFlag;
        }
        return  '未处理';
    }

    
    
    /**
     * Summary of setLog
     * 设置提现记录
     * @param mixed $info 
     */
    public static function setLog($info,$money,$uid,$trade_no)
    {
        $flag=false;
        $modelLog=new Qylogsend();
        $modelLog->uid=$uid;
        $modelLog->money=$money;
        $modelLog->time=time();
        $modelLog->date=date("Y-m-d H:i::s");
        
        if(is_array($info) && isset($info['return_code']) && $info['return_code'] == 'SUCCESS')
        {       
            $flag=true;
            $modelLog->status=1;
        }else{
            $modelLog->status=0;
        }  
       
        $modelLog->info=Json::encode($info);
        $modelLog->ordersn=$trade_no;        
        $modelLog->save();
        return $flag;
    }
    
    
}
