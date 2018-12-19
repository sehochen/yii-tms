<?php

namespace common\models\common\rbac;

use Yii;
use common\models\common\admin\AdminUser;
/**
 * This is the model class for table "{{%rbac_admin_user_role}}".
 *
 * @property integer $id
 * @property string $user_id
 * @property integer $role_id
 * @property string $create_user
 * @property string $create_date
 * @property string $update_user
 * @property string $update_date
 *
 * @property AdminUser $user
 * @property RbacAdminRole $role
 */
class RbacAdminUserRole extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%rbac_admin_user_role}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'role_id'], 'required'],
            [['user_id', 'role_id'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['create_user', 'update_user'], 'string', 'max' => 50],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => AdminUser::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => RbacAdminRole::className(), 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '主键',
            'user_id' => '用户id',
            'role_id' => '角色',
            'create_user' => '创建人',
            'create_date' => '创建时间',
            'update_user' => '修改人',
            'update_date' => '修改时间',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(AdminUser::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(RbacAdminRole::className(), ['id' => 'role_id']);
    }
}
