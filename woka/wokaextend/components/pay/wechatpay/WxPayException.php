<?php
namespace wokaextend\components\pay\wechatpay;

use Yii;
use yii\log\FileTarget; 
/**
 * 
 * 微信支付API异常类
 * @author widyhu
 *
 */
class WxPayException  {


    public function  __construct($str='') 
    {

        
        $log = new FileTarget();        
        $logName=date("Y-m-d",time());               
        $log->logFile = Yii::getAlias('@webbase') .'/paylog/payLog'.$logName.'.log'; //文件名自定义
        $log->messages[] = [$str,1,'微信支付11error22',time()];
        $log->export();   
        echo $str;
        exit;
    }

	public function errorMessage()
	{
		return $this->getMessage();
	}
}
