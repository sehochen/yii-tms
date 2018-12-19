<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\project\suso\tms\SusoOrder */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Suso Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="suso-order-view">

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
            'order_sn',
            'transport_number',
            'order_date',
            'shipping_date',
            'destination',
            'product',
            'tonnage',
            'remarks',
            'from_id',
            'plate_number',
            'driver',
            'driver_id',
            'driver_tel',
            'assistant',
            'assistant_id',
            'carrier',
            'carrier_tel',
            'customer',
            'customer_user',
            'customer_address',
            'customer_tel',
            'remakes_control',
            'status',
            'jydate',
            'yjdate',
            'realdate',
            'reback',
        ],
    ]) ?>

</div>
