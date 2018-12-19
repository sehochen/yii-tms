<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuOrderSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="huaju-order-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'ordersn') ?>

    <?= $form->field($model, 'uid') ?>

    <?= $form->field($model, 'by') ?>

    <?= $form->field($model, 'lid') ?>

    <?php // echo $form->field($model, 'paymoney') ?>

    <?php // echo $form->field($model, 'num') ?>

    <?php // echo $form->field($model, 'zw') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'addtime') ?>

    <?php // echo $form->field($model, 'paytime') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
