<?php

namespace common\models\common\base;

use Yii;

/**
 * This is the model class for table "{{%suggestion}}".
 *
 * @property integer $id
 * @property integer $type
 * @property integer $uid
 * @property string $tel
 * @property string $name
 * @property string $email
 * @property integer $addtime
 * @property string $content
 * @property string $remark
 * @property integer $status
 * @property integer $isdel
 */
class Suggestion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%suggestion}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'uid', 'addtime', 'status', 'isdel'], 'integer'],
            [['content'], 'string'],
            [['tel'], 'string', 'max' => 15],
            [['name'], 'string', 'max' => 59],
            [['email', 'remark'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => '类型',
            'uid' => '用户',
            'tel' => '联系方式',
            'name' => '称呼',
            'email' => '邮箱',
            'addtime' => '提交时间',
            'content' => '提交内容',
            'remark' => '回复内容',
            'status' => '状态',
            'isdel' => '是否删除',
        ];
    }
}
