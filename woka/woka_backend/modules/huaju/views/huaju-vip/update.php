<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuVip */

$this->title = '修改会员' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Huaju Vips', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="huaju-vip-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
