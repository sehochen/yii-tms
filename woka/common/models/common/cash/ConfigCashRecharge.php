<?php

namespace common\models\common\cash;

use Yii;

/**
 * This is the model class for table "{{%config_cash_recharge}}".
 *
 * @property integer $id
 * @property string $money
 * @property integer $isshow
 */
class ConfigCashRecharge extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%config_cash_recharge}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['money'], 'number'],
            [['isshow'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'money' => '充值金额',
            'isshow' => '是否显示',
        ];
    }
}
