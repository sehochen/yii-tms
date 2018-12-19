<?php
namespace wokaextend\components\pay\wechatpay;

use wokaextend\wechat\config\WechatConfig;
use wokaextend\components\pay\wechatpay\WxPayDataBase;


/**
 * 微信红包发放底层类
 */
class wxQiYe
{
    /** 
     * 企业支付 
     * @param string $openid    用户openID 
     * @param string $trade_no  单号 
     * @param string $money     金额 
     * @param string $desc      描述 
     * @return string   XML 结构的字符串 
     */  
    public function pay($openid,$trade_no,$money,$desc){  
        $data = array(  
            'mch_appid' => WxPayConfig::APPID,  
            'mchid'     => WxPayConfig::MCHID,  
            'nonce_str' => self::getNonceStr(),  
            //'device_info' => '1000',  
            'partner_trade_no' => $trade_no, //商户订单号，需要唯一  
            'openid'    => $openid,  
            'check_name'=> 'NO_CHECK', //OPTION_CHECK不强制校验真实姓名, FORCE_CHECK：强制 NO_CHECK：  
            //'re_user_name' => 'jorsh', //收款人用户姓名  
            'amount'    => $money * 100, //付款金额单位为分  
            'desc'      => $desc,  
            'spbill_create_ip' => self::getServerIp()  
        );  
        
        //生成签名  
        $data['sign'] = self::makeSign($data);  
        //构造XML数据  
        $xmldata = self::arrayToXml($data);  

      
        $url = 'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';  
        //发送post请求  
        $res = self::curl_post_ssl($url, $xmldata);  
   
        if(!$res){  
            return array('status'=>1, 'msg'=>"Can't connect the server" );  
        }  
        // 这句file_put_contents是用来查看服务器返回的结果 测试完可以删除了  
      //  file_put_contents('e:/log2.txt',$res,FILE_APPEND);  

        $content = simplexml_load_string($res, 'SimpleXMLElement', LIBXML_NOCDATA); 
         //付款结果分析   2017-10-27需要优化返回处理
        /**
        object(SimpleXMLElement)#50 (8) {
        ["return_code"]=> string(7) "SUCCESS"
        ["return_msg"]=> object(SimpleXMLElement)#55 (0) { } 
        ["mchid"]=> string(10) "1483468892" 
        ["nonce_str"]=> string(30) "gmhzzxiwkfasgrrcfyizmetsjxcsok" 
        ["result_code"]=> string(7) "SUCCESS"
        ["partner_trade_no"]=> string(18) "201710271339253720" 
        ["payment_no"]=> string(28) "1000018301201710270878588997"
        ["payment_time"]=> string(19) "2017-10-27 13:39:26" 
        }   
         * */        
        if(strval($content->return_code) == 'FAIL'){  
            //返回失败

            return array('status'=>1, 'msg'=>strval($content->return_msg));  
        }  
        if(strval($content->result_code) == 'FAIL'){  
            //返回失败

            return array('status'=>1, 'msg'=>strval($content->err_code),':'.strval($content->err_code_des));  
        }  
        $resdata = array(  
            'return_code'      =>strval( $content->return_code),  
            'result_code'      => strval($content->result_code),  
            'nonce_str'        => strval($content->nonce_str),  
            'partner_trade_no' => strval($content->partner_trade_no),  
            'payment_no'       => strval($content->payment_no),  
            'payment_time'     => strval($content->payment_time),  
        );  
        return $resdata;  
    } 
    

    /**
     * 参数转换成XML
     * @param array $arr 参数数组
     * @return string
     */
	public function arrayToXml($arr)
	{
		$xml = "<xml>";
     
		foreach ($arr as $key => $val) {
			if (is_numeric($val)) {
				$xml .= "<" . $key . ">" . $val . "</" . $key . ">";
			} else {
				$xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
			}
		}
		$xml .= "</xml>";      
		return $xml;
	}
    //user
     public function makeSign($data)
     {
        


         $secrect_key='e613b530cb7806d976872ec610e804f7';///这个就是个API密码。32位的。。随便MD5一下就可以了

         $data=array_filter($data);

         ksort($data);

         $str='';

         foreach($data as $k=>$v) {

             $str.=$k.'='.$v.'&';

         }

         $str.='key='.$secrect_key;

          return  md5($str);
   
    }



     /**
      * cURL抓取
      *
      * @param $url 链接地址
      * @param $vars 参数
      * @param
      *        	$second
      * @param
      *        	$aHeader
      * @return mixed|boolean
      */
     function curl_post_ssl($url, $data, $second = 30, $aHeader = array())
     {
         
         $ch = curl_init();
         // 超时时间
         curl_setopt($ch, CURLOPT_TIMEOUT, $second);
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
         // 这里设置代理，如果有的话
         curl_setopt($ch, CURLOPT_URL, $url);
         curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
         curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
         // cert 与 key 分别属于两个.pem文件
         curl_setopt($ch, CURLOPT_SSLCERT,  WxPayConfig::getRealPath().WxPayConfig::SSLCERT_PATH);
         curl_setopt($ch, CURLOPT_SSLKEY, WxPayConfig::getRealPath().WxPayConfig::SSLKEY_PATH);
         curl_setopt($ch, CURLOPT_CAINFO, WxPayConfig::getRealPath().WxPayConfig::SSLROOTCA);
         if (count($aHeader) >= 1) {
             curl_setopt($ch, CURLOPT_HTTPHEADER, $aHeader);
         }
         curl_setopt($ch, CURLOPT_POST, 1);
         curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
         $data = curl_exec($ch);
         if ($data) {
             curl_close($ch);
             return $data;
         } else {            
             curl_close($ch);
             return false;
         }
     }
     


    public function getNonceStr()
    {
        return $this->getRand(30,2);
    }

    /**
     * 获取服务器ip
     *
     * @return string
     */
	public function getServerIp()
	{
		$server_ip = '127.0.0.1';
		if (isset($_SERVER)) {
			if (isset($_SERVER['SERVER_ADDR']) && $_SERVER['SERVER_ADDR']) {
				$server_ip = $_SERVER['SERVER_ADDR'];
			} elseif (isset($_SERVER['LOCAL_ADDR']) && $_SERVER['LOCAL_ADDR']) {
				$server_ip = $_SERVER['LOCAL_ADDR'];
			}
		} else {
			$server_ip = getenv('SERVER_ADDR');
		}
		return $server_ip;
	}

    /**
     * 获取随机数
     * @param number $len 随机数的位数
     * @param number $type 取值范围 1表示数字 2小写字母 4大写字母
     * @return string
     */
	public function getRand($len = 30, $type = 0)
	{
		$str = '';
		$max = - 1;
		
		if (! $type) {
			$type = 3;
		}
		
		if ($type & 1) {
			$str .= '1234567890';
			$max += 10;
		}
		
		if ($type & 2) {
			$str .= 'abcdefghijklmnopqrstuvwxyz';
			$max += 26;
		}
		
		if ($type & 4) {
			$str .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
			$max += 26;
		}
		
		$rand = '';
		for ($i = 0; $i < $len; $i ++) {
			$rand .= $str[rand(0, $max)];
		}
		
		return $rand;
	}
}

