<?php
namespace wokaextend\components\common\http;

/**
 * Summary of Url * 
 *超链接解析
 */
class JsAnalysis {
	
  

   public static  function parse_js($string){  
       $JsArray=[];
        $pregString="/(var )?([a-zA-Z_0-9]+)(\['([a-zA-Z_0-9]+)'\])?=([^;]*);/";  
        preg_match_all($pregString,$string,$JsArrayPre);  
        $num=count($JsArrayPre['0']);  
        for($i=0;$i<$num;$i++){  
            
            if($JsArray[$JsArrayPre['5'][$i]])//为迭代赋值  
                $JsArrayPre['5'][$i]=$JsArray[$JsArrayPre['5'][$i]];  
            
            if($JsArrayPre['5'][$i]=="{}"||$JsArrayPre['5'][$i]=="[]")//定义数组  
                $JsArrayPre['5'][$i]=array();  
            
            if($JsArrayPre['4'][$i])//数组迭代  
                $JsArray[$JsArrayPre['2'][$i]][$JsArrayPre['4'][$i]]=$JsArrayPre['5'][$i];  
            else  
                $JsArray[$JsArrayPre['2'][$i]]=$JsArrayPre['5'][$i];  
            
        }  
        return $JsArray;  
    }  

}

?>