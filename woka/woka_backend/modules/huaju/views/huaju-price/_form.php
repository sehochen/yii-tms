<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\project\huaju\HuajuList;

$parentCategory =  ArrayHelper::map(HuajuList::find()->asArray()->all(), 'id', 'title');
/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuPrice */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="huaju-price-form">

    <?php $form = ActiveForm::begin(); ?>
        
  <?= $form->field($model, 'lid')->dropDownList($parentCategory) ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
