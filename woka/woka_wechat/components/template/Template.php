<?php
namespace  wechat\components\template;

use yii;
use yii\base\Object;
use wokaextend\wechat\TemplateMessage;

class  Template  extends Object
{    
    /**
     * Summary of sendChangeMoney
     * @param mixed $wxid 
     * @param mixed $openid 
     * @param mixed $tel 
    {{first.DATA}}
    推荐用户：{{keyword1.DATA}}
    注册用户：{{keyword2.DATA}}
    时间：{{keyword3.DATA}}
    {{remark.DATA}}
     */
    public static function  sendTj($wxid,$openid,$user,$changeMoney,$endMoney)
    {        
        $data = array(
               'first'=>array('value'=>"您推荐的用户【".$user."】绑定成功！", 'color'=>'#0A0A0A'),
               'keyword1'=>array('value'=>'We鱼平台用户', 'color'=>'#0A0A0A'),
               'keyword2'=>array('value'=>$user, 'color'=>'#0A0A0A'),     
               'keyword3'=>array('value'=>$changeMoney, 'color'=>'#0A0A0A'),     
               'keyword4'=>array('value'=>$endMoney, 'color'=>'#0A0A0A'),     
               'keyword5'=>array('value'=>'推荐用户赢奖励活动！', 'color'=>'#0A0A0A'),     
               'remark'=>array('value'=>'变动详情可在【个人中心-资金明细】查看！感谢您对【We鱼平台】的支持！点击查看详情！', 'color'=>'#173177'),
           );  

      TemplateMessage::sendTemplateMessage($wxid,$data,$openid,'lnqGoVcry6Vrh-Ohn1RhYsQ_tgVrVIjrWW-JqfXEs0Y','http://weyu.iqiyo.top/three/', $topcolor='#FF0000');
    
    }
    
    
    
	
}