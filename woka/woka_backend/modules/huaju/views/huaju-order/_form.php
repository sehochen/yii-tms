<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\project\huaju\HuajuList;
use yii\helpers\ArrayHelper;
$parentCategory =  ArrayHelper::map(HuajuList::find()->asArray()->all(), 'id', 'title');
/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuOrder */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="huaju-order-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ordersn')->textInput(['maxlength' => true]) ?>



    <?= $form->field($model, 'by')->radioList(['0'=>'会员卡','1'=>'非会员卡'])?>

  <?= $form->field($model, 'lid')->dropDownList($parentCategory) ?>

    <?= $form->field($model, 'paymoney')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'num')->textInput() ?>

    <?= $form->field($model, 'zw')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'status')->radioList(['0'=>'未支付','1'=>'未分配','2'=>'分配完成','3'=>'作废'])?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
