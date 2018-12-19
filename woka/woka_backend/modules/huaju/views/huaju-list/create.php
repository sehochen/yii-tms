<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuList */

$this->title = '添加话剧';
$this->params['breadcrumbs'][] = ['label' => 'Huaju Lists', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="huaju-list-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
