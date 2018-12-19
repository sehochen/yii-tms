<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\project\suso\tms\SusoOrder */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="suso-order-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'order_sn')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'transport_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'order_date')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'shipping_date')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'destination')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tonnage')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'remarks')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'from_id')->textInput() ?>

    <?= $form->field($model, 'plate_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'driver')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'driver_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'driver_tel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'assistant')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'assistant_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'carrier')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'carrier_tel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_user')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_tel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'remakes_control')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
