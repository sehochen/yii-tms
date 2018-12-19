<?php
namespace  wechat\components;

use  wokaextend\wechat\ResponsePassive;
use wokaextend\wechat\WxCustomService;

/**
 * 微信用户手动消息基础处理类
 * @author vanzer
 *  date:2016-08-18 02:22:56
 */
class WCOptionBase{
    /**
     * @descrpition 文本
     * @param $request
     * @return array
     */
    public static function text(&$request){

	
	
       // if($request['content'] == '班级' || $request['content'] == 'bj'  ||$request['content'] == 'babji'  ||$request['content'] == '1')
      //  {
            
		//	$content='测试链接:【http://wx.yusanbang.cn/index.php/banji】';
      ///      return ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
       //     exit;  
           
      //  }
	
        //客服转发
     //   $modelWx=new WxCustomService();         
       // return $modelWx->sendMessage($request['tousername'],$request['fromusername']);    
    }
    
    public function sendPic($fromusername,$tousername,$title,$description,$pic_url,$url)
    {
         $itemList = array();
         $itemList[] = ResponsePassive::newsItem($title, $description ,$pic_url, $url);
      
      return  ResponsePassive::news($fromusername, $tousername, $itemList);
    }
    
    
    /**
     * @descrpition 图像
     * @param $request
     * @return array
     */
    public static function image(&$request){
		   //客服转发
		    $modelWx=new WxCustomService();         
        return $modelWx->sendMessage($request['tousername'],$request['fromusername']);   
        $content = '收到图片';
        return ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
    }

    /**
     * @descrpition 语音
     * @param $request
     * @return array
     */
    public static function voice(&$request){
        if(!isset($request['recognition'])){
			//客服转发
		    $modelWx=new WxCustomService();         
          return $modelWx->sendMessage($request['tousername'],$request['fromusername']);   
		
            $content = '收到语音';
            return ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
        }else{
            $content = '收到语音识别消息，语音识别结果为：'.$request['recognition'];
            return ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
        }
    }

    /**
     * @descrpition 视频
     * @param $request
     * @return array
     */
    public static function video(&$request){
		//客服转发
		    $modelWx=new WxCustomService();         
        return $modelWx->sendMessage($request['tousername'],$request['fromusername']);   
        $content = '收到视频';
        return ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
    }

    /**
     * @descrpition 视频
     * @param $request
     * @return array
     */
    public static function shortvideo(&$request){
		//客服转发
		    $modelWx=new WxCustomService();         
        return $modelWx->sendMessage($request['tousername'],$request['fromusername']);   
        $content = '收到小视频';
        return ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
    }

    /**
     * @descrpition 链接
     * @param $request
     * @return array
     */
    public static function link(&$request){
		//客服转发
		    $modelWx=new WxCustomService();         
        return $modelWx->sendMessage($request['tousername'],$request['fromusername']);   
        $content = '收到连接';
        return ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
    }


}
