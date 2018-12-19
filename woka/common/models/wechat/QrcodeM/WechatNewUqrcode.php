<?php

namespace common\models\wechat\QrcodeM;

use Yii;

/**
 * This is the model class for table "{{%wechat_new_uqrcode}}".
 *
 * @property integer $id
 * @property integer $userid
 * @property string $ticket
 * @property string $qrcode
 * @property string $yqimg
 * @property string $mediaid
 */
class WechatNewUqrcode extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_new_uqrcode}}';
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
            'userid' => 'Userid',
            'ticket' => 'Ticket',
            'qrcode' => 'Qrcode',
            'yqimg' => 'Yqimg',
            'mediaid' => 'Mediaid',
        ];
    }
}
