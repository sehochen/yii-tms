<?php
namespace wokaextend\components\common\http;

/**
 * Summary of Url * 
 *超链接解析
 */
class UrlAnalysis {
	
    /**
     * Summary of sliptUrl
     * 解析url
     * @param mixed $url 全链接地址
     * @return mixed
     * 返回数组 ['scheme']
     *          ['host']
     *          ['path']
     *          ['query']
     * 
     */
    public static function sliptUrl($url)
    {
        return   parse_url($url);  
    }

    /**
     * Summary of getParams
     * 处理参数
     * @param mixed $strParams  参数字符串
     * @return array
     * 返回参数数组
     */
    public static function getParams($strParams)
    {
        $params=[];
        parse_str($strParams, $params);
        return $params;
    }

}

?>