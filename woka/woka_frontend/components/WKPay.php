<?php
namespace frontend\components\project;

use Yii;
use  common\models\project\Order;
use  common\models\project\Payorder;
use yii\log\FileTarget; 

class WKPay 
{ 

    public  static function payEnd($result)
    {
        $modelPaylog=Payorder::findOne(['paysn'=>$result['out_trade_no'],'status'=>0]);
        if($modelPaylog)
        {
            if($modelPaylog->money == $result["total_fee"]/100)
            {
                $modelPaylog->status=1;
                $modelPaylog->paytime=time();
                $modelPaylog->payinfo=json_encode($result);
                if( $modelPaylog->save())
                {
                    $modelOrder=Order::findOne($modelPaylog->oid);
                    $modelOrder->status=1;
                    $modelOrder->save();
                  
                }
            }            
            
        }
    }
    
}

