<?php
namespace wokaextend\components\common\region;

use yii\base\Component;
use common\models\common\Region as MRegion;

class Region extends Component
{    
    /**
     * Summary of getProvinceList
     * @return mixed
     */
    public static function getProvinceList()
    {
        return self::getModelList(1,1);
        
    }
    /**
     * Summary of getCityListy
     * @param mixed $provinceId 
     * @return mixed
     */
    public static function getCityList($provinceId)
    {
        return self::getModelList($provinceId,2);
    }
    /**
     * Summary of getAreaList
     * @param mixed $cityId 
     * @return mixed
     */
    public static function getAreaList($cityId)
    {
        return self::getModelList($cityId,3);
    }
    
    /**
     * Summary of getModelList
     * @param mixed $parentId 
     * @param mixed $type 
     * @return mixed
     */
    public static function getModelList($parentId=1,$type=1)
    {
        $ModelList=[];
        $modelList=MRegion::find()->where(["parent_id"=>$parentId,"region_type"=>$type])->all();
        if($modelList)
        {
            foreach($modelList as $modelRow)
            {
                
                $ModelList[$modelRow->region_id] =$modelRow->region_name;
                
            }
        }       
        return $ModelList;        
        
    }
    
    
}


?>