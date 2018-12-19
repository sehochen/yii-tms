<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_text}}".
 *
 * @property integer $id
 * @property string $wx_id
 * @property string $text
 */
class WechatText extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_text}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['text'], 'required'],
            [['text'], 'string'],
            [['wx_id'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'wx_id' => '公众平台ID',
            'text' => '内容',
        ];
    }
}
