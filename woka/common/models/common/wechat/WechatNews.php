<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_news}}".
 *
 * @property integer $id
 * @property integer $wx_id
 * @property string $title
 * @property string $descrpition
 * @property string $pic
 */
class WechatNews extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_news}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['wx_id'], 'integer'],
            [['title', 'pic'], 'required'],
            [['descrpition'], 'string'],
            [['title', 'pic'], 'string', 'max' => 250],
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
            'descrpition' => '描述',
            'pic' => '大图360*200，小图200*200',
        ];
    }
}
