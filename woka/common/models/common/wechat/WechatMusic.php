<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_music}}".
 *
 * @property integer $id
 * @property integer $wx_id
 * @property string $title
 * @property string $description
 * @property string $url
 * @property string $hqurl
 * @property string $media_id
 */
class WechatMusic extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_music}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['wx_id'], 'integer'],
            [['title', 'url', 'media_id'], 'required'],
            [['title', 'description', 'url', 'hqurl'], 'string', 'max' => 250],
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
            'url' => '链接地址',
            'hqurl' => '高品质地址(Wifi)',
            'media_id' => '缩略图ID',
        ];
    }
}
