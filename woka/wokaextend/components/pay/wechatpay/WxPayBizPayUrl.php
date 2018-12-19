<?php
namespace wokaextend\components\pay\wechatpay;

use wokaextend\wechat\config\WechatConfig;
use wokaextend\components\pay\wechatpay\WxPayException;




/**
 * 
 * ɨ��֧��ģʽһ���ɶ�ά�����
 * @author widyhu
 *
 */
class WxPayBizPayUrl extends WxPayDataBase
{
    /**
     * ����΢�ŷ���Ĺ����˺�ID
     * @param string $value 
     **/
	public function SetAppid($value)
	{
		$this->values['appid'] = $value;
	}
	/**
     * ��ȡ΢�ŷ���Ĺ����˺�ID��ֵ
     * @return ֵ
     **/
	public function GetAppid()
	{
		return $this->values['appid'];
	}
	/**
     * �ж�΢�ŷ���Ĺ����˺�ID�Ƿ����
     * @return true �� false
     **/
	public function IsAppidSet()
	{
		return array_key_exists('appid', $this->values);
	}


	/**
     * ����΢��֧��������̻���
     * @param string $value 
     **/
	public function SetMch_id($value)
	{
		$this->values['mch_id'] = $value;
	}
	/**
     * ��ȡ΢��֧��������̻��ŵ�ֵ
     * @return ֵ
     **/
	public function GetMch_id()
	{
		return $this->values['mch_id'];
	}
	/**
     * �ж�΢��֧��������̻����Ƿ����
     * @return true �� false
     **/
	public function IsMch_idSet()
	{
		return array_key_exists('mch_id', $this->values);
	}
	
	/**
     * ����֧��ʱ���
     * @param string $value 
     **/
	public function SetTime_stamp($value)
	{
		$this->values['time_stamp'] = $value;
	}
	/**
     * ��ȡ֧��ʱ�����ֵ
     * @return ֵ
     **/
	public function GetTime_stamp()
	{
		return $this->values['time_stamp'];
	}
	/**
     * �ж�֧��ʱ����Ƿ����
     * @return true �� false
     **/
	public function IsTime_stampSet()
	{
		return array_key_exists('time_stamp', $this->values);
	}
	
	/**
     * ��������ַ���
     * @param string $value 
     **/
	public function SetNonce_str($value)
	{
		$this->values['nonce_str'] = $value;
	}
	/**
     * ��ȡ����ַ�����ֵ
     * @return ֵ
     **/
	public function GetNonce_str()
	{
		return $this->values['nonce_str'];
	}
	/**
     * �ж�����ַ����Ƿ����
     * @return true �� false
     **/
	public function IsNonce_strSet()
	{
		return array_key_exists('nonce_str', $this->values);
	}
	
	/**
     * ������ƷID
     * @param string $value 
     **/
	public function SetProduct_id($value)
	{
		$this->values['product_id'] = $value;
	}
	/**
     * ��ȡ��ƷID��ֵ
     * @return ֵ
     **/
	public function GetProduct_id()
	{
		return $this->values['product_id'];
	}
	/**
     * �ж���ƷID�Ƿ����
     * @return true �� false
     **/
	public function IsProduct_idSet()
	{
		return array_key_exists('product_id', $this->values);
	}
}
