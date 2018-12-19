<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\project\suso\tms\SusoOrder */
/* @var $form yii\widgets\ActiveForm */
?>
 <?php $form = ActiveForm::begin(); ?>

<div class="suso-order-form">
<div class="col-lg-12">

    <div class="col-lg-6">
        <section class="panel panel-default pos-rlt clearfix" >
                    <header class="panel-heading">
                      <ul class="nav nav-pills pull-right">
                        <li>
                          <a href="#" class="panel-toggle text-muted"><i class="fa fa-caret-down text-active"></i><i class="fa fa-caret-up text"></i></a>
                        </li>
                      </ul>
                      基本信息
                    </header>
                    <div class="panel-body clearfix">
                 <?= $form->field($model, 'order_sn')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'transport_number')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'order_date')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'shipping_date')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'destination')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'product')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'tonnage')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'remarks')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

                    </div>

                  </section>
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
                        
    <?= $form->field($model, 'plate_number')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'driver')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'driver_id')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'driver_tel')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'assistant')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'assistant_id')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>
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
    <?= $form->field($model, 'carrier')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'carrier_tel')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>
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
    <?= $form->field($model, 'customer')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'customer_user')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'customer_address')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'customer_tel')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>


    </div>
    </section>
             
  
        <section class="panel panel-default pos-rlt clearfix">
                    <header class="panel-heading">
                      <ul class="nav nav-pills pull-right">
                        <li>
                          <a href="#" class="panel-toggle text-muted"><i class="fa fa-caret-down text-active"></i><i class="fa fa-caret-up text"></i></a>
                        </li>
                      </ul>
                      交运情况
                    </header>
                    <div class="panel-body clearfix">
    <?= $form->field($model, 'jydate')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'yjdate')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'realdate')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>

    <?= $form->field($model, 'reback')->textInput(['maxlength' => true,'readonly'=>'readonly']) ?>


    </div>
    </section>

                  <section class="panel panel-default pos-rlt clearfix">
                    <header class="panel-heading">
                      <ul class="nav nav-pills pull-right">
                        <li>
                          <a href="#" class="panel-toggle text-muted"><i class="fa fa-caret-down text-active"></i><i class="fa fa-caret-up text"></i></a>
                        </li>
                      </ul>
                      在途状态跟踪<span style="color:red;"></span>
                    </header>
                    <div class="panel-body clearfix">
                        <div class="pointlist">
                            <ul class="list-group no-radius">                    
                                <?php
                                foreach($modlePoints as $point)
    { ?>
<li class="list-group-item">
                                <span class="label bg-primary"><?=$point->date;?></span>
                           <span class=""><?=$point->info;?></span>
                  
                               </li>
    <?php }
                                
                                ?>

                        </ul>
                        </div>

                    

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
                      应付信息<span style="color:red;"></span>
                    </header>
                    <div class="panel-body clearfix">
                        <div class="pointlist">
                           
                              <div class="pointlist">
                            <ul class="list-group no-radius">                    
                                <?php
                                foreach($modlePoints as $point)
    { ?>
<li class="list-group-item">
                                <span class="label bg-primary"><?=$point->date;?></span>
                           <span class=""><?=$point->info;?></span>
                  
                               </li>
    <?php }
                                
                                ?>

                        </ul>
                        </div>



                    </div>

    </div>
    </section>
      
    </div>
</div>   

    <?php ActiveForm::end(); ?>
    <style>
        .ycpoint{
            line-height:20px;
        }

    </style>
</div>
<script>
    var  dw=<?= $model->tonnage?>;
    var oid=<?=$model->id?>;


</script>
