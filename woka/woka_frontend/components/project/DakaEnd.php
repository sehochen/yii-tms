<?php
namespace frontend\components\project;

use Yii;
use common\models\project\Wxuser;
use frontend\components\project\SysLog;
use frontend\components\project\CashProcess;
use common\models\project\DakaBaseEnd;
use common\models\project\DakaTenEnd;
use common\models\project\DakaHundredEnd;
use frontend\components\project\Promotion;
use common\models\project\DakaEndPlus;
use common\models\project\DakaBanjiEnd;

/**
 * Summary of DakaEnd
 * 打卡结束类
 * 
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class DakaEnd
{
	
	 
    /**
     * Summary of setTodayDakaPrize
     * 派发奖励
     * @param mixed $userid 
     * @param mixed $money 
     * @param mixed $type 

     */
    public static function setTodayBanjiPrize($userid,$money,$bjid,$title,$type=1)
    {
        $content="";
       
        if($type == 1)
        {
			if($money == 0)
			{
				 $content='您参加的【'.$title."】早起约定今天【没有人签到失败】！";
                 $flag=  CashProcess::changeUserMoney($userid,$money,$content,7);
			}else{
				
	            $content='您参加的【'.$title."】早起约定打卡奖励";
                $flag=  CashProcess::changeUserMoney($userid,$money,$content,7);
			}			
         
            //发奖信息-用户发奖-方便生成排行            
            
        }
        if($type == 2)
        {
            $content='【'.$title."】早起约定结束返还";
            $flag=  CashProcess::changeUserMoney($userid,$money,$content,8);         
                   
        }
        $modelBanjiEnd=new DakaBanjiEnd();
        $modelBanjiEnd->uid=$userid;
        $modelBanjiEnd->bjid=$bjid;
        $modelBanjiEnd->money=$money;
        $modelBanjiEnd->time=time();
        $modelBanjiEnd->date=date("Y-m-d H:i:s");
        $modelBanjiEnd->save();
    }
    

  

    /**
     * Summary of setTodayDakaPrize
     * 派发奖励
     * @param mixed $userid 
     * @param mixed $money 
     * @param mixed $type 

     */
    public static function setTodayDakaPrize($userid,$money,$type)
    {
         $content="";
         $flag=false;
        if($type == 1)
        {
               $content="用户一元随机打卡奖励";
	    	    $flag=  CashProcess::changeUserMoney($userid,$money,$content,9);
   
               //发奖信息-用户发奖-方便生成排行
               $modelDakaEnd=new DakaBaseEnd();
               $modelDakaEnd->uid=$userid;
               $modelDakaEnd->money=$money;
               $modelDakaEnd->time=time();
               $modelDakaEnd->date=date("Y-m-d H:i:s");
               $modelDakaEnd->save();
        }  else    if($type == 2)
            {
                $content="用户十元随机打卡奖励";
                //十元打卡添加
                $flag=  CashProcess::changeUserMoney($userid,$money,$content,10);
                //发奖信息-用户发奖-方便生成排行
                $modelDakaEnd=new DakaTenEnd();
                $modelDakaEnd->uid=$userid;
                $modelDakaEnd->money=$money;
                $modelDakaEnd->time=time();
                $modelDakaEnd->date=date("Y-m-d H:i:s");
                $modelDakaEnd->save();
        }  else    if($type == 3)
        {
            $content="用户百元随机打卡奖励";
            //十元打卡添加
            $flag=  CashProcess::changeUserMoney($userid,$money,$content,12);
            //发奖信息-用户发奖-方便生成排行
            $modelDakaEnd=new DakaHundredEnd();
            $modelDakaEnd->uid=$userid;
            $modelDakaEnd->money=$money;
            $modelDakaEnd->time=time();
            $modelDakaEnd->date=date("Y-m-d H:i:s");
            $modelDakaEnd->save();
        } 
            
        //发送    
        if(!$flag)
        {
            echo '打卡设置错误';
        }

    }
	
	
    /**
     * Summary of getDakaEndAdd
     * @param mixed $type  打卡类型
     * @return array|double|integer
     */
    public static function getDakaEndAdd($type=1)
    {
        $addList=[];
        $modelList=DakaEndPlus::find()->where(["type"=>$type,'isused'=>1])->all();
        if($modelList)
        {
            foreach($modelList as $row)
            {
                $rowAdd=[];
                $rowAdd["id"]=$row->id;
                $rowAdd["uid"]=$row->useid;
                $rowAdd["money"]=$row->money;
                $addList[]=$rowAdd;
            }

        }
        return $addList;
    }


    /**
     * Summary of applyEndAdd
     * @param mixed $uid 
     * @param mixed $modelAddList 
     * @param mixed $type 
     * @param mixed $isUsed 
     * @return mixed
     */
    public static function  applyEndAdd($uid,$modelAddList,$type=1,$isUsed=0)
    {
        $addMoney=0.00;    
        if(!empty($modelAddList))
        {
            foreach($modelAddList as $row)
            {
                if($row['uid'] == $uid)
                {
                   //修改发送状态
                    DakaEndPlus::updateAll(['isused'=>2,'usetime'=>time(),'useddate'=>date("Y-m-d H:i:s")],'id = '.$row['id']);
                    return $row['money'] ;
                }
            }            
        }
        return $addMoney;        
    }
  

    
}
