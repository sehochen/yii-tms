<?php
namespace frontend\components\project;

use Yii;
use common\models\project\DakaPrize;

/**
 * Summary of Prize
 * 平台奖品类
 * auth:Vanzer
 * date:2017年10月2日15:14:29
 */
class Prize
{
    /**
     * Summary of getPrize
     * 获取奖品信息
     * @return array 返回将信息数组
     */
    public static function getPrize()
    {
        $prize=[];

        //查询缓存
        $cache=Yii::$app->cache;
        $cachePrize=$cache->get("cPrize");
        //缓存不为空则返回
        if(!empty($cachePrize))
        {
            return $cachePrize;
        }
        $modelPrize=   DakaPrize::find()->limit(4)->all();
        if($modelPrize)
        {
            foreach($modelPrize as $rowPrizeObj)
            {   
                $rowPrize=[];
                $rowPrize=[
                  'pId'=>$rowPrizeObj->id,
                  'pUrl'=>$rowPrizeObj->imgurl 
               ];
                $prize[]=$rowPrize;
            }
            
        }      
        //设置礼物缓存
        $cache->set("cPrize",$prize,600);
        return $prize;        
    }
    


    
}
