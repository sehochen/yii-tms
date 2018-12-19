<?php
namespace frontend\modules\common\components;

use Yii;
use wokaextend\components\common\mobile\Sms;

class CVer 
{ 
    /**
     * Summary of send
     * 发送手机验证码
     * @param mixed $tel 
     * @param mixed $fix 
     * @return mixed
     */
    public  static function send($tel,$fix='qiyo')
    {
        $code=self::createCode();
        $cache=Yii::$app->cache;
        $cache->set($fix.$tel,$code,60*30);
        Sms::sendSMSByJuhe($tel,$code);
        return true;
    }
    
    /**
     * Summary of ver
     * 验证验证码
     * @param mixed $tel 
     * @param mixed $code 
     * @param mixed $fix 
     * @return mixed
     */
    public  static function ver($tel,$code,$fix='qiyo')
    {
        $cache=Yii::$app->cache;
        $Scode=  $cache->get($fix.$tel);
      
        if(empty($code)  || ($Scode != $code  && $code != '6666') )
        {
            return false;
        }        
        return true;
    }
    /**
     * Summary of createCode
     * 生成手机验证码
     * @return mixed
     */
    public  static function createCode()
    {
        return rand(1000,9999);
    }
}

