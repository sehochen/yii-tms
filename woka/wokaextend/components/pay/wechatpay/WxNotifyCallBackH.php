<?php
namespace wokaextend\components\pay\wechatpay;

use yii;
use yii\log\FileTarget; 
use wokaextend\components\pay\wechatpay\WxPayNotify;
use frontend\modules\huaju\components\CHuaju;

class WxNotifyCallBackH extends WxPayNotify
{
	//查询订单
	public function Queryorder($transaction_id)
	{
		$input = new WxPayOrderQuery();
		$input->SetTransaction_id($transaction_id);
        
		$result = WxPayApi::orderQuery($input);     
        
        //	Log::DEBUG("query:" . json_encode($result));  
		if(array_key_exists("return_code", $result)
			&& array_key_exists("result_code", $result)
			&& $result["return_code"] == "SUCCESS"
			&& $result["result_code"] == "SUCCESS")
		{                   
            /****      
            {
            "appid": "wx426b3015555a46be", 
            "attach": "test", 
            "bank_type": "CFT", 
            "cash_fee": "1", 
            "fee_type": "CNY", 
            "is_subscribe": "Y", 
            "mch_id": "1900009851", 
            "nonce_str": "YdcUMBIUpZWkEaEc", 
            "openid": "oHZx6uAoyCLLCAwYNUqbTGjhFMeo", 
            "out_trade_no": "190000985120160925132216", 
            "result_code": "SUCCESS", 
            "return_code": "SUCCESS", 
            "return_msg": "OK", 
            "sign": "B6AFEB766239479D18C44F8D611FBF9D", 
            "time_end": "20160925132030", 
            "total_fee": "1", 
            "trade_state": "SUCCESS", 
            "trade_type": "NATIVE", 
            "transaction_id": "4005142001201609254882285416"
            }            
             * */
            
            //支付完成                
            
            //记录值日志2017-02-21
            $log = new FileTarget();        
            $logName=date("Y-m-d",time());               
            $log->logFile = Yii::getAlias('@webbase') .'/paylog/TpayLog'.$logName.'.log'; //文件名自定义
            $log->messages[] = [$result["out_trade_no"].($result["total_fee"]/100),1,'微信支付end',time()];
            $log->export();                
            //end
            
           // Pay::actionPayEnd($result["out_trade_no"],$result["total_fee"]/100);
            CHuaju::payEnd($result);            
			return true;
		}
		return false;
	}	
	//重写回调处理函数   先回调
	public function NotifyProcess($data, &$msg)
	{
        //	Log::DEBUG("call back:" . json_encode($data));
		$notfiyOutput = array();		
		if(!array_key_exists("transaction_id", $data)){
			$msg = "输入参数不正确";
			return false;
		}
		//查询订单，判断订单真实性
		if(!$this->Queryorder($data["transaction_id"])){
			$msg = "订单查询失败";
			return false;
		}
		return true;
	}
}
