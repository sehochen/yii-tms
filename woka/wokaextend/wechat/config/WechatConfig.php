<?php
namespace wokaextend\wechat\config;

use yii;
use common\models\common\wechat\WechatAccount;
/**
 * Summary of WechatConfig
 * 获取公众号配置
 * 
 * @author vanzer
 * @deprec date:2018-6-6 10:39:26
 */
class WechatConfig{
  /**
   * Summary of getCongfig
   * 获取微信配置信息
   * @param mixed $wxid 
   * @return mixed
   */
  public  static  function  getCongfig($wxid=1,$update=false)
  {
      $cacheWX=yii::$app->cacheWX;
      $configWX = $cacheWX->get('WXConfig-'.$wxid);
      if ($configWX === false  || $update === true) {
          $modelAccount=WechatAccount::findOne($wxid);
          if(!$modelAccount)
          {
              die("QIYO Get WXConfig Error !");
          }
          $configWX=$modelAccount->attributes;
          $cacheWX->set('WXConfig', $configWX);      }      return $configWX;
  }
    
  public static function getToken($wxid=1)
  {
      $config=self::getCongfig($wxid);  
      return $config['wechatToken'];      
  }  
  /**
   * Summary of getAPPID
   * 返货公众号APPID
   * @param mixed $wxid 
   * @return mixed
   */
  public static function getAPPID($wxid=1)
  {
      $config=self::getCongfig($wxid);   
      return $config['wechatAPPID'];
  }
  
  /**
   * Summary of clear
   * 清空缓存
   * @param mixed $wxid 
   * @return mixed
   */
  public static function clear($wxid=0)
  {
      $cacheWX=yii::$app->cacheWX;
      if($wxid == 0)
      {         
          $cacheWX->flush();
      }else{
          $cacheWX->delete('WXConfig-'.$wxid);
      }     
      return true;      
  }
    
}