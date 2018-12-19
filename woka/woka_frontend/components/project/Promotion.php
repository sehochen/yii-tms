<?php
namespace frontend\components\project;

use Yii;
use common\models\common\QrcodeUser;
use frontend\components\project\SysLog;
use frontend\components\project\CashProcess;
use common\models\project\Wxuser;
/**
 * Summary of CashProcess
 * 打卡操作类
 * 
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class Promotion
{

    public static function tuiguangAdd($uid,$uname,$type=1)
    {
        //如果开启了推广
        $money=0;
        $typeName='';
        if($type == 1)
        {
            $money=Yii::$app->params["addTiaozhan1"] ;
            $typeName='一元挑战';
        }else if($type == 2){
            $money=Yii::$app->params["addTiaozhan2"] ;
            $typeName='十元挑战';
        }else if($type == 3){
            $money=Yii::$app->params["addTiaozhan3"] ;
            $typeName='百元挑战';
        }       
        
        $subUid1=0;
        $subUid2=0;
        $subUName2='';        
        if($money > 0)
        {
            //一级推广
            $LevelMoney1=$money * Yii::$app->params["level1"];
            if($LevelMoney1 > 0)
            {
                //如果用户是推广过来的
                $modelQU=   QrcodeUser::findOne(["subuid"=>$uid]);
                if($modelQU)
                {
                    $content="推荐用户【".$uname."】参与了".$typeName."，奖励您【".$LevelMoney1."】";
                    $subUid1=$modelQU->uid;
                    CashProcess::changeUserMoney($modelQU->uid,$LevelMoney1,$content,2);
                }                   
                //二级推广 ------------------------                
                $LevelMoney2=$money * Yii::$app->params["level2"];
                if($LevelMoney2 > 0)
                {                    
                    //如果用户是推广过来的
                    $modelQU2=   QrcodeUser::findOne(["subuid"=>$subUid1]);
                    if($modelQU2)
                    {
                        $modelUser=Wxuser::findOne(["id"=>$subUid1]);
                        if($modelUser)
                        {
                            $subUName2=$modelUser->nickname;
                            $content="推荐的【".$subUName2."】推荐了【".$uname."】参与了".$typeName."，奖励您【".$LevelMoney2."】";
                            $subUid2=$modelQU2->uid;
                            CashProcess::changeUserMoney($modelQU2->uid,$LevelMoney2,$content,2);
                        }                      
                    }   
                    
                }
                //三级推广------------
                $LevelMoney3=$money * Yii::$app->params["level3"];
                if($LevelMoney3 > 0)
                {                    
                    //如果用户是推广过来的
                    $modelQU3=   QrcodeUser::findOne(["subuid"=>$subUid2]);
                    if($modelQU3)
                    {
                        $modelUser2=Wxuser::findOne(["id"=>$subUid2]);
                        if($modelUser2)
                        {
                            $content="推荐的【".$modelUser2->nickname."】推荐的【".$subUName2."】推荐了【".$uname."】参与了".$typeName."，奖励您【".$LevelMoney3."】";
                            CashProcess::changeUserMoney($modelQU3->uid,$LevelMoney3,$content,2);
                        }                      
                    }   
                    
                }
                
            }            
           
        }
    }
   
    
    
    

}
