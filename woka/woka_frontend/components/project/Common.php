<?php
namespace frontend\components\project;

use Yii;
use common\models\project\DakaBase;
/**
 * Summary of Common
 * 打卡操作类 
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class Common
{  
    /**
     * Summary of getUid
     * 返回用户id当前用户
     * @return mixed
     */
    public static function getUid() 
    {
        $session=Yii::$app->session;
        //获取用户可打卡信息
        return $session["vzuserid_p"];     
        
    }


    public static function getExopenid()
    {
      
        $session=Yii::$app->session;
        return  $session["vzExopenid"];

    }

    public static function getOpenid()
    {
        $session=Yii::$app->session;
        return  $session["vzopenid_p"];

    }
    /**
     * Summary of getFlagtime
     * 返回当前打卡标识
     * @return integer
     */
    public static function getFlagtime()
    {

        $flagtime=strtotime(date("Y-m-d 12:00:00"));
        return $flagtime;

    }
    /**
     * Summary of getMintime
     * 获取最小时间
     * @return integer
     */
    public static function getMintime()
    {
        $dateHead=date("Y-m-d ");
        $beginTime=strtotime($dateHead.Yii::$app->params["beginTime"]);
        return $beginTime;
    }
    

    /**
     * Summary of isInTime
     * 是否在规定时间内
     * @param mixed $time 
     * @return boolean
     */
    public static function isInTime($time)
  {
      //当前时间    

      $dateHead=date("Y-m-d ");
      $beginTime=strtotime($dateHead.Yii::$app->params["beginTime"]);
      $endTime=strtotime($dateHead.Yii::$app->params["endTime"]);
    
      if($time <= $endTime && $time >= $beginTime)
      {
          return true;
      }
      return false;
  }

    /**
     * Summary of isLT
     * 是否大于今天的打卡时间
     */
    public static function isGT($time)
    {
        $dateHead=date("Y-m-d ");

        //打卡结束时间
        $endTime=strtotime($dateHead.Yii::$app->params["endTime"]);

        if($time > $endTime)
        {
            return true;
        }
        return false;
        
    }
    
}
