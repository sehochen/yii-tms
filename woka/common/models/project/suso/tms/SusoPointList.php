<?php

namespace common\models\project\suso\tms;

use Yii;

/**
 * This is the model class for table "{{%suso_point_list}}".
 *
 * @property integer $id
 * @property integer $oid
 * @property string $date
 * @property string $info
 * @property integer $addtime
 */
class SusoPointList extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%suso_point_list}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['oid', 'date', 'info', 'addtime'], 'required'],
            [['oid', 'addtime'], 'integer'],
            [['date'], 'string', 'max' => 30],
            [['info'], 'string', 'max' => 250],
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
            'date' => '日期',
            'info' => '在途状态',
            'addtime' => '添加日期',
        ];
    }
}
