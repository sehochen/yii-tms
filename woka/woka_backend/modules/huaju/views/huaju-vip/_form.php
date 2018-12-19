<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuVip */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="huaju-vip-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cardnum')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'num')->textInput() ?>
        <?= $form->field($model, 'isbind')->radioList(['0'=>'未绑定','1'=>'已绑定'])?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
