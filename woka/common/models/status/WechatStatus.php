<?php

namespace common\models\status;

use Yii;


class WechatStatus 
{
    public static function getWechatMenuType()
    {
        return [
            '0'=>'主菜单',
            'click'=>'点击事件',
            'view'=>'跳转',
         /*   'scancode_push'=>'扫一扫',
            'scancode_waitmsg'=>'扫码推事件且弹出“消息接收中”',
            'pic_sysphoto'=>'弹出系统拍照发图用户点击按钮',
            'pic_photo_or_album'=>'弹出拍照或者相册发图',
            'pic_weixin'=>'弹出微信相册发图器',
             'location_select'=>'弹出地理位置选择器',
             'media_id'=>'发送素材消息',
             'view_limited'=>'跳转图文消息',
             'miniprogram'=>'小程序',*/
            ];
    }
    
}
