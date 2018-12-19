<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_media}}".
 *
 * @property integer $ID
 * @property integer $wx_id
 * @property integer $type
 * @property string $media_id
 * @property string $url
 * @property integer $addtime
 */
class WechatMedia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_media}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['wx_id', 'type', 'addtime'], 'integer'],
            [['type', 'media_id', 'addtime'], 'required'],
            [['media_id'], 'string', 'max' => 50],
            [['url'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'wx_id' => '微信ID',
            'type' => '类型',
            'media_id' => 'mediaID',
            'url' => 'URl地址',
            'addtime' => '添加时间',
        ];
    }
}
