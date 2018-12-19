<?php
namespace frontend\modules\common\components;

use Yii;
use common\models\common\base\BaseBanner;

class CBanner 
{ 
   
    public static function getBanner($arr=[])
    {
        $modelList=BaseBanner::find()
            ->where(['isshow'=>1])
            ->orderBy('order desc')
            ->asArray()
            ->all();
        if($modelList)
        {
            return $modelList;
        }
        return $arr;
        
    }
}

