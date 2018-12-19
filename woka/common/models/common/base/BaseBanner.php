<?php

namespace common\models\common\base;

use Yii;

/**
 * This is the model class for table "{{%base_banner}}".
 *
 * @property integer $id
 * @property string $title
 * @property string $img
 * @property integer $addtime
 * @property integer $order
 * @property string $jump
 * @property integer $isshow
 */
class BaseBanner extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%base_banner}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'img'], 'required'],
            [['addtime', 'order', 'isshow'], 'integer'],
            [['title', 'img', 'jump'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => '标题',
            'img' => '图片',
            'addtime' => '添加时间',
            'order' => '排序',
            'jump' => '跳转链接',
            'isshow' => '是否展示',
        ];
    }
}
