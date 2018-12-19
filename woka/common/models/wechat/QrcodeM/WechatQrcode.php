<?php

namespace common\models\wechat\QrcodeM;

use Yii;

/**
 * This is the model class for table "{{%wechat_qrcode}}".
 *
 * @property integer $id
 * @property integer $userid
 * @property string $ticket
 * @property string $qrcode
 * @property string $yqimg
 * @property string $mediaid
 */
class WechatQrcode extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_qrcode}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['userid'], 'integer'],
            [['ticket', 'yqimg'], 'string', 'max' => 250],
            [['qrcode', 'mediaid'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'userid' => '用户id',
            'ticket' => '二维码标识',
            'qrcode' => '二维码地址',
            'yqimg' => '生成的用户图片',
            'mediaid' => '资源id',
        ];
    }
}
