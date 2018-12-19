<?php
namespace wechat\controllers;
use Yii;
use wokaextend\WCController;
use wokaextend\wechat\Wechat;
use wokaextend\wechat\UserManage;
use wokaextend\wechat\Menu;
use wokaextend\jiesi\wechatoption;
use common\models\wechat\user\WechatUsers;
use wechat\components\CWechatUser;
use common\models\wokaa\PublicWechat;
use common\models\woka\user\ScanLogin; //扫码登录

class BaseWechatController extends WCController
{
    
    public $layout=false;
    //页面初始化-加载主微信配置
    public  function init()
    {
        define("WECHAT_URL", yii::$app->params['mainWechat']['wechatUrl']);
        define('ENCODING_AES_KEY', yii::$app->params['mainWechat']['encodingAesKey']);
        define("WECHAT_MAIN", yii::$app->params['mainWechat']['wechatMain']);
        define('WECHAT_TOKEN', yii::$app->params['mainWechat']['wechatToken']); //微信Token值
        define("WECHAT_APPID", "test");
        define("WECHAT_APPSECRET", yii::$app->params['mainWechat']['wechatAPPSecret']);
    }

    
    
    //页面初始化-加载主微信配置
    
    public function actionIndex()
    {
    
        
        //用户绑定的微信平台-
        $wokaaID=Yii::$app->request->get("wokaaId");  
        $wechatConfig=self::getWechatConfig($wokaaID,true);
        
        if($wechatConfig === false)
        {
            return "获取失败";
        } 
        //微信处理接口
        $wokav_wechat=new Wechat($wechatConfig["token"], false);
        //判断是否为微信绑定验证信息
        if(!$wokav_wechat->isValid())
        {
            echo $wokav_wechat->run();
        }else
        {      
            //内置输出-在这不需要echo
           $wokav_wechat->checkSignature($wechatConfig["token"]);
        }
        //结束继续执行
        die();
    }
    /** 
     * Summary of getWechatConfig 获取微信配置信息
     * @param mixed $wechatId  
     * @param mixed $update  bool 是否更新
     * @return mixed
     */
    public  function  getWechatConfig($wechatId,$update=false)
    {
        $cache = Yii::$app->cache;         
        $data = $cache->get('wokaa-wechat-'.$wechatId); 
        if($data === false || $update)
        {
            $modelPublicWechat= PublicWechat::findOne($wechatId);
            if($modelPublicWechat)
            {
                $data["name"]=$modelPublicWechat->public_name;
                $data["uid"]=$modelPublicWechat->uid;
                $data["token"]="WOKA_A_V";
                $data["appId"]=$modelPublicWechat->appid;
                $data["secret"]=$modelPublicWechat->secret;
                $data["encodingaeskey"]=$modelPublicWechat->encodingaeskey;
                $data["tokenStr"]=$modelPublicWechat->token_str;
                $data["tokenTome"]=$modelPublicWechat->token_time;   
                //永久缓存
                $cache->set('wokaa-wechat-'.$wechatId, $data, 0); 
            } 
        }  
        return $data;
    }
    
}
