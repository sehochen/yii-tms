<?php

namespace common\models\common\rbac;

use Yii;

/**
 * This is the model class for table "{{%rbac_admin_module}}".
 *
 * @property integer $id
 * @property string $code
 * @property string $display_label
 * @property string $has_lef
 * @property string $des
 * @property string $entry_url
 * @property integer $display_order
 * @property string $create_user
 * @property string $create_date
 * @property string $update_user
 * @property string $update_date
 *
 * @property RbacAdminMenu[] $rbacAdminMenus
 */
class RbacAdminModule extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%rbac_admin_module}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'display_label'], 'required'],
            [['display_order'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['code', 'create_user', 'update_user'], 'string', 'max' => 50],
            [['display_label'], 'string', 'max' => 200],
            [['has_lef'], 'string', 'max' => 1],
            [['des'], 'string', 'max' => 400],
            [['entry_url'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '主键',
            'code' => 'code',
            'display_label' => '显示名称',
            'has_lef' => '是否有子',
            'des' => '描述',
            'entry_url' => '入口地址',
            'display_order' => '顺序',
            'create_user' => '创建人',
            'create_date' => '创建时间',
            'update_user' => '修改人',
            'update_date' => '修改时间',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRbacAdminMenus()
    {
        return $this->hasMany(RbacAdminMenu::className(), ['module_id' => 'id']);
    }
}
