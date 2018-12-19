<?php
namespace frontend\components\project;

use Yii;
use common\models\project\CashLog;
use common\models\project\Wxuser;
use frontend\components\project\SysLog;
use wechat\components\template\Template;

/**
 * Summary of CashProcess
 * 打卡操作类
 * 
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class CashProcess
{
    /**
     * Summary of changeUserMoney
     * @param mixed $uid 
     * @param mixed $money 
     * @param mixed $content 
     * @param mixed $type 
     * @return mixed  失败返回false   成功返回openid  发送消息通知
     */
    public static  function  changeUserMoney($uid,$money,$content,$type=50)
    {
        $modelUser=Wxuser::findOne($uid);
        if($modelUser)
        {
            //资金变动类
            $modelCash=new CashLog();
            $modelCash->before_money= $modelUser->current_money;
            $modelCash->change_money=$money;
            //资金变动
            $modelUser->current_money= $modelUser->current_money + $money;
            if($modelUser->save())
            {
               
                $modelCash->uid=$uid;
                $modelCash->change_date=date("Y-m-d H:i:s");
                $modelCash->time=time();
                $modelCash->content=$content;
                $modelCash->type=$type;
                if($modelCash->save())
                {
					
					 //提现失败资金退还
                    if($type == 110)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='提现失败资金退还。';
                        $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,$cashBalance,$remark);
                        unset( $tmp);
                    }
                    
					
					  //班级打卡奖励
                    if($type == 7)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='约定打卡奖励已发放到平台余额,请查收。';
                        $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,$cashBalance,$remark);
                        unset( $tmp);
                    }
                    //班级毕业奖励
                    if($type == 8)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='约定结束返还已发放到平台余额,请查收。';
                        $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,$cashBalance,$remark);
                        unset( $tmp);
                    }
					
					 //1元打卡奖励
                    if($type == 9)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='今日1元打卡奖励发放到余额,请查收。';
                        $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,$cashBalance,$remark);
                         unset( $tmp);
                    }
                    //10元打卡奖励
                    if($type == 10)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='今日10元打卡奖励发放到余额,请查收。';
                        $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,$cashBalance,$remark);
                         unset( $tmp);
                    }
					
					  //百元元打卡奖励
                    if($type == 12)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='今日百元打卡奖励发放到余额,请注意查收。';
                        try {
                            $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,'￥'.($cashBalance),$remark);
                        }catch(Exception $e)
                        { }
                        unset( $tmp);
                    }
					
					if($type == 2)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='奖励已发放到余额,请注意查收。';
                        try {
                            $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,'￥'.($cashBalance),$remark);
                        }catch(Exception $e)
                        { }
                     
                        unset($tmp);
                    }
                    if($type == 3)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='奖励已发放到余额,请注意查收。';
                        try {
                            $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,'￥'.($cashBalance),$remark);
                        }catch(Exception $e)
                        { }
                     
                        unset($tmp);
                    }
					 if($type == 1)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='奖励已发放到余额,请注意查收。';
                        try {
                            $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,'￥'.($cashBalance),$remark);
                        }catch(Exception $e)
                        { }
                     
                        unset($tmp);
                    }
                    //发送用户消息通知
                    return $modelUser->openid;
                    
                }else{
                    //日志系统
                    SysLog::addError("添加用户金额变动日志失败。用户id【".$uid."】修改前金额【".$modelUser->current_money."】变动金额【".$money."】",50);
                    return false;
                }

            }else
            {
                //日志系统
                SysLog::addError("修改金额失败用户id【".$uid."】修改前金额【".$modelUser->current_money."】变动金额【".$money."】",50);
                return false;
            }            
        }else{
            //日志系统
            SysLog::addError("修改金额，查询用户失败用户id【".$uid."】",50);
            return false;
        }


    }
	
	
	  /**
     * Summary of subUserMoney
     * @param mixed $uid 用户
     * @param mixed $money 金额
     * @param mixed $content  内容
     * @param mixed $type 类型
     */
    public static function subUserMoney($uid,$money,$content,$type=50)
    {
        $modelUser=Wxuser::findOne($uid);
        if($modelUser)
        {

            if(  $modelUser->current_money < $money)
            {
                //资金小于可操作金额
                SysLog::addError("减少金额失败用户id【".$uid."】修改前金额【".$modelUser->current_money."】提现金额【".$money."】",49);
                return '用户余额不足';
              
            }

            //资金变动类
            $modelCash=new CashLog();
            $modelCash->before_money= $modelUser->current_money;
            $modelCash->change_money=-$money;
            //资金减少变动
            $modelUser->current_money= $modelUser->current_money - $money;
            if($modelUser->save())
            {
                
                $modelCash->uid=$uid;
                $modelCash->change_date=date("Y-m-d H:i:s");
                $modelCash->time=time();
                $modelCash->content=$content;
                $modelCash->type=$type;
                if($modelCash->save())
                {
                    //10为用户10元打卡提现
                    if($type == 10)
                    {
                        $tmp = new Template();
                        $openid=$modelUser->openid;
                        $content=$content;                  
                        $type='当前';
                        $cashBalance=$modelUser->current_money;
                        $remark='已经转到您的微信钱包【余额】,请查收。';
                        $tmp->sendMoneyChange($openid,'￥'.(-$money),$content,$type,$cashBalance,$remark);
                    }

                    //发送用户消息通知
                    return  true;
                   // return $modelUser->openid;
                    
                }else{
                    //日志系统
                    SysLog::addError("提现金额变动日志失败。用户id【".$uid."】修改前金额【".$modelUser->current_money."】变动金额【".$money."】",49);
                    return '提现金额变动日志失败';
                }

            }else
            {
                //日志系统
                SysLog::addError("提现金额失败用户id【".$uid."】修改前金额【".$modelUser->current_money."】变动金额【".$money."】",49);
                return '提现金额失败';
               
            }            
        }else{
            //日志系统
            SysLog::addError("提现金额，查询用户失败用户id【".$uid."】",49);
            return '获取用户信息失败';
           
        }
        
    }


    /**
     * Summary of logUserMoney
     * 金额变动-
     * @param mixed $uid  
     * @param mixed $money 
     * @param mixed $content 
     * @param mixed $type  50为随机发放金额不动余额
     * @return mixed
     */
    public static  function  logUserMoney($uid,$money,$content,$type=50)
    {
        $modelUser=Wxuser::findOne($uid);
        if($modelUser)
        {
            //资金变动类
            $modelCash=new CashLog();
            $modelCash->before_money= $modelUser->current_money;
            $modelCash->change_money=$money;
            //资金变动      
           
                $modelCash->uid=$uid;
                $modelCash->change_date=date("Y-m-d H:i:s");
                $modelCash->time=time();
                $modelCash->content=$content;
                $modelCash->type=$type;
                if($modelCash->save())
                {
                    //发送用户消息通知
                  
                    //一元随机打卡发送通知
                    $tmp = new Template();
                    $openid=$modelUser->openid;
                    $content=$content;                  
                    $type='当前';
                    $cashBalance=$modelUser->current_money;
                    $remark='已经转到您的微信钱包【余额】,请查收。';
                    $tmp->sendMoneyChange($openid,'￥'.($money),$content,$type,$cashBalance,$remark);
                    return $modelUser->openid;

                }else{
                    //日志系统
                   SysLog::addError("一元添加用户金额变动日志失败。用户id【".$uid."】修改前金额【".$modelUser->current_money."】变动金额【".$money."】",50);
                    return false;
                }
       
        }else{
            //日志系统
            SysLog::addError("修改金额，查询用户失败用户id【".$uid."】",50);
            return false;
        }
    }   
  
}
