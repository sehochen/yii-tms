<?php
namespace wokaextend\components\pay\wechatpay;

use wokaextend\wechat\config\WechatConfig;
use wokaextend\components\pay\wechatpay\WxPayException;


/**
 * 
 * �ύ�˿��������
 * @author widyhu
 *
 */
class WxPayRefund extends WxPayDataBase
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
     * ����΢��֧��������ն��豸�ţ����µ�һ��
     * @param string $value 
     **/
	public function SetDevice_info($value)
	{
		$this->values['device_info'] = $value;
	}
	/**
     * ��ȡ΢��֧��������ն��豸�ţ����µ�һ�µ�ֵ
     * @return ֵ
     **/
	public function GetDevice_info()
	{
		return $this->values['device_info'];
	}
	/**
     * �ж�΢��֧��������ն��豸�ţ����µ�һ���Ƿ����
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
     * �����̻�ϵͳ�ڲ����˿�ţ��̻�ϵͳ�ڲ�Ψһ��ͬһ�˿�Ŷ������ֻ��һ��
     * @param string $value 
     **/
	public function SetOut_refund_no($value)
	{
		$this->values['out_refund_no'] = $value;
	}
	/**
     * ��ȡ�̻�ϵͳ�ڲ����˿�ţ��̻�ϵͳ�ڲ�Ψһ��ͬһ�˿�Ŷ������ֻ��һ�ʵ�ֵ
     * @return ֵ
     **/
	public function GetOut_refund_no()
	{
		return $this->values['out_refund_no'];
	}
	/**
     * �ж��̻�ϵͳ�ڲ����˿�ţ��̻�ϵͳ�ڲ�Ψһ��ͬһ�˿�Ŷ������ֻ��һ���Ƿ����
     * @return true �� false
     **/
	public function IsOut_refund_noSet()
	{
		return array_key_exists('out_refund_no', $this->values);
	}


	/**
     * ���ö����ܽ���λΪ�֣�ֻ��Ϊ���������֧�����
     * @param string $value 
     **/
	public function SetTotal_fee($value)
	{
		$this->values['total_fee'] = $value;
	}
	/**
     * ��ȡ�����ܽ���λΪ�֣�ֻ��Ϊ���������֧������ֵ
     * @return ֵ
     **/
	public function GetTotal_fee()
	{
		return $this->values['total_fee'];
	}
	/**
     * �ж϶����ܽ���λΪ�֣�ֻ��Ϊ���������֧������Ƿ����
     * @return true �� false
     **/
	public function IsTotal_feeSet()
	{
		return array_key_exists('total_fee', $this->values);
	}


	/**
     * �����˿��ܽ������ܽ���λΪ�֣�ֻ��Ϊ���������֧�����
     * @param string $value 
     **/
	public function SetRefund_fee($value)
	{
		$this->values['refund_fee'] = $value;
	}
	/**
     * ��ȡ�˿��ܽ������ܽ���λΪ�֣�ֻ��Ϊ���������֧������ֵ
     * @return ֵ
     **/
	public function GetRefund_fee()
	{
		return $this->values['refund_fee'];
	}
	/**
     * �ж��˿��ܽ������ܽ���λΪ�֣�ֻ��Ϊ���������֧������Ƿ����
     * @return true �� false
     **/
	public function IsRefund_feeSet()
	{
		return array_key_exists('refund_fee', $this->values);
	}


	/**
     * ���û������ͣ�����ISO 4217��׼����λ��ĸ���룬Ĭ������ң�CNY������ֵ�б������������
     * @param string $value 
     **/
	public function SetRefund_fee_type($value)
	{
		$this->values['refund_fee_type'] = $value;
	}
	/**
     * ��ȡ�������ͣ�����ISO 4217��׼����λ��ĸ���룬Ĭ������ң�CNY������ֵ�б�����������͵�ֵ
     * @return ֵ
     **/
	public function GetRefund_fee_type()
	{
		return $this->values['refund_fee_type'];
	}
	/**
     * �жϻ������ͣ�����ISO 4217��׼����λ��ĸ���룬Ĭ������ң�CNY������ֵ�б�������������Ƿ����
     * @return true �� false
     **/
	public function IsRefund_fee_typeSet()
	{
		return array_key_exists('refund_fee_type', $this->values);
	}


	/**
     * ���ò���Ա�ʺ�, Ĭ��Ϊ�̻���
     * @param string $value 
     **/
	public function SetOp_user_id($value)
	{
		$this->values['op_user_id'] = $value;
	}
	/**
     * ��ȡ����Ա�ʺ�, Ĭ��Ϊ�̻��ŵ�ֵ
     * @return ֵ
     **/
	public function GetOp_user_id()
	{
		return $this->values['op_user_id'];
	}
	/**
     * �жϲ���Ա�ʺ�, Ĭ��Ϊ�̻����Ƿ����
     * @return true �� false
     **/
	public function IsOp_user_idSet()
	{
		return array_key_exists('op_user_id', $this->values);
	}
}