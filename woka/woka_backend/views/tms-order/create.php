<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\project\suso\tms\SusoOrder */

$this->title = '添加订单';
$this->params['breadcrumbs'][] = ['label' => 'Suso Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="suso-order-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
