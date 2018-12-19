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
           
    </div>

       <div class="col-lg-6">
  
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

                           <?= $form->field($model, 'jydate')->widget(DateTimePicker::classname(), [
        'options' => ['placeholder' => ''],
        'pluginOptions' => [
            'autoclose' => true,
             'startDate'=>date("Y-m-d H:i:s"),
        ]
    ]); ?>


                         <?= $form->field($model, 'yjdate')->widget(DateTimePicker::classname(), [
        'options' => ['placeholder' => ''],
        'pluginOptions' => [
            'autoclose' => true,
             'startDate'=>date("Y-m-d H:i:s"),
        ]
    ]); ?>
       <?= $form->field($model, 'realdate')->widget(DateTimePicker::classname(), [
        'options' => ['placeholder' => ''],
        'pluginOptions' => [
            'autoclose' => true,
             'startDate'=>date("Y-m-d H:i:s"),
        ]
    ]); ?>



    <?= $form->field($model, 'reback')->textInput(['maxlength' => true]) ?>


    </div>
    </section>

                  <section class="panel panel-default pos-rlt clearfix">
                    <header class="panel-heading">
                      <ul class="nav nav-pills pull-right">
                        <li>
                          <a href="#" class="panel-toggle text-muted"><i class="fa fa-caret-down text-active"></i><i class="fa fa-caret-up text"></i></a>
                        </li>
                      </ul>
                      在途状态跟踪<span style="color:red;"> (添加/删除 实时同步 不需要点最下面的【修改】按钮)</span>
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
                          <span onclick="delPoint(<?=$point->id;?>,$(this));" class="ycpoint label  btn bg-primary  pull-right">移除信息</span>
                               </li>
    <?php }
                                
                                ?>

                        </ul>
                        </div>

                        <hr/>
               <div class="panel-body">                
                    <div class="form-group">
                      <label class="sr-only" for="exampleInputEmail2">Email address</label>
             <?php     echo DateTimePicker::widget([
    'name' => 'datetime_10',
    'id'=>'pointdate',
     'value'=>date('Y-m-d H:i:s'),
    'options' => ['placeholder' => 'Select operating time ...'],
    'convertFormat' => true,
    'pluginOptions' => [
     'id'=>'pointdate',
         'autoclose' => true,
        'startDate' =>date('Y-m-d H:i:s'),
        'todayHighlight' => true
       
    ]
]); ?>

                    </div>
                    <div class="form-group">
                      <label class="sr-only" for="exampleInputPassword2">Password</label>
                      <input type="text" class="form-control" id="pointinfo" placeholder="请输入在途状态">
                    </div>                
                    <a href="javascript:void(0);" class="btn btn-success" data-toggle="modal" onclick="addPoint();">添加新定位信息</a>    
                </div>

    </div>
    </section>
    </div>
</div>

    <?= $form->field($model, 'remakes_control')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'status')->radioList(['1'=>'已派车','2'=>'回访中','-1'=>'异常已上报','-2'=>'异常订单'])?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
    <style>
        .ycpoint{
            line-height:20px;
        }

    </style>
</div>
<script>
    var oid=<?=$model->id?>;
    function delPoint(id,ele)
    {
       
        
            $.ajax({
                url: "/backend.php/api/del-point",
                type: "post",
                dataType: "json",
                data: {
                    oid: oid,
                    pid: id
                },
                success: function (data) {
                    if(data.status == 0)
                    {
                        ele.parent().remove();
                    }else{
                        alert(data.message);
                    }

                }
            });
         

    }
    /**
    *
    */
    function addPoint()
    {
        var pointdate = $("#pointdate").val();
        var pointinfo = $("#pointinfo").val();
        if(pointdate == '')
        {
            alert("请输入日期");
            return false;
        }
        if (pointinfo == '') {
            alert("请输入在途状态");
            return false;
        }

        $.ajax({
            url: "/backend.php/api/add-point",
            type: "post",
            dataType: "json",
            data: {
                oid: oid,
                pointdate: pointdate,
                pointinfo: pointinfo
            },
            success: function (data) {
       
                if(data.status == 0)
                {
                    
                    var html = '  </li>';
                    html += '          <li class="list-group-item">';
                    html += '                  <span class="label bg-primary">' + pointdate + '</span>';
                    html += pointinfo+'</span>';
                    html += '  <span onclick="delPoint('+data.data+',$(this));" class="ycpoint label  btn bg-primary  pull-right">移除信息</span>';
                    html += '  </li>';
               
                    $(".pointlist ul").append(html);
                }else{
                    alert(data.message);
                }

            }
        });



    }
</script>
