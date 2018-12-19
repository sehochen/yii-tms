<?php
namespace frontend\components\project;

use Yii;
use common\models\common\SysError;
use common\models\project\CashError;
/**
 * Summary of SysLog
 * 系统操作日志
 * auth:Vanzer
 * date:2017-10-07
 */
class SysLog
{
   /**
    * Summary of addError
    * 错误系统日志信息记录
    * @param mixed $content 
    * @param mixed $level 
    */
   public static function addError($content,$level=1)
   {
       $modelLog=new SysError();
       $modelLog->level=$level;
       $modelLog->content=$content;
       $modelLog->date=date("Y-m-d H:i:s");
       if( !$modelLog->save())
       {
           var_dump($modelLog);
           echo "系统致命错误,请稍后重试！";
           exit;
       }
      

   }

   /**
    * Summary of addError
    * 错误系统日志信息记录
    * @param mixed $content 
    * @param mixed $level 
    */
   public static function addCashError($content,$level=1)
   {
       $modelLog=new CashError();
       $modelLog->level=$level;
       $modelLog->content=$content;
       $modelLog->date=date("Y-m-d H:i:s");
       if( !$modelLog->save())
       {
           var_dump($modelLog);
           echo "系统致命错误,请稍后重试！";
           exit;
       }

   }


    //CashLog

}
