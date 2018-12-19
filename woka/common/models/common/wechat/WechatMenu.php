<?php

namespace common\models\common\wechat;

use Yii;

/**
 * This is the model class for table "{{%wechat_menu}}".
 *
 * @property string $id
 * @property integer $pid
 * @property string $title
 * @property string $type
 * @property integer $sort
 * @property string $url
 * @property string $media_id
 * @property string $appid
 * @property string $pagepath
 */
class WechatMenu extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wechat_menu}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'sort'], 'integer'],
            [['title'], 'required'],
            [['title', 'media_id', 'appid'], 'string', 'max' => 50],
            [['type'], 'string', 'max' => 30],
            [['url'], 'string', 'max' => 255],
            [['pagepath'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '主键',
            'pid' => '一级菜单',
            'title' => '菜单名',
            'type' => '类型',
            'sort' => '排序',
            'url' => '跳转地址',
            'media_id' => '永久素材ID',
            'appid' => '小程序APPID',
            'pagepath' => '小程序路径',
        ];
    }
    
    public static function getMenuArray($wxid=1)
    {
        $menuArr=[];
        $PArr=WechatMenu::find()
           // ->where('pid = 0')
            ->orderBy('sort desc')
            ->all();
        if(!empty($PArr))
        {
            foreach($PArr as $rowP)
            {
                $rowMenu=[];
                $rowMenu['id']=$rowP->id;
               
                $rowMenu['name']=$rowP->title;
                if($rowP->type == '0')
                {
                    $rowMenu['pid']='';
                    $rowMenu['type']='';
                    $rowMenu['code']='';                      
                }else{
                    $rowMenu['pid']=$rowP->pid;
                    $rowMenu['type']=$rowP->type;                    
                    $rowMenu['code']=$rowP->url;                   
                }
                $menuArr[]=$rowMenu;
            }
        }        
        
        return $menuArr;
    }
    
}
