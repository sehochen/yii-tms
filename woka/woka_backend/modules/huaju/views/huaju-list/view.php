<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuList */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Huaju Lists', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="huaju-list-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            'begin_time:datetime',
            'end_time:datetime',
            'img',
            'address',
            'content_ld:ntext',
            'content:ntext',
            'content_sm:ntext',
            'isshow',
            'order',
        ],
    ]) ?>

</div>
