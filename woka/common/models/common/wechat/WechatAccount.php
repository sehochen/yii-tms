<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_account}}".
 *
 * @property integer $id
 * @property string $title
 * @property string $wechatToken
 * @property string $wechatUrl
 * @property string $wechatAPPID
 * @property string $wechatAPPSecret
 * @property string $encodingAesKey
 * @property string $wechatPic
 * @property string $mchid
 * @property string $key
 * @property string $notify_url
 */
class WechatAccount extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_account}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['wechatToken', 'wechatAPPID', 'wechatAPPSecret'], 'required'],
            [['title', 'wechatToken', 'wechatUrl', 'wechatAPPID', 'wechatAPPSecret', 'encodingAesKey', 'wechatPic'], 'string', 'max' => 45],
            [['mchid'], 'string', 'max' => 20],
            [['key'], 'string', 'max' => 50],
            [['notify_url'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => '微信名称',
            'wechatToken' => 'Token值',
            'wechatUrl' => '连接Url',
            'wechatAPPID' => 'APPID',
            'wechatAPPSecret' => '秘钥',
            'encodingAesKey' => '安全字符串',
            'wechatPic' => '头像',
            'mchid' => '商户ID',
            'key' => '支付秘钥',
            'notify_url' => '异步通知Url',
        ];
    }
}
