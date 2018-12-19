<?php

namespace common\models\project\suso\tms;

use Yii;

/**
 * This is the model class for table "{{%suso_yf}}".
 *
 * @property integer $id
 * @property integer $oid
 * @property string $price
 * @property string $freight
 * @property string $compensatory
 * @property string $all
 * @property string $marks
 */
class SusoYf extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%suso_yf}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['oid', 'price', 'freight', 'compensatory', 'all'], 'required'],
            [['oid'], 'integer'],
            [['price', 'freight', 'compensatory', 'all'], 'number'],
            [['marks'], 'string', 'max' => 500],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'oid' => '订单',
            'price' => '应付价格',
            'freight' => '应付运费',
            'compensatory' => '补偿金额',
            'all' => '应付金额',
            'marks' => '备注',
        ];
    }
}
