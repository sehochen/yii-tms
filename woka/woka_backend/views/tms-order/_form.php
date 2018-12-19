<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\datetime\DateTimePicker;
/* @var $this yii\web\View */
/* @var $model common\models\project\suso\tms\SusoOrder */
/* @var $form yii\widgets\ActiveForm */
?>
 <?php $form = ActiveForm::begin(); ?>

<div class="suso-order-form">
<div class="col-lg-12">

    <div class="col-lg-6">
        <section class="panel panel-default pos-rlt clearfix">
                    <header class="panel-heading">
                      <ul class="nav nav-pills pull-right">
                        <li>
                          <a href="#" class="panel-toggle text-muted"><i class="fa fa-caret-down text-active"></i><i class="fa fa-caret-up text"></i></a>
                        </li>
                      </ul>
                      基本信息
                    </header>
                    <div class="panel-body clearfix">
                 <?= $form->field($model, 'order_sn')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'transport_number')->textInput(['maxlength' => true]) ?>

   
   <?= $form->field($model, 'order_date')->widget(DateTimePicker::classname(), [
        'options' => ['placeholder' => ''],
        'pluginOptions' => [
            'autoclose' => true,
             'startDate'=>date("Y-m-d H:i:s"),
        ]
    ]); ?>
    <?= $form->field($model, 'shipping_date')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'destination')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tonnage')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'remarks')->textInput(['maxlength' => true]) ?>

                    </div>
                  </section>

    </div>

       <div class="col-lg-6">
        <section class="panel panel-default pos-rlt clearfix">
                    <header class="panel-heading">
                      <ul class="nav nav-pills pull-right">
                        <li>
                          <a href="#" class="panel-toggle text-muted"><i class="fa fa-caret-down text-active"></i><i class="fa fa-caret-up text"></i></a>
                        </li>
                      </ul>
                      驾驶员信息
                    </header>
                    <div class="panel-body clearfix">
                        
    <?= $form->field($model, 'plate_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'driver')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'driver_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'driver_tel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'assistant')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'assistant_id')->textInput(['maxlength' => true]) ?>
  </div>
                  </section>


        <section class="panel panel-default pos-rlt clearfix">
                    <header class="panel-heading">
                      <ul class="nav nav-pills pull-right">
                        <li>
                          <a href="#" class="panel-toggle text-muted"><i class="fa fa-caret-down text-active"></i><i class="fa fa-caret-up text"></i></a>
                        </li>
                      </ul>
                      承运人信息
                    </header>
             <div class="panel-body clearfix">
    <?= $form->field($model, 'carrier')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'carrier_tel')->textInput(['maxlength' => true]) ?>
  </div>
                  </section>
           
        <section class="panel panel-default pos-rlt clearfix">
                    <header class="panel-heading">
                      <ul class="nav nav-pills pull-right">
                        <li>
                          <a href="#" class="panel-toggle text-muted"><i class="fa fa-caret-down text-active"></i><i class="fa fa-caret-up text"></i></a>
                        </li>
                      </ul>
                      客户信息
                    </header>
                    <div class="panel-body clearfix">
    <?= $form->field($model, 'customer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_user')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_tel')->textInput(['maxlength' => true]) ?>


    </div>
    </section>

    </div>
</div>

     <?= $form->field($model, 'remakes_control')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'status')->radioList(['0'=>'未派车','1'=>'已派车','10'=>'异常已上报','-1'=>'异常订单'])?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
