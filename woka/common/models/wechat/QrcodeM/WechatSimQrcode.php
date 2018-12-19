<?php

namespace common\models\wechat\QrcodeM;

use Yii;

/**
 * This is the model class for table "{{%wechat_sim_qrcode}}".
 *
 * @property integer $id
 * @property string $ticketcode
 * @property string $openid
 * @property string $date
 */
class WechatSimQrcode extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_sim_qrcode}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ticketcode'], 'string', 'max' => 100],
            [['openid'], 'string', 'max' => 45],
            [['date'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ticketcode' => 'ticket编码',
            'openid' => '用户openid',
            'date' => '时间',
        ];
    }
}
