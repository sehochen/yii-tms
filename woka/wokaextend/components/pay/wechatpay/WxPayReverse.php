<?php
namespace wokaextend\components\pay\wechatpay;

use wokaextend\wechat\config\WechatConfig;
use wokaextend\components\pay\wechatpay\WxPayException;

/**
 * 
 * �����������
 * @author widyhu
 *
 */
class WxPayReverse extends WxPayDataBase
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
     * ����΢�ŵĶ����ţ�����ʹ��
     * @param string $value 
     **/
	public function SetTransaction_id($value)
	{
		$this->values['transaction_id'] = $value;
	}
	/**
     * ��ȡ΢�ŵĶ����ţ�����ʹ�õ�ֵ
     * @return ֵ
     **/
	public function GetTransaction_id()
	{
		return $this->values['transaction_id'];
	}
	/**
     * �ж�΢�ŵĶ����ţ�����ʹ���Ƿ����
     * @return true �� false
     **/
	public function IsTransaction_idSet()
	{
		return array_key_exists('transaction_id', $this->values);
	}


	/**
     * �����̻�ϵͳ�ڲ��Ķ�����,transaction_id��out_trade_no��ѡһ�����ͬʱ�������ȼ���transaction_id> out_trade_no
     * @param string $value 
     **/
	public function SetOut_trade_no($value)
	{
		$this->values['out_trade_no'] = $value;
	}
	/**
     * ��ȡ�̻�ϵͳ�ڲ��Ķ�����,transaction_id��out_trade_no��ѡһ�����ͬʱ�������ȼ���transaction_id> out_trade_no��ֵ
     * @return ֵ
     **/
	public function GetOut_trade_no()
	{
		return $this->values['out_trade_no'];
	}
	/**
     * �ж��̻�ϵͳ�ڲ��Ķ�����,transaction_id��out_trade_no��ѡһ�����ͬʱ�������ȼ���transaction_id> out_trade_no�Ƿ����
     * @return true �� false
     **/
	public function IsOut_trade_noSet()
	{
		return array_key_exists('out_trade_no', $this->values);
	}


	/**
     * ��������ַ�����������32λ���Ƽ�����������㷨
     * @param string $value 
     **/
	public function SetNonce_str($value)
	{
		$this->values['nonce_str'] = $value;
	}
	/**
     * ��ȡ����ַ�����������32λ���Ƽ�����������㷨��ֵ
     * @return ֵ
     **/
	public function GetNonce_str()
	{
		return $this->values['nonce_str'];
	}
	/**
     * �ж�����ַ�����������32λ���Ƽ�����������㷨�Ƿ����
     * @return true �� false
     **/
	public function IsNonce_strSet()
	{
		return array_key_exists('nonce_str', $this->values);
	}
}