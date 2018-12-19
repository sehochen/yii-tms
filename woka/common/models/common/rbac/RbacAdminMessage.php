<?php

namespace common\models\common\rbac;

use Yii;

/**
 * This is the model class for table "{{%rbac_admin_message}}".
 *
 * @property string $id
 * @property string $msg
 * @property string $expiry_days
 * @property string $create_user
 * @property string $create_date
 * @property string $update_user
 * @property string $update_date
 */
class RbacAdminMessage extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%rbac_admin_message}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['expiry_days'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['msg'], 'string', 'max' => 1000],
            [['create_user', 'update_user'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'msg' => '留言内容',
            'expiry_days' => '有效天数',
            'create_user' => 'Create User',
            'create_date' => 'Create Date',
            'update_user' => 'Update User',
            'update_date' => 'Update Date',
        ];
    }
}
