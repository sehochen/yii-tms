<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_voice}}".
 *
 * @property integer $id
 * @property integer $wx_id
 * @property string $media_id
 */
class WechatVoice extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_voice}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['wx_id'], 'integer'],
            [['media_id'], 'required'],
            [['media_id'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'wx_id' => 'Wx ID',
            'media_id' => 'Media ID',
        ];
    }
}
