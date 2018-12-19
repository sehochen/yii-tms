<?php

namespace common\models\common\cash;

use Yii;

/**
 * This is the model class for table "{{%cash_log}}".
 *
 * @property integer $id
 * @property integer $uid
 * @property string $content
 * @property integer $time
 * @property string $before_money
 * @property string $change_money
 * @property integer $type
 */
class CashLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cash_log}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid', 'time'], 'required'],
            [['uid', 'time', 'type'], 'integer'],
            [['before_money', 'change_money'], 'number'],
            [['content'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => '用户',
            'content' => '资金变动信息',
            'time' => '时间',
            'before_money' => '变动之前金额',
            'change_money' => '变动金额',
            'type' => '变动类型',
        ];
    }
}
