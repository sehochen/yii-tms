<?php

namespace common\models\common\cash;

use Yii;

/**
 * This is the model class for table "{{%cash_withdraw}}".
 *
 * @property integer $id
 * @property integer $uid
 * @property string $money
 * @property integer $status
 * @property integer $time
 * @property string $content
 * @property integer $retime
 * @property string $openid
 */
class CashWithdraw extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cash_withdraw}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid', 'money'], 'required'],
            [['uid', 'status', 'time', 'retime'], 'integer'],
            [['money'], 'number'],
            [['content'], 'string', 'max' => 250],
            [['openid'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => '用户id',
            'money' => '提现金额',
            'status' => '提现状态',
            'time' => '申请时间',
            'content' => '拒绝理由',
            'retime' => '回复时间',
            'openid' => 'Openid',
        ];
    }
}
