<?php
namespace wokaextend\wechat;

use yii;
use wokaextend\wechat\config\WechatConfig;

class AccessToken{

    /**
     * 获取微信Access_Token
     */
    public static function getAccessToken($id){
        //检测本地是否已经拥有access_token，并且检测access_token是否过期
        $accessToken = self::_checkAccessToken($id);
        if($accessToken === false){
            $accessToken = self::_getAccessToken($id);
        }
        return $accessToken['access_token'];
    }

    /**
     * @descrpition 从微信服务器获取微信ACCESS_TOKEN
     * @return Ambigous|bool
     */
    private static function _getAccessToken($id){
        //获取配置
        $congifWX=WechatConfig::getCongfig($id);       
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$congifWX['wechatAPPID'].'&secret='.$congifWX['wechatAPPSecret'];
        $accessToken = Curl::callWebServer($url, '', 'GET');   
        if(!isset($accessToken['access_token'])){
            return Msg::returnErrMsg(MsgConstant::ERROR_GET_ACCESS_TOKEN, '获取ACCESS_TOKEN失败base');
        }
        $accessToken['time'] = time();
        $accessTokenJson = json_encode($accessToken);
        //存储到缓存
        $cacheWX=yii::$app->cacheWX;
        $cacheWX->set('access_token-'.$id,$accessTokenJson);        
        return $accessToken;
    }

    /**
     * @descrpition 检测微信ACCESS_TOKEN是否过期
     *              -10是预留的网络延迟时间
     * @return bool
     */
    private static function _checkAccessToken($id){
        $cacheWX=yii::$app->cacheWX;
        $data=$cacheWX->get('access_token-'.$id);
        if($data === false)
        {
            return false;
        }
        if(!empty($accessToken['value'])){
            $accessToken = json_decode($accessToken['value'], true);
            if(time() - $accessToken['time'] < $accessToken['expires_in']-10){
                return $accessToken;
            }
        }
        return false;
    }
}
?>