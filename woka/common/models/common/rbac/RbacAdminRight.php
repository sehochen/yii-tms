<?php

namespace common\models\common\rbac;

use Yii;

/**
 * This is the model class for table "{{%rbac_admin_right}}".
 *
 * @property integer $id
 * @property integer $menu_id
 * @property string $right_name
 * @property string $display_label
 * @property string $des
 * @property integer $display_order
 * @property string $has_lef
 * @property string $create_user
 * @property string $create_date
 * @property string $update_user
 * @property string $update_date
 *
 * @property RbacAdminMenu $menu
 * @property RbacAdminRightUrl[] $rbacAdminRightUrls
 * @property RbacAdminRoleRight[] $rbacAdminRoleRights
 */
class RbacAdminRight extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%rbac_admin_right}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['menu_id', 'right_name'], 'required'],
            [['menu_id', 'display_order'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['right_name', 'display_label', 'des'], 'string', 'max' => 200],
            [['has_lef'], 'string', 'max' => 1],
            [['create_user', 'update_user'], 'string', 'max' => 50],
            [['menu_id'], 'exist', 'skipOnError' => true, 'targetClass' => RbacAdminMenu::className(), 'targetAttribute' => ['menu_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '主键',
            'menu_id' => '功能主键',
            'right_name' => '名称',
            'display_label' => '显示名',
            'des' => '描述',
            'display_order' => '显示顺序',
            'has_lef' => '是否有子',
            'create_user' => '创建人',
            'create_date' => '创建时间',
            'update_user' => '修改人',
            'update_date' => '修改时间',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenu()
    {
        return $this->hasOne(RbacAdminMenu::className(), ['id' => 'menu_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRbacAdminRightUrls()
    {
        return $this->hasMany(RbacAdminRightUrl::className(), ['right_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRbacAdminRoleRights()
    {
        return $this->hasMany(RbacAdminRoleRight::className(), ['right_id' => 'id']);
    }
}
