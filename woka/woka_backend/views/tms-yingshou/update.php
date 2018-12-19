<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\project\suso\tms\SusoOrder */

$this->title = '应收信息维护' ;
$this->params['breadcrumbs'][] = ['label' => 'Suso Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="suso-order-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modlePoints'=>$modlePoints,
        'modelYs'=>$modelYs
    ]) ?>

</div>
