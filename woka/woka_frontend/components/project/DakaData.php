<?php
namespace frontend\components\project;

use Yii;
use common\models\project\DakaResult;
use common\models\project\DakaRecordBase;
use common\models\project\DakaRecordTen;
use common\models\project\DakaRecordHundred;
use common\models\project\DakaBaseEnd;
use common\models\project\DakaTenEnd;
use common\models\project\DakaHundredEnd;

use frontend\components\project\Common;
use frontend\components\project\SysLog;
use common\models\project\Wxuser;
use common\models\project\DakaBase;
use common\models\project\DakaTen;
use common\models\project\DakaHundred;
/**
 * Summary of Daka
 * 打卡操作类
 * 
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class DakaData
{


    public static function getUseLevel($type=1)
    {
        $modelLevel=[];
        $dakaNum=0;
        $uid=Common::getUid();

        if($type == 1)
        {
            $modelLevel =DakaBase::findOne(["userid"=>$uid]);
        }else  if($type == 2){

            $modelLevel =DakaTen::findOne(["userid"=>$uid]);
        }else  if($type == 3){

            $modelLevel =DakaHundred::findOne(["userid"=>$uid]);
        }

        if($modelLevel)
        {
            $dakaNum=$modelLevel->number;
        }


        return $dakaNum;
    }
 /**
     * Summary of getDakaTop
     * 获取打卡top值
     * @param mixed $type 
     * @return mixed
     */
    public static function getDakaTopOne($type=1)
    {
        $arrTopOne=[];
        //     return $arrTop10;
        $cache=Yii::$app->cache;
        $cacheTopOne=$cache->get("dakaTopOne".$type);
        if($cacheTopOne)
        {
            return $cacheTopOne;
        }else{            
            //获取今天最高最低时间段
            $benginTime=Common::getMintime();     
            $currentTime=time();
            if($currentTime < $benginTime)
            {
                $benginTime -=86400;
                
            }
         //   $benginTime -=86400;
            if($type == 1)
            {
                $modelDakaEndOne=DakaRecordBase::find()->where(" time >= ".$benginTime )   
                ->one();
            } else if($type == 2){
                $modelDakaEndOne=DakaRecordTen::find()->where(" time >= ".$benginTime )   
              ->one();
            }  else if($type == 3){
                $modelDakaEndOne=DakaRecordHundred::find()->where(" time >= ".$benginTime )   
              ->one();
            }  
            
          
            $TopOne=[];

            if($modelDakaEndOne)
            {
                $TopOne=[];
                 $modelUser=Wxuser::findOne($modelDakaEndOne->uid);                  
                 $TopOne["date"]=date("H:i",$modelDakaEndOne->time);                  
                    if($modelUser)
                    {
                        $TopOne["nickname"]=$modelUser->nickname;
                        $TopOne["headimgurl"]=$modelUser->headimgurl;
                        $arrTopOne['topOne']= $TopOne;
                    }             
            }
            //获取打卡结果
            $modelResult=DakaResult::find()->where("type = ".$type) ->orderBy("id desc")->one();

            if($modelResult)
            {
                $topResult=[];
                $topResult["date"]=date("m-d",$modelResult->time);
                $topResult["success"]=$modelResult->success;
                $topResult["error"]=$modelResult->error;
                $arrTopOne['topResult']= $topResult;
            }
            //设置缓存600秒
            $cache->set("dakaTopOne".$type,$arrTopOne,60);
        }        
        return $arrTopOne;

    }
    /**
     * Summary of getDakaRank
     * @param mixed $type 
     * @param mixed $page 
     * @return mixed
     */
    public static function getDakaRank($type=1,$page=1)
    {
        $arrData=[];
        //检索缓存
        $cache=Yii::$app->cache;     
        $cacheRank=$cache->get("rank".$type.'-'.$page);
        //如果存在则返回缓存
        if($cacheRank)
        {
            return $cacheRank;
        }
        $beginTime=Common::getMintime();
        $nowTime=time();
        //如果今天还没开始,则请求昨天的数据
        if($nowTime <$beginTime)
        {
            $beginTime=$beginTime - 86400;
        }        
      //  $beginTime=$beginTime - 86400;
        if($type == 1)
        {
            $pageNum=15;
            $beginId=($page-1)*$pageNum;
            $modelList=DakaRecordBase::find()->where('time >= '.$beginTime)          
            ->offset($beginId)
            ->limit($pageNum)
            ->all();          
            if($modelList)
            {
                foreach($modelList as $rowDataModel)
                {
                    $rowData=[];
                    $modelUser=Wxuser::findOne($rowDataModel->uid);                  
                    $rowData["date"]=date("H:i",$rowDataModel->time);
                    $modelDakaBase=DakaBase::findOne(["userid"=>$rowDataModel->uid]);
                    $rowData["number"]=0;
                    if($modelDakaBase)
                    {
                        $rowData["number"]=$modelDakaBase->number;
                    }

                    
                    if($modelUser)
                    {
                        $rowData["nickname"]=$modelUser->nickname;
                        $rowData["headimgurl"]=$modelUser->headimgurl;
                        $arrData[]= $rowData;
                    }
                }
            }
            //设置缓存10秒
            $cache->set("rank".$type.'-'.$page,$arrData,10);           
        }     
        return $arrData;
    }

  /**
   * Summary of dakaData
   * 返回打卡信息
   * @param mixed $type 
   */
  public static function getDakaData($type=1)
  {
      $reData=[];
      $cache=Yii::$app->cache;
      $cacheDakaCount=$cache->get("dakaCount".$type);

      if($cacheDakaCount)
      {
          return $cacheDakaCount;
      }else{
          $modelList=DakaResult::find()->where(["type"=>$type])->orderBy("id desc")->limit(7)-> all();
          //最新数据
          $new=[];
          if(!empty($modelList))
          {
              $newModel=$modelList[0];
              
              $new["success"]=$newModel->success;
              $new["error"]=$newModel->error;
              
          }else{
              $new["success"]=0;
              $new["error"]=0; 
          }
          $reData["new"]=$new;
          //数据表
          $infoData=[];
          foreach($modelList as $rowModel)
          {    
              $rowInfo=[];              
              $rowInfo["date"]=date("m月d日",$rowModel->time);
              $rowInfo["money"]=$rowModel->money;
              if($type == 1)
              {
                  $rowInfo["allmoney"]=$rowModel->allmoney + $rowModel->addmoney +$rowModel->success; //奖池金额
              }else  if($type == 2)
              {
                  $rowInfo["allmoney"]=$rowModel->allmoney + $rowModel->addmoney + ($rowModel->success *Yii::$app->params["partakeMoney2"]); //奖池金额
              }else  if($type == 3)
              {
                  $rowInfo["allmoney"]=$rowModel->allmoney + $rowModel->addmoney + ($rowModel->success *Yii::$app->params["partakeMoney3"]); //奖池金额
              }
             
              $rowInfo["addmoney"]=$rowModel->addmoney; //奖池金额
              $rowInfo["success"]=$rowModel->success;
              $rowInfo["error"]=$rowModel->error;
              $infoData[]=$rowInfo;
          }
          //反转数组
          $reData["info"]=array_reverse( $infoData);

          $cache->set("dakaCount".$type,$reData,60);
      }    
      return $reData;
  }

    
  /**
     * Summary of getTop10
     * 每天最高奖励10人
     * @param mixed $type 
     * @return array[]
     */
    public static function getTop10($type=1)
    {
        $arrTop10=[];
        return $arrTop10;
        $cache=Yii::$app->cache;
			
        $cacheTop10=$cache->get("dakaTop10".$type);
		
        if($cacheTop10)
        {
            return $cacheTop10;
        }else{          
	
            //获取今天最高最低时间段
            $benginTime=strtotime(date("Y-m-d 00:00:00"));
            $endTime=strtotime(date("Y-m-d 23:59:59"));
		
            if($type == 1)
            {
                $modelDakaEndList=DakaBaseEnd::find()->where(" time >= ".$benginTime .' and time <= ' .$endTime)    
                ->orderBy("money desc")
                ->limit(10)         
                ->all();
            }else if($type == 2){
                $modelDakaEndList=DakaTenEnd::find()->where(" time >= ".$benginTime .' and time <= ' .$endTime)    
              ->orderBy("money desc")
              ->limit(10)         
              ->all();
            }

            if($modelDakaEndList )
            {
                foreach($modelDakaEndList as $rowModel)
                {
                    $rowData=[];
                    $rowData["money"]=$rowModel->money;
                    $modelUser=Wxuser::findOne(["id"=>$rowModel->uid]);
                    if($modelUser)
                    {
                        $rowData["nickname"]=$modelUser->nickname;
                        $rowData["headimgurl"]=$modelUser->headimgurl;
                        $arrTop10[]= $rowData;
                    }
                }
            }
            //设置缓存600秒
            $cache->set("dakaTop10".$type,$arrTop10,600);

        }
        
        return $arrTop10;
    }
}
