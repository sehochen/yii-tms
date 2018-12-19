<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuPrice */

$this->title = '添加话剧价格';
$this->params['breadcrumbs'][] = ['label' => 'Huaju Prices', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="huaju-price-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
