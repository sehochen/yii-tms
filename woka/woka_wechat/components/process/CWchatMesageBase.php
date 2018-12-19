<?php
namespace  wechat\components\process;

use yii;
use yii\base\Object;
use common\models\common\wechat\WechatText;
use common\models\common\wechat\WechatImage;
use common\models\common\wechat\WechatMusic;
use common\models\common\wechat\WechatVoice;

class  CWchatMesageBase  extends Object
{
    public function getMessage($mid)
    {
        $modelT=WechatText::findOne($mid);
        if($modelT)
        {
            return $modelT->text;
        }
        return false;        
    }

    
    public function getImageOrVoice($mid,$type=1)
    {
        if($type == 1)
        {
            $modelM=WechatImage::findOne($mid);
        }else{
            $modelM=WechatVoice::findOne($mid);
        }

        if($modelM)
        {
            return $modelM->media_id;
        }
        return false;           
    }
   
    public function getMusic($mid)
    {
        
    }
}