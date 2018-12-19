<?php

namespace common\models\project\suso\tms;

use Yii;

/**
 * This is the model class for table "{{%suso_order}}".
 *
 * @property integer $id
 * @property string $order_sn
 * @property string $transport_number
 * @property string $order_date
 * @property string $shipping_date
 * @property string $destination
 * @property string $product
 * @property string $tonnage
 * @property string $remarks
 * @property integer $from_id
 * @property string $plate_number
 * @property string $driver
 * @property string $driver_id
 * @property string $driver_tel
 * @property string $assistant
 * @property string $assistant_id
 * @property string $carrier
 * @property string $carrier_tel
 * @property string $customer
 * @property string $customer_user
 * @property string $customer_address
 * @property string $customer_tel
 * @property string $remakes_control
 * @property integer $status
 * @property string $jydate
 * @property string $yjdate
 * @property string $realdate
 * @property string $reback
 */
class SusoOrder extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%suso_order}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_sn', 'transport_number'], 'required'],
            [['from_id', 'status'], 'integer'],
            [['order_sn', 'transport_number'], 'string', 'max' => 200],
            [['order_date', 'shipping_date', 'driver', 'driver_id', 'driver_tel', 'assistant', 'assistant_id', 'carrier', 'carrier_tel', 'customer_user', 'customer_tel'], 'string', 'max' => 30],
            [['destination', 'remarks', 'customer', 'customer_address', 'remakes_control', 'jydate', 'yjdate', 'realdate', 'reback'], 'string', 'max' => 250],
            [['product', 'tonnage'], 'string', 'max' => 50],
            [['plate_number'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'order_sn' => '订单号',
            'transport_number' => '交运单号',
            'order_date' => '下单日期',
            'shipping_date' => '出货日期',
            'destination' => '目的地',
            'product' => '产品别',
            'tonnage' => '吨位',
            'remarks' => '订单备注',
            'from_id' => '订单出处',
            'plate_number' => '车牌号',
            'driver' => '驾驶员姓名',
            'driver_id' => '驾驶员证件号',
            'driver_tel' => '驾驶员电话',
            'assistant' => '助手姓名',
            'assistant_id' => '助手证件号',
            'carrier' => '承运人',
            'carrier_tel' => '承运人电话',
            'customer' => '客户名称',
            'customer_user' => '客户联系人',
            'customer_address' => '客户地址',
            'customer_tel' => '客户电话',
            'remakes_control' => '调度备注',
            'status' => '订单状态',
            'jydate' => '交运期',
            'yjdate' => '预计到货日期',
            'realdate' => '实际到货日期',
            'reback' => '客户反馈',
        ];
    }
}
