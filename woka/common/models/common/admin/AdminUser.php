<?php

namespace common\models\common\admin;

use Yii;

/**
 * This is the model class for table "{{%admin_user}}".
 *
 * @property string $id
 * @property string $uname
 * @property string $password
 * @property string $auth_key
 * @property string $last_ip
 * @property string $is_online
 * @property string $domain_account
 * @property integer $status
 * @property string $create_user
 * @property string $create_date
 * @property string $update_user
 * @property string $update_date
 *
 * @property RbacAdminUserRole[] $rbacAdminUserRoles
 */
class AdminUser extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin_user}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'password', 'create_user', 'create_date', 'update_user', 'update_date'], 'required'],
            [['status'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['username', 'domain_account', 'create_user'], 'string', 'max' => 100],
            [['password'], 'string', 'max' => 200],
            [['auth_key', 'last_ip'], 'string', 'max' => 50],
            [['is_online'], 'string', 'max' => 1],
            [['update_user'], 'string', 'max' => 101],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => '用户名',
            'password' => '密码',
            'auth_key' => '自动登录key',
            'last_ip' => '最近一次登录ip',
            'is_online' => '是否在线',
            'domain_account' => '域账号',
            'status' => '状态',
            'create_user' => '创建人',
            'create_date' => '创建时间',
            'update_user' => '更新人',
            'update_date' => '更新时间',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRbacAdminUserRoles()
    {
        return $this->hasMany(RbacAdminUserRole::className(), ['user_id' => 'id']);
    }
}
