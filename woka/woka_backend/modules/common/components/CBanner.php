<?php

namespace backend\modules\common\components;

use yii;
use common\models\common\base\BaseBanner;
/**
 * common module definition class
 */
class CBanner 
{
    /**
     * Summary of getList
     * 获取滚动图列表
     * @return mixed
     */
    public static function getList()
    {
        $list=[];
        $modelList=BaseBanner::find()
            ->where('isshow = 1')
            ->orderBy('order desc')
            ->all();
        if($modelList)
        {
            foreach($modelList as $row)
            {
                $list[]=$row->attributes;
            }
        }
        return $list;
    }
    
}
