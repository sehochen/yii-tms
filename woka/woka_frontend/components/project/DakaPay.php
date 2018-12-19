<?php
namespace frontend\components\project;

use Yii;
use common\models\project\PayOrder;
use common\models\project\DakaBase;
use common\models\project\DakaTen;
use common\models\project\DakaHundred;
use common\models\project\Wxuser;
use wokaextend\components\pay\wechatpay\JsApiPay;
use wokaextend\components\pay\wechatpay\WxPayUnifiedOrder;
use wokaextend\components\pay\WxPayConfig;
use wokaextend\components\pay\wechatpay\WxPayApi;
use frontend\components\project\SysLog;
use frontend\components\project\Common;
use yii\log\FileTarget; //文件日志
use common\models\project\Expay;

/**
 * Summary of DakaPay
 * 打卡支付类 
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class DakaPay
{  

 /**
     * Summary of isCanDaka
     * 是否可打卡
     */
    public static function isCanDaka($uid,$type=1)
    {
        $modelDaka=null;
        if($type == 1)
        {
            $modelDaka =DakaBase::findOne(["userid"=>$uid]);
            
        }else if($type == 2)
        {            
            $modelDaka =DakaTen::findOne(["userid"=>$uid]);

        }else if($type == 3)
        {           
            $modelDaka =DakaHundred::findOne(["userid"=>$uid]);
        }

        if(!empty($modelDaka))
        {
            if($modelDaka->status == 1)
            {
                return true;
            }
            
        }
        return false;

    }




    /**
     * Summary of isCanPay
     * 打卡时间内是否可以支付
     * @param mixed $uid 
     * @return boolean
     */
    public static function isCanPay($uid)
    {
        $modelDakaBase=DakaBase::findOne(["userid"=>$uid]);
        
        if($modelDakaBase)
        {
            $flagtime=Common::getFlagtime();
            if($modelDakaBase->flagtime == $flagtime)
            {
                return true;
            }else
            {
                return false;
            }

        }
        return false;

    }



    /**
     * Summary of crateOrder
     * 新建支付订单
     * @param mixed $uid  用户id 
     * @param mixed $type  打卡类型
     * @return str  fasle str
     */
    public  static function crateOrder($uid,$type=1)
    {     
        $modelPayorder=new PayOrder();    
        $modelPayorder->uid=$uid;
        $modelPayorder->type=$type;
        if($type == 1)
        {
            //在配置里设置的一元
            $modelPayorder->money=Yii::$app->params["partakeMoney1"];            
        }else   if($type == 2)
        {
            $modelPayorder->money=Yii::$app->params["partakeMoney2"];
        }else   if($type == 3)
        {
            $modelPayorder->money=Yii::$app->params["partakeMoney3"];
        }else{
            $modelPayorder->money=1000;
        }
        $modelPayorder->ordersn=self::getNewSn();
        $modelPayorder->addtime=time();
        $modelPayorder->openid=Common::getOpenid();
        $modelPayorder->exopenid=Common::getExopenid();
        $modelPayorder->paystatus=0;
        if(!$modelPayorder->save()) 
        {
            SysLog::addError("创建订单错误！用户【".$uid."】",79);
            //错误系统
            return false;
        }
        return $modelPayorder->ordersn;
    }
    
    /**
     * Summary of createWxpayObj
     * 生成位置支付信息
     */
    public static function createWxpayObj($ordersn,$exopenid)
    {

        if(empty($ordersn))
        {
            //错误日志系统 80
            SysLog::addError("创建支付obj订单号查找失败【".$ordersn."】",80);
            return false;
        }
        $modelOrder=PayOrder::findOne(["ordersn"=>$ordersn]);      
        if(!$modelOrder)
        {
            //错误日志系统 80
            SysLog::addError("创建支付obj查找订单【".$ordersn."】",80);
            return false;
        }
        ini_set('date.timezone','Asia/Shanghai');
        $tools = new JsApiPay();
        $input = new WxPayUnifiedOrder();
        $body= "早起分钱";
        $input->SetBody($body);
        $input->SetAttach($body);
        $input->SetOut_trade_no($modelOrder->ordersn);
        //支付金额
        $amount=$modelOrder->money * 100;
        $input->SetTotal_fee($amount);
        $input->SetTime_start(date("YmdHis"));
        $input->SetGoods_tag($body."微信支付");
        $input->SetNotify_url(Yii::$app->params["wxnotify_url"]);
        $input->SetTrade_type("JSAPI");
         $input->SetOpenid($exopenid);      
        $order = WxPayApi::unifiedOrder($input);    
        $jsApiParameters = $tools->GetJsApiParameters($order);        
        return $jsApiParameters;
    }

    /**
     * Summary of actionPayEnd
     * 用户支付信息
     * @param mixed $ordersn 
     * @param mixed $money 
     */
    public static function actionPayEnd($ordersn,$money,$type=1)
    {
        $modelOrder=PayOrder::findOne(["ordersn"=>$ordersn]);
        if(!$modelOrder)
        {
            //错误日志系统 80
            SysLog::addError("查找不到订单【".$ordersn."】",80);
            return false;
        }else{
            if($modelOrder->money != $money)
            {
                //错误日志系统 80
                SysLog::addError("订单【".$ordersn."】应交金额【".$modelOrder->money."】实交金额【".$money."】",80);
                return false;
            }
            $modelOrder->paystatus =1;
			  if($type == 2)
            {
                $modelOrder->paystatus =2;
            }
            $modelOrder->paytime=time();
            if($modelOrder->save())
            {
                //基础打卡
                if($modelOrder->type == 1)
                {
                    $modelDakaBase=DakaBase::findOne(["userid" =>$modelOrder->uid]);
                    if(!$modelDakaBase)
                    {
                        $modelDakaBase=new DakaBase();
                        $modelDakaBase->userid=$modelOrder->uid;                     
                        $modelDakaBase->allmoney=0.00;
                        $modelDakaBase->last_daka_time=0;
                        $modelDakaBase->status=1;
						$modelDakaBase->number=0;
                        //用户信息
                        $modelUser=Wxuser::findOne($modelOrder->uid);                       
                        $modelDakaBase->headimgurl=$modelUser->headimgurl;
                        $modelDakaBase->nickname=$modelUser->nickname;
                        //新参加挑战,用户判断增加，推广奖励 2017-10-21
                        Promotion::tuiguangAdd($modelOrder->uid,$modelUser->nickname,1);
                       // $modelDakaBase->save();
                    }
                    $modelDakaBase->status=1;
                   // $modelDakaBase->number=0;
                    $modelDakaBase->begin_time=time();
                    $modelDakaBase->money=$money;					
                    $modelDakaBase->last_daka_time=0;
                    $modelDakaBase->exopenid=$modelOrder->exopenid;
                    if($modelDakaBase ->save())
                    {
                        return true;
                    }else{
                        //错误日志系统 80
                        SysLog::addError("支付订单，创建打卡权限失败！订单【".$ordersn."】",80);
                        return false;
                       
                    }

                }else  if($modelOrder->type == 2)
                {
                    $modelDakaTen=DakaTen::findOne(["userid" =>$modelOrder->uid]);
                    if(!$modelDakaTen)
                    {
                        $modelDakaTen=new DakaTen();
                        $modelDakaTen->userid=$modelOrder->uid;                     
                        $modelDakaTen->allmoney=0.00;
                        $modelDakaTen->last_daka_time=0;
                        $modelDakaTen->status=1;
						$modelDakaTen->number=0;
                        //用户信息
                        $modelUser=Wxuser::findOne($modelOrder->uid);                       
                        $modelDakaTen->headimgurl=$modelUser->headimgurl;
                        $modelDakaTen->nickname=$modelUser->nickname;
                        //新参加挑战,用户判断增加，推广奖励 2017-10-21
                        Promotion::tuiguangAdd($modelOrder->uid,$modelUser->nickname,2);
                        // $modelDakaBase->save();
                    }
                    $modelDakaTen->status=1;
                    // $modelDakaBase->number=0;
                    $modelDakaTen->begin_time=time();
                    $modelDakaTen->money=$money;					
                    $modelDakaTen->last_daka_time=0;
                    $modelDakaTen->exopenid=$modelOrder->exopenid;
                    if($modelDakaTen ->save())
                    {
                        return true;
                    }else{
                        //错误日志系统 80
                        SysLog::addError("支付订单，创建打卡权限失败！订单【".$ordersn."】",80);
                        return false;
                        
                    }

                }else   if($modelOrder->type == 3)
                {
                    $modelDakaTen=DakaHundred::findOne(["userid" =>$modelOrder->uid]);
                    if(!$modelDakaTen)
                    {
                        $modelDakaTen=new DakaHundred();
                        $modelDakaTen->userid=$modelOrder->uid;                     
                        $modelDakaTen->allmoney=0.00;
                        $modelDakaTen->last_daka_time=0;
                        $modelDakaTen->status=1;
						$modelDakaTen->number=0;
                        //用户信息
                        $modelUser=Wxuser::findOne($modelOrder->uid);                       
                        $modelDakaTen->headimgurl=$modelUser->headimgurl;
                        $modelDakaTen->nickname=$modelUser->nickname;
                        //新参加挑战,用户判断增加，推广奖励 2017-10-21
                        Promotion::tuiguangAdd($modelOrder->uid,$modelUser->nickname,3);
                        // $modelDakaBase->save();
                    }
                    $modelDakaTen->status=1;
                    // $modelDakaBase->number=0;
                    $modelDakaTen->begin_time=time();
                    $modelDakaTen->money=$money;					
                    $modelDakaTen->last_daka_time=0;
                    $modelDakaTen->exopenid=$modelOrder->exopenid;
                    if($modelDakaTen ->save())
                    {
                        return true;
                    }else{
                        //错误日志系统 80
                        SysLog::addError("支付订单，创建打卡权限失败！订单【".$ordersn."】",80);
                        return false;
                        
                    }

                }else{
                    //错误日志系统 80
                    SysLog::addError("未开通业务，请求错误！订单【".$ordersn."】",80);
                    return false;
                }

            }else
            {
                SysLog::addError("修改支付状态保存失败！订单【".$ordersn."】",80);
                return false;
                //错误系统 80
            }


        }

        return false;
    }

	/**
     * Summary of actionPayEnd
     * 云支付结束
     * @param mixed $params 
     */
    public static function actionPayEndYzf($params)
    {
       /**
        * 2017-10-25 01:19:18 [114.215.28.88][-][-][error][云支付end] [
    'amount' => '1',
    'buyerId' => 'null',
    'channelFlag' => '00',
    'currency' => 'CNY',
    'merNo' => 'MS0000003672290',
    'notifyTime' => '20171024164402',
    'payTime' => '2017-10-24 16:44:02',
    'reqOrderId' => '5451SDS1508834603991zj-2',
    'termNo' => 'null',
    'transId' => '20171024164325687572',
    'uuid' => 'oa7tkwtrPX4o4THGjngciuAoGfDA|||oJVLwwkPiYNdo73Aj_Ay-ZrWIEpk',
    'signOut' => '6567B0D8FE421A99F37F0DAF0DB2D4E0'
]*/

       $modelExpay=Expay::findOne(["exordersn"=>$params['reqOrderId']]);
       if($modelExpay)
       {
              $modelExpay->paytime=time();
              $modelExpay->transid=$params['transId'];
              $modelExpay->termno=$params['termNo'];
              if($modelExpay->save())
              {
                  //支付完成调用
                  self::actionPayEnd($modelExpay->ordersn, intval($params['amount']) /100);
                  return true;
              }else{
                SysLog::addError("云支付保存订单信息错误！订单【".$ordersn."】",79);
                return false;
              }
           
       }else
       {
           SysLog::addError("云支付获取订单错误！订单【".$ordersn."】",79);
           return false;
       }
       return false;
    }




	
    /**
     * Summary of getNewSn
     * 生成新订单
     * @return string
     */
    public static function getNewSn()
    {
         return date('Ymd').uniqid(). str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
    }


}
