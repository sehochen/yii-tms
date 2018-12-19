<?php
namespace  wechat\components;

use yii;
use  wokaextend\wechat\ResponsePassive;
use  wechat\components\process\CWechatSubscribeDo;
use common\models\common\wechat\WechatText;
use wechat\components\template\Template;

/**
 * 关注操作消息分发实际处理类
 * @author vanzer
 *  date:2016-08-18 02:22:56
 */
class WCOptionSubscribe{    
    
    /**
     * @descrpition 普通关注
     * @param $request
     * @return array
     */
    public static function eventSubscribe(&$request){
          //保存||更新关注用户信息     
        return  CWechatSubscribeDo::doSubscribeText($request['fromusername'], $request['tousername']);
    }

    /**
     * @descrpition 扫描二维码关注（未关注时）
     * @param $request
     * @return array
     */
    public static function eventQrsceneSubscribe(&$request){
        
        return   CWechatSubscribeDo::doSubscribeText($request['fromusername'], $request['tousername'],$request['ticket']); 
    }


    /**
     * @descrpition 取消关注
     * @param $request
     * @return array
     */
    public static function eventUnsubscribe(&$request){
        $content = '为什么不理我了？';
        return ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
    }

}
