<?php
namespace frontend\components\project;

use Yii;
use common\models\project\DakaBase;
use common\models\project\DakaTen;
use common\models\project\DakaHundred;
use common\models\project\Wxuser;
use frontend\components\project\Common;
use common\models\project\DakaRecordBase;
use common\models\project\DakaRecordTen;
use common\models\project\DakaRecordHundred;
use common\models\project\PayOrder;
use frontend\components\project\SysLog;

/**
 * Summary of Daka
 * 打卡操作类
 * 
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class Daka
{
  
  
    /**
     * Summary of getUserStatus 返回用户打卡状态
     * @param mixed $uid 
     * @return integer
     */
    public static function getUserStatus($uid,$type=1)
    {
        $status=0;
        if($type == 1)
        {
            $modelDaka=DakaBase::findOne(["userid"=>$uid]);

        }else   if($type == 2)
        {
            $modelDaka=DakaTen::findOne(["userid"=>$uid]);
        }else  if($type == 3)
        {
            $modelDaka=DakaHundred::findOne(["userid"=>$uid]);
        }
        //获取打卡状态
        if($modelDaka)
        {           
            $status= $modelDaka->status ;         
        }
        //如果用户可打卡  进行判定
        if($status == 1)
        {
            //打卡时间
            $dakaTime=$modelDaka->last_daka_time;
                $mintime=Common::getMintime();
                if($modelDaka->begin_time > $mintime)
                {
                    $status=8;
                }else{
                    //在规定时间内打卡
                    if(  Common::isInTime($dakaTime))
                    {
                        $status=10;
                    }
                    else if(!Common::isInTime(time()))
                    {
                        $status=11;
                    }
                }
        }

        return $status;
    }
    /**
     * Summary of checkDaka
     * 检测订单
     * @param mixed $ordersn 
     * @return boolean
     */
    public static function checkDaka($ordersn)
    {
        $modelCORder=PayOrder::findOne(["ordersn"=>$ordersn]);
        if($modelCORder)
        {
            SysLog::addError("检测订单存在不做修改，等待回掉,订单【".$ordersn."】",66);
            return true;
        }else{
            //打卡
            $uid=Common::getUid();
            $openid=Common::getOpenid();
            $exopenid=Common::getExopenid();
            //重新添加设置打卡
            $modelDakaBase=DakaBase::findOne(["userid" =>$uid]);
            if(!$modelDakaBase)
            {
                $modelDakaBase=new DakaBase();
                $modelDakaBase->userid=$uid;                     
                $modelDakaBase->allmoney=0.00;
                $modelDakaBase->last_daka_time=0;
                $modelDakaBase->status=1;
                //用户信息
                $modelUser=Wxuser::findOne($uid);  
                if(!$modelUser)
                {
                    SysLog::addError("检测打卡状态未找到用户,【".$uid."】",100);
                    return true;
                }
                $modelDakaBase->headimgurl=$modelUser->headimgurl;
                $modelDakaBase->nickname=$modelUser->nickname;                
                // $modelDakaBase->save();
            }
            $modelDakaBase->status=1;
            $modelDakaBase->number=0;
            $modelDakaBase->begin_time=time();
            $modelDakaBase->money=1;//设置money
            $modelDakaBase->exopenid=$exopenid;
            if($modelDakaBase ->save())
            {
                SysLog::addError("检测创建打卡人完成,【".$uid."】【".$openid."】【".$exopenid."】订单【".$ordersn."】",22);
                return false;
            }else{
                //错误日志系统 80
                SysLog::addError("检测创建打卡人失败,【".$uid."】【".$openid."】【".$exopenid."】订单【".$ordersn."】",22);
                return false;                
            }
            SysLog::addError("检测订单，订单不存在【".$ordersn."】",22);
            return false;

        }
        return false;
    }



    /**
     * Summary of setDoDaka
     * 进行打卡操作
     */
    public static function setDoDaka($uid,$type=1)
    {
        $reData=[];
        $reData["status"]=0;
        //返回用户打卡用户
        $reData["status"]=self::getUserStatus($uid,$type);
        //可打卡 则判断是否在时间内
        if( $reData["status"]==1)
        {
            $time=time();
            //在规定时间内打卡
          if(  Common::isInTime($time))
          {
             $flag=   self::subDoDaka($time,$uid,$type);
             if($flag)
             {
                 $reData["status"]=9;
				 
				  /*发送打卡成功模板消息**/
                 
                 
                 $openid=Common::getOpenid();
                 $url = 'http://wx.yusanbang.cn/index.php/dotemplate/send'; 
                 $param = array( 
                   'type'=>$type,
                   'openid'=>$openid    
                 );         
                 self::doRequest($url, $param);  
             }else
             {
                 $reData["status"]=12;
             }              
          }else
          {
              $reData["status"]=11; 
          }

        }
        return     $reData;     
    }
	
	
	   public function doRequest($url, $param=array()){ 
          
          $urlinfo = parse_url($url);         
          $host = $urlinfo['host']; 
          $path = $urlinfo['path']; 
          $query = isset($param)? http_build_query($param) : ''; 
          
          $port = 80; 
          $errno = 0; 
          $errstr = ''; 
          $timeout = 10; 
          
          $fp = fsockopen($host, $port, $errno, $errstr, $timeout); 
          
          $out = "POST ".$path." HTTP/1.1\r\n"; 
          $out .= "host:".$host."\r\n"; 
          $out .= "content-length:".strlen($query)."\r\n"; 
          $out .= "content-type:application/x-www-form-urlencoded\r\n"; 
          $out .= "connection:close\r\n\r\n"; 
          $out .= $query; 
          
          fputs($fp, $out); 
          fclose($fp); 
      } 

    /**
     * Summary of subDoDaka
     * 用户打卡数据操作
     * @param mixed $time 
     * @param mixed $uid 
     * @param mixed $type 
     * @return boolean
     */
    public static function subDoDaka($time,$uid,$type=1)
    {
       if($type == 1)
       {
           $flagtime=strtotime(date("Y-m-d 12:00:00"));
           //更新打卡
           $flag=DakaBase::updateAll(["last_daka_time"=>$time,"flagtime"=>$flagtime],'userid = '.$uid);

           if($flag)
           {
               //基础打卡记录
               $modelRe=new DakaRecordBase();
               $modelRe->uid=$uid;
               $modelRe->time=$time;
               $modelRe->info=date("H:i:s",$time);
               if(!$modelRe->save())
               {
                   //失败日志
                   $error="用户打卡记录保存失败【基础打卡】【用户id:".$uid."】";
                   SysLog::addError($error,1);
               }
               return true;
           }else{               
               //失败日志
               $error="更新打卡记录失败【基础打卡】【用户id:".$uid."】";
               SysLog::addError($error,1);
           }
       }else if($type == 2)
       {
           $flagtime=strtotime(date("Y-m-d 12:00:00"));
           //更新打卡
           $flag=DakaTen::updateAll(["last_daka_time"=>$time,"flagtime"=>$flagtime],'userid = '.$uid);
           if($flag)
           {
               //基础打卡记录
               $modelRe=new DakaRecordTen();
               $modelRe->uid=$uid;
               $modelRe->time=$time;
               $modelRe->info=date("H:i:s",$time);
               if(!$modelRe->save())
               {
                   //失败日志
                   $error="用户打卡记录保存失败【十元打卡】【用户id:".$uid."】";
                   SysLog::addError($error,2);
               }
               return true;
           }else{               
               //失败日志
               $error="更新打卡记录失败【十元打卡】【用户id:".$uid."】";
               SysLog::addError($error,2);
           }
       }else if($type == 3)
       {
           $flagtime=strtotime(date("Y-m-d 12:00:00"));
           //更新打卡
           $flag=DakaHundred::updateAll(["last_daka_time"=>$time,"flagtime"=>$flagtime],'userid = '.$uid);
           if($flag)
           {
               //基础打卡记录
               $modelRe=new DakaRecordHundred();
               $modelRe->uid=$uid;
               $modelRe->time=$time;
               $modelRe->info=date("H:i:s",$time);
               if(!$modelRe->save())
               {
                   //失败日志
                   $error="用户打卡记录保存失败【百元打卡】【用户id:".$uid."】";
                   SysLog::addError($error,2);
               }
               return true;
           }else{               
               //失败日志
               $error="更新打卡记录失败【百元打卡】【用户id:".$uid."】";
               SysLog::addError($error,2);
           }
       }
       return false;

    }


    /**
     * Summary of getDakaUserList 获取排行打卡用户
     * @param mixed $limit  返回打卡用户数组
     */
    public static function getDakaUserList($limit=5,$type=1)
    {
        $arrUser=[];
        //失败人数
        $cache=Yii::$app->cache;
        $cacheListData=$cache->get("listIndex".$type);

		
        if(!empty($cacheListData))
        {
            return $cacheListData;
        }

        if($type == 1)
        {
           // $modelList=DakaBase::find()->where("status = 1")->limit($limit)-> all();
		    $modelList=DakaBase::find()->where("status = 1")->orderBy("begin_time desc")-> limit($limit)-> all();
            if($modelList)
            {
                foreach($modelList as $row)
                {
                    $rowUsere=[];
                    $rowUsere["uid"]=$row->userid;
                    $rowUsere["name"]=$row->nickname;
                    $rowUsere["headimgurl"]=$row->headimgurl;
                    $arrUser[]=$rowUsere;
                }

            }

        }else   if($type == 2)
        {
            $modelList=DakaTen::find()->where("status = 1")->orderBy("begin_time desc")-> limit($limit)-> all();
		
            if($modelList)
            {
                foreach($modelList as $row)
                {
                    $rowUsere=[];
                    $rowUsere["uid"]=$row->userid;
                    $rowUsere["name"]=$row->nickname;
                    $rowUsere["headimgurl"]=$row->headimgurl;
                    $arrUser[]=$rowUsere;
                }

            }
        }   else   if($type == 3)
        {
            $modelList=DakaHundred::find()->where("status = 1")->orderBy("begin_time desc")-> limit($limit)-> all();
            
            if($modelList)
            {
                foreach($modelList as $row)
                {
                    $rowUsere=[];
                    $rowUsere["uid"]=$row->userid;
                    $rowUsere["name"]=$row->nickname;
                    $rowUsere["headimgurl"]=$row->headimgurl;
                    $arrUser[]=$rowUsere;
                }

            }
        }
        
			
        //首页参加人数缓存
        if(count($arrUser) < $limit)
        {
            $cache->set("listIndex".$type,$arrUser,5);
        }else{
            $cache->set("listIndex".$type,$arrUser,500);
        }
       

        return $arrUser;        
    }

 
    /**
     * Summary of getDakaUserListPartake
     * @param mixed $type 
     * @param mixed $page 
     */
 
    public static function getDakaUserListPartake($type,$page)
    {
        // $arrUser=[];
       
        $cache=Yii::$app->cache;     
        $cacheListData=$cache->get("listIndexP".$type.'-'.$page);
        if(!empty($cacheListData))
        {
            return  $cacheListData;
        }

        $cacheData=[];
        if($type == 1)
        {      
                     $limit=40;
                     $beginId=($page-1)*$limit;

                    $modelList=DakaBase::find()->where("status = 1")
					 ->orderBy("begin_time desc")
					 ->offset($beginId)->limit($limit)-> all();
					 
                      if($modelList)
                     {
                         foreach($modelList as $row)
                          {
                        $rowUsere=[];
                        $rowUsere["uid"]=$row->userid;
                        $rowUsere["name"]=$row->nickname;
                        $rowUsere["headimgurl"]=$row->headimgurl;
                        $cacheData[]=$rowUsere;
                      }
                                      
              }          

        }else  if($type == 2){
            $limit=40;
            $beginId=($page-1)*$limit;

            $modelList=DakaTen::find()->where("status = 1")
             ->orderBy("begin_time desc")
             ->offset($beginId)->limit($limit)-> all();
            
            if($modelList)
            {
                foreach($modelList as $row)
                {
                    $rowUsere=[];
                    $rowUsere["uid"]=$row->userid;
                    $rowUsere["name"]=$row->nickname;
                    $rowUsere["headimgurl"]=$row->headimgurl;
                    $cacheData[]=$rowUsere;
                }
                
            }       

        }else  if($type == 3){
            $limit=40;
            $beginId=($page-1)*$limit;

            $modelList=DakaHundred::find()->where("status = 1")
             ->orderBy("begin_time desc")
             ->offset($beginId)->limit($limit)-> all();
            
            if($modelList)
            {
                foreach($modelList as $row)
                {
                    $rowUsere=[];
                    $rowUsere["uid"]=$row->userid;
                    $rowUsere["name"]=$row->nickname;
                    $rowUsere["headimgurl"]=$row->headimgurl;
                    $cacheData[]=$rowUsere;
                }
                
            }       

        }
        $cache->set("listIndexP".$type.'-'.$page,$cacheData,60);


        return $cacheData;
  
    }

	
	 /**
     * Summary of getDakaUserListPartake
     * @param mixed $type 
     * @param mixed $page 
     */
 
    public static function getDakaUserListPartake1($type,$page)
    {
        $arrUser=[];
       
        $cache=Yii::$app->cache;     
       
        if($type == 1)
        {
            $cacheListData=$cache->get("listIndexP".$type.'-'.$page);
          
$cacheListData=false;
            if($cacheListData)
            {
			
                return $cacheListData;
            }else
            {
                 
                for($i=0;$i<5;$i++ )
                {
                     $cacheData=[];
                     $limit=40;
                     $beginId=$i*$limit;

                     $modelList=DakaBase::find()->where("status = 1")
					 ->orderBy("begin_time desc")
					 ->offset($beginId)->limit($limit)-> all();
					 
                      if($modelList)
                     {
                         foreach($modelList as $row)
                          {
                        $rowUsere=[];
                        $rowUsere["uid"]=$row->userid;
                        $rowUsere["name"]=$row->nickname;
                        $rowUsere["headimgurl"]=$row->headimgurl;
                        $cacheData[]=$rowUsere;
                      }

                        $cache->set("listIndexP".$type.'-'.($i+1),$cacheData,60);
                   }

                     
                }
            }          

        }
        
        return $cache->get("listIndexP".$type.'-'.$page);
  
    }


    /**
     * Summary of getAllUser 获取所有打卡用户
     * @param mixed $type  打卡类型  1:普通打卡
     * @return integer 总打卡人数数字
     */
    public static function getAllCount($type =1)
    {
        
        $dataAll=[];
        $cache=Yii::$app->cache;
        $cacheData=$cache->get("count".$type);
        //查看缓存状态
        if(!empty($cacheData))
        {
            return $cacheData;

        }

            
            $dataAll['count']=0;
            $dataAll['allMoney']=0;
            if($type == 1)
            {
                $dataAll['count']=DakaBase::find()->where(["status"=>1])->count();
                //打卡金额
                $sql = "select sum( money ) as allMoney from wokav_daka_base where status=1";
                $connection=Yii::$app->db;
                $command=$connection->createCommand($sql);
                $command=$command->queryOne();
                if(!empty($command["allMoney"]))
                {
                    $dataAll['allMoney']=$command["allMoney"];
                }else
                {
                    $dataAll['allMoney']=0.00;
                }

                //添加 增加信息 增加人数计算金额
                $dataAll['count']=$dataAll['count'] + Yii::$app->params["addSuccess1"] + Yii::$app->params["addError1"];
                $dataAll['allMoney']=$dataAll['allMoney'] + (Yii::$app->params["addSuccess1"] + Yii::$app->params["addError1"])*Yii::$app->params["partakeMoney1"];
            }else   if($type ==2)
            {
                $dataAll['count']=DakaTen::find()->where(["status"=>1])->count();
                //打卡金额
                $sql = "select sum( money ) as allMoney from wokav_daka_ten where status=1";
                $connection=Yii::$app->db;
                $command=$connection->createCommand($sql);
                $command=$command->queryOne();
             
                if(!empty($command["allMoney"]))
                {
                    $dataAll['allMoney']=$command["allMoney"];
                }else
                {
                    $dataAll['allMoney']=0.00;
                }
             
                //添加 增加信息 增加人数计算金额
                $dataAll['count']=$dataAll['count'] + Yii::$app->params["addSuccess2"] + Yii::$app->params["addError2"];
                $dataAll['allMoney']=$dataAll['allMoney'] + (Yii::$app->params["addSuccess2"] + Yii::$app->params["addError2"])*Yii::$app->params["partakeMoney2"];
                
            }else   if($type ==3)
            {
                $dataAll['count']=DakaHundred::find()->where(["status"=>1])->count();
                //打卡金额
                $sql = "select sum( money ) as allMoney from wokav_daka_hundred where status=1";
                $connection=Yii::$app->db;
                $command=$connection->createCommand($sql);
                $command=$command->queryOne();
                
                if(!empty($command["allMoney"]))
                {
                    $dataAll['allMoney']=$command["allMoney"];
                }else
                {
                    $dataAll['allMoney']=0.00;
                }
                
                //添加 增加信息 增加人数计算金额
                $dataAll['count']=$dataAll['count'] + Yii::$app->params["addSuccess3"] + Yii::$app->params["addError3"];
                $dataAll['allMoney']=$dataAll['allMoney'] + (Yii::$app->params["addSuccess3"] + Yii::$app->params["addError3"])*Yii::$app->params["partakeMoney3"];
                
            }  
		
           //设置缓存
         $cache->set("count".$type,$dataAll,10);        
        return $dataAll;        
    }
    

    
}
