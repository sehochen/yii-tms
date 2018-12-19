<?php
namespace wokaextend\components\pay\wechatpay;

use wokaextend\wechat\config\WechatConfig;
use wokaextend\components\pay\wechatpay\WxPayException;
/**
 * 
 * ���ض��˵��������
 * @author widyhu
 *
 */
class WxPayDownloadBill extends WxPayDataBase
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
     * ����΢��֧��������ն��豸�ţ���д���ֶΣ�ֻ���ظ��豸�ŵĶ��˵�
     * @param string $value 
     **/
	public function SetDevice_info($value)
	{
		$this->values['device_info'] = $value;
	}
	/**
     * ��ȡ΢��֧��������ն��豸�ţ���д���ֶΣ�ֻ���ظ��豸�ŵĶ��˵���ֵ
     * @return ֵ
     **/
	public function GetDevice_info()
	{
		return $this->values['device_info'];
	}
	/**
     * �ж�΢��֧��������ն��豸�ţ���д���ֶΣ�ֻ���ظ��豸�ŵĶ��˵��Ƿ����
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
     * �������ض��˵������ڣ���ʽ��20140603
     * @param string $value 
     **/
	public function SetBill_date($value)
	{
		$this->values['bill_date'] = $value;
	}
	/**
     * ��ȡ���ض��˵������ڣ���ʽ��20140603��ֵ
     * @return ֵ
     **/
	public function GetBill_date()
	{
		return $this->values['bill_date'];
	}
	/**
     * �ж����ض��˵������ڣ���ʽ��20140603�Ƿ����
     * @return true �� false
     **/
	public function IsBill_dateSet()
	{
		return array_key_exists('bill_date', $this->values);
	}


	/**
     * ����ALL�����ص������ж�����Ϣ��Ĭ��ֵSUCCESS�����ص��ճɹ�֧���Ķ���REFUND�����ص����˿��REVOKED���ѳ����Ķ���
     * @param string $value 
     **/
	public function SetBill_type($value)
	{
		$this->values['bill_type'] = $value;
	}
	/**
     * ��ȡALL�����ص������ж�����Ϣ��Ĭ��ֵSUCCESS�����ص��ճɹ�֧���Ķ���REFUND�����ص����˿��REVOKED���ѳ����Ķ�����ֵ
     * @return ֵ
     **/
	public function GetBill_type()
	{
		return $this->values['bill_type'];
	}
	/**
     * �ж�ALL�����ص������ж�����Ϣ��Ĭ��ֵSUCCESS�����ص��ճɹ�֧���Ķ���REFUND�����ص����˿��REVOKED���ѳ����Ķ����Ƿ����
     * @return true �� false
     **/
	public function IsBill_typeSet()
	{
		return array_key_exists('bill_type', $this->values);
	}
}
