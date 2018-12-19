<?php

namespace common\models\wechat\QrcodeM;

use Yii;

/**
 * This is the model class for table "{{%wechat_qrcode_user}}".
 *
 * @property integer $id
 * @property integer $uid
 * @property integer $subuid
 * @property integer $time
 * @property string $date
 * @property string $unickname
 * @property string $uheadimgurl
 * @property string $subnickname
 * @property string $subimgurl
 */
class WechatQrcodeUser extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_qrcode_user}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid', 'subuid'], 'required'],
            [['uid', 'subuid', 'time'], 'integer'],
            [['date'], 'string', 'max' => 20],
            [['unickname', 'uheadimgurl', 'subnickname', 'subimgurl'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => '推荐人id',
            'subuid' => '推荐用户id',
            'time' => '推荐人',
            'date' => '日期',
            'unickname' => 'Unickname',
            'uheadimgurl' => 'Uheadimgurl',
            'subnickname' => 'Subnickname',
            'subimgurl' => 'Subimgurl',
        ];
    }
}
