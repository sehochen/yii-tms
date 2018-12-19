<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\project\suso\tms\SusoOrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '应收订单';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="suso-order-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'order_sn',
            'transport_number',
            'order_date',
            'shipping_date',
             'destination',
            // 'product',
            // 'tonnage',
            // 'remarks',
            // 'from_id',
            // 'plate_number',
            // 'driver',
            // 'driver_id',
            // 'driver_tel',
            // 'assistant',
            // 'assistant_id',
            // 'carrier',
            // 'carrier_tel',
            // 'customer',
            // 'customer_user',
            // 'customer_address',
            // 'customer_tel',
            // 'remakes_control',
            // 'status',
            // 'jydate',
            // 'yjdate',
            // 'realdate',
            // 'reback',

            [        'class' => 'yii\grid\ActionColumn',        'header' => '操作',        'template' => '{update}{delete}',      ],
        ],
    ]); ?>
</div>
