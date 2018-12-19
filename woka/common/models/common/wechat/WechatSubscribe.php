<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_subscribe}}".
 *
 * @property integer $id
 * @property integer $wx_id
 * @property integer $type
 * @property integer $message_id
 */
class WechatSubscribe extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_subscribe}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['wx_id', 'message_id'], 'required'],
            [['wx_id', 'type', 'message_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'wx_id' => '公众号ID',
            'type' => '消息类型',
            'message_id' => '消息ID',
        ];
    }
}
