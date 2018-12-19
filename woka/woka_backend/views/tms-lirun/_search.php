<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\project\suso\tms\SusoOrderSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="suso-order-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'order_sn') ?>

    <?= $form->field($model, 'transport_number') ?>

    <?= $form->field($model, 'order_date') ?>

    <?= $form->field($model, 'shipping_date') ?>

    <?php // echo $form->field($model, 'destination') ?>

    <?php // echo $form->field($model, 'product') ?>

    <?php // echo $form->field($model, 'tonnage') ?>

    <?php // echo $form->field($model, 'remarks') ?>

    <?php // echo $form->field($model, 'from_id') ?>

    <?php // echo $form->field($model, 'plate_number') ?>

    <?php // echo $form->field($model, 'driver') ?>

    <?php // echo $form->field($model, 'driver_id') ?>

    <?php // echo $form->field($model, 'driver_tel') ?>

    <?php // echo $form->field($model, 'assistant') ?>

    <?php // echo $form->field($model, 'assistant_id') ?>

    <?php // echo $form->field($model, 'carrier') ?>

    <?php // echo $form->field($model, 'carrier_tel') ?>

    <?php // echo $form->field($model, 'customer') ?>

    <?php // echo $form->field($model, 'customer_user') ?>

    <?php // echo $form->field($model, 'customer_address') ?>

    <?php // echo $form->field($model, 'customer_tel') ?>

    <?php // echo $form->field($model, 'remakes_control') ?>

    <?php // echo $form->field($model, 'status') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
