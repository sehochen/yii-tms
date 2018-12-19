<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_video}}".
 *
 * @property integer $id
 * @property integer $wx_id
 * @property string $title
 * @property string $description
 * @property string $media_id
 */
class WechatVideo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_video}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['wx_id'], 'integer'],
            [['title', 'media_id'], 'required'],
            [['title', 'description'], 'string', 'max' => 250],
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
            'wx_id' => '微信ID',
            'title' => '标题',
            'description' => '描述',
            'media_id' => '媒体文件',
        ];
    }
}
