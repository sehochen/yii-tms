<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\widgets\FileInput;
?>

<div class="price-proportion-update">

    <div class="price-proportion-form">
        <?php $form = ActiveForm::begin(['id' => 'w0',
                 'action' => ['excel-upload-form'],
                  'method'=>'post',
                   'options' => ['enctype' => 'multipart/form-data']
                  ]); ?>   
        
            <div class="form-group field-priceproportion-key_value required has-success">              
              
                <?= $form->field($model, 'file[]')->fileInput(
                ['multiple' => false,
'accept' => '*.xls,*.xlsx'
                    ]
                )->label("导入前请确认导入数据的完整性。已存在的手机号则会忽略导入操作！") ?>
                <div class="help-block"></div>
            </div>
              
              <div class="form-group field-priceproportion-key_value required has-success" style="display:none;">
                <label class="control-label" for="priceproportion-key_value">123</label>
                <input type="text"  class="form-control" name="goodsProportion" value="">
                <div class="help-block"></div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">导入</button>
            </div>
        <?php ActiveForm::end(); ?>
    </div>

</div>
