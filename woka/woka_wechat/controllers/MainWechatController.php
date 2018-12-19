<?php
namespace wechat\controllers;
use Yii;
use wokaextend\WCController;
use wokaextend\wechat\Wechat; 
use wokaextend\wechat\config\WechatConfig;


class MainWechatController extends WCController
{
    public $layout=false;
  
   //主微信号处理接口
    public function actionIndex()
    {    
        $wxid=Yii::$app->request->get('id');
        if(! $wxid)
        {
            $wxid=1;
        }
        //微信处理接口
        $wokav_wechat=new Wechat(WechatConfig::getToken($wxid), false);
        //判断是否为微信绑定验证信息
        if(!$wokav_wechat->isValid())
        {
            echo $wokav_wechat->run();
        }else
        {
            $wokav_wechat->checkSignature(WechatConfig::getToken($wxid));
        }
        //结束继续执行
        die();
    }   
    
 
}
