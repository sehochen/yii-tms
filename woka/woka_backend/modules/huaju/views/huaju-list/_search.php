<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuListSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="huaju-list-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'begin_time') ?>

    <?= $form->field($model, 'end_time') ?>

    <?= $form->field($model, 'img') ?>

    <?php // echo $form->field($model, 'address') ?>

    <?php // echo $form->field($model, 'content_ld') ?>

    <?php // echo $form->field($model, 'content') ?>

    <?php // echo $form->field($model, 'content_sm') ?>

    <?php // echo $form->field($model, 'isshow') ?>

    <?php // echo $form->field($model, 'order') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
