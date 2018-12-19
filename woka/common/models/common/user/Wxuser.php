<?php

namespace common\models\common\user;

use Yii;

/**
 * This is the model class for table "{{%wxuser}}".
 *
 * @property integer $id
 * @property string $openid
 * @property string $nickname
 * @property integer $sex
 * @property string $city
 * @property string $province
 * @property string $country
 * @property string $headimgurl
 * @property integer $addtime
 * @property integer $issubscribe
 */
class Wxuser extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wxuser}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['openid', 'addtime'], 'required'],
            [['sex', 'addtime', 'issubscribe'], 'integer'],
            [['openid', 'nickname', 'city', 'province', 'country'], 'string', 'max' => 50],
            [['headimgurl'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'openid' => '微信OPENID',
            'nickname' => '微信昵称',
            'sex' => '性别',
            'city' => '城市',
            'province' => '省份',
            'country' => '国家',
            'headimgurl' => '微信头像',
            'addtime' => '添加时间',
            'issubscribe' => '是否关注',
        ];
    }
}
