<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\components\uwidgets\kindeditor\KindEditor;
/* @var $this yii\web\View */
/* @var $model common\models\common\base\BaseBanner */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="base-banner-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>
    <div  class="form-group field-config-pwd required">
<label class="control-label" for="config-pwd">图片</label><br/>
     <?php 
    
    echo common\components\uwidgets\kindeditor\KindEditor::widget( ['clientOptions'=>['allowFileManager'=>'true',
                                            'allowUpload'=>'true'
                                            ],
                        'editorType'=>'image-dialog-simple',
                        'name'=>'img',
                          'value'=>$model->img,
                        'id'=>'img'
                        ]);
    ?>
        </div>
    <?php
    if(!empty($model->img))
    {?>
     <label>当前图片:</label>
    <img src="<?=$model->img;?>"  style="height:100px;width:auto;margin-left:20px;margin-top:10px;"/>
    <?php }
     ?>

    <?= $form->field($model, 'order')->textInput() ?>

    <?= $form->field($model, 'jump')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'isshow')->radioList(['0'=>'不显示','1'=>'显示'])?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
