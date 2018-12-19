<?php

namespace common\models\common\rbac;

use Yii;

/**
 * This is the model class for table "{{%rbac_admin_role_right}}".
 *
 * @property integer $id
 * @property integer $role_id
 * @property integer $right_id
 * @property string $full_path
 * @property string $create_user
 * @property string $create_date
 * @property string $update_user
 * @property string $update_date
 *
 * @property RbacAdminRight $right
 */
class RbacAdminRoleRight extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%rbac_admin_role_right}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['role_id', 'right_id'], 'required'],
            [['role_id', 'right_id'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['full_path'], 'string', 'max' => 250],
            [['create_user', 'update_user'], 'string', 'max' => 50],
            [['right_id'], 'exist', 'skipOnError' => true, 'targetClass' => RbacAdminRight::className(), 'targetAttribute' => ['right_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '主键',
            'role_id' => '角色主键',
            'right_id' => '权限主键',
            'full_path' => '全路径',
            'create_user' => '创建人',
            'create_date' => '创建时间',
            'update_user' => '修改人',
            'update_date' => '修改时间',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRight()
    {
        return $this->hasOne(RbacAdminRight::className(), ['id' => 'right_id']);
    }
}
