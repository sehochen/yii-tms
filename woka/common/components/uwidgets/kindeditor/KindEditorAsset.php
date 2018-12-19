<?php

/**
 *  KindEditorAsset资源引用
 * @author vanzer
 * @date 2016-06-24
 */

namespace common\components\uwidgets\kindeditor;
use yii\web\AssetBundle;
class KindEditorAsset extends AssetBundle {
    //put your code here
    public $js=[
        'kindeditor-all.js',
        'lang/zh_cn.js',
       // 'kindeditor.js'
    ];
    public $css=[
        'themes/default/default.css'
    ];

    public $jsOptions=[
        'charset'=>'utf8',
    ];


    public function init() {
        //资源所在目录
        $this->sourcePath = dirname(__FILE__) . DIRECTORY_SEPARATOR ;
    }
}

?>
