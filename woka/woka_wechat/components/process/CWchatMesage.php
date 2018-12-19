<?php
namespace  wechat\components\process;

use yii;
use yii\base\Object;
use common\models\common\wechat\WechatSubscribe;
use  wokaextend\wechat\ResponsePassive;

class  CWchatMesage  extends Object
{

    public function getSubscribeMessage()
    {
        $wxid=WXID;
        $modelSub=WechatSubscribe::findOne(['wx_id'=>$wxid]);
        if($modelSub && $modelSub->type != 0)
        {
            switch( $modelSub->type)
            {
                case 1:
                    
                    break;  
                default:
                    break;
            }
            
            
        }else{
        
        }       
        
    }
 
  
}