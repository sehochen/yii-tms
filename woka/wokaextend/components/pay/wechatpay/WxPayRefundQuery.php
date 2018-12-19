<?php
namespace wokaextend\components\pay\wechatpay;

use wokaextend\wechat\config\WechatConfig;
use wokaextend\components\pay\wechatpay\WxPayException;


/**
 * 
 * �˿��ѯ�������
 * @author widyhu
 *
 */
class WxPayRefundQuery extends WxPayDataBase
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
     * ����΢��֧��������ն��豸��
     * @param string $value 
     **/
	public function SetDevice_info($value)
	{
		$this->values['device_info'] = $value;
	}
	/**
     * ��ȡ΢��֧��������ն��豸�ŵ�ֵ
     * @return ֵ
     **/
	public function GetDevice_info()
	{
		return $this->values['device_info'];
	}
	/**
     * �ж�΢��֧��������ն��豸���Ƿ����
     * @return true �� false
     **/
	public function IsDevice_infoSet()
	{
		return array_key_exists('device_info', $this->values);
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

	/**
     * ����΢�Ŷ�����
     * @param string $value 
     **/
	public function SetTransaction_id($value)
	{
		$this->values['transaction_id'] = $value;
	}
	/**
     * ��ȡ΢�Ŷ����ŵ�ֵ
     * @return ֵ
     **/
	public function GetTransaction_id()
	{
		return $this->values['transaction_id'];
	}
	/**
     * �ж�΢�Ŷ������Ƿ����
     * @return true �� false
     **/
	public function IsTransaction_idSet()
	{
		return array_key_exists('transaction_id', $this->values);
	}


	/**
     * �����̻�ϵͳ�ڲ��Ķ�����
     * @param string $value 
     **/
	public function SetOut_trade_no($value)
	{
		$this->values['out_trade_no'] = $value;
	}
	/**
     * ��ȡ�̻�ϵͳ�ڲ��Ķ����ŵ�ֵ
     * @return ֵ
     **/
	public function GetOut_trade_no()
	{
		return $this->values['out_trade_no'];
	}
	/**
     * �ж��̻�ϵͳ�ڲ��Ķ������Ƿ����
     * @return true �� false
     **/
	public function IsOut_trade_noSet()
	{
		return array_key_exists('out_trade_no', $this->values);
	}


	/**
     * �����̻��˿��
     * @param string $value 
     **/
	public function SetOut_refund_no($value)
	{
		$this->values['out_refund_no'] = $value;
	}
	/**
     * ��ȡ�̻��˿�ŵ�ֵ
     * @return ֵ
     **/
	public function GetOut_refund_no()
	{
		return $this->values['out_refund_no'];
	}
	/**
     * �ж��̻��˿���Ƿ����
     * @return true �� false
     **/
	public function IsOut_refund_noSet()
	{
		return array_key_exists('out_refund_no', $this->values);
	}


	/**
     * ����΢���˿��refund_id��out_refund_no��out_trade_no��transaction_id�ĸ���������һ�������ͬʱ�������ȼ�Ϊ��refund_id>out_refund_no>transaction_id>out_trade_no
     * @param string $value 
     **/
	public function SetRefund_id($value)
	{
		$this->values['refund_id'] = $value;
	}
	/**
     * ��ȡ΢���˿��refund_id��out_refund_no��out_trade_no��transaction_id�ĸ���������һ�������ͬʱ�������ȼ�Ϊ��refund_id>out_refund_no>transaction_id>out_trade_no��ֵ
     * @return ֵ
     **/
	public function GetRefund_id()
	{
		return $this->values['refund_id'];
	}
	/**
     * �ж�΢���˿��refund_id��out_refund_no��out_trade_no��transaction_id�ĸ���������һ�������ͬʱ�������ȼ�Ϊ��refund_id>out_refund_no>transaction_id>out_trade_no�Ƿ����
     * @return true �� false
     **/
	public function IsRefund_idSet()
	{
		return array_key_exists('refund_id', $this->values);
	}
}