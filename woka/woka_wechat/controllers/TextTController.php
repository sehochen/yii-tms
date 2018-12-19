<?php
namespace wechat\controllers;
use Yii;
use wokaextend\WCController;
use wokaextend\wechat\Wechat; 
use wokaextend\wechat\config\WechatConfig;
use frontend\modules\three\components\wechat\Template;

class TextTController extends WCController
{
    public function actions()
    {
        $objTem=new Template();
        
        $objTem->sendThreeJoin(1,'oPSaK1ZxITRycWqeqocPLvpsVCyY','goods',3,0.56,1);
        exit;
    }
}
