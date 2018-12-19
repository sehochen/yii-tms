<?php

namespace common\models\common\cash;

use Yii;

/**
 * This is the model class for table "{{%qiyo_cash_pay}}".
 *
 * @property integer $id
 * @property string $ordersn
 * @property string $money
 * @property integer $uid
 * @property integer $addtime
 * @property integer $paytime
 * @property integer $paystatus
 * @property string $reinfo
 * @property integer $paytype
 * @property integer $type
 * @property string $params
 */
class QiyoCashPay extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%qiyo_cash_pay}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ordersn', 'money', 'uid', 'addtime'], 'required'],
            [['money'], 'number'],
            [['uid', 'addtime', 'paytime', 'paystatus', 'paytype', 'type'], 'integer'],
            [['reinfo'], 'string'],
            [['ordersn'], 'string', 'max' => 50],
            [['params'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ordersn' => '支付订单单号',
            'money' => '支付金额',
            'uid' => '用户',
            'addtime' => '添加时间',
            'paytime' => '支付时间',
            'paystatus' => '支付状态',
            'reinfo' => '返回信息',
            'paytype' => '支付方式',
            'type' => '支付类型1充值',
            'params' => '支付参数',
        ];
    }
}
