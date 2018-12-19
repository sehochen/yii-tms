<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\project\suso\tms\SusoOrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '订单管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="suso-order-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加订单', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

           // 'id',
             [
               'filter' =>['0'=>'未派车','1'=>'已派车','10'=>'异常已上报','-1'=>'异常订单'],
              'attribute' => 'status',
            'format' => 'raw',
            'value' => function ($model) {
             $arr=['0'=>'未派车','1'=>'已派车','10'=>'异常已上报','-1'=>'异常订单'];
              return $arr[$model->status];
            },
           ],  
            'order_sn',
            'transport_number',
            'order_date',
           //'shipping_date',
            // 'destination',
            // 'product',
            // 'tonnage',
            // 'remarks',
            // 'from_id',
             'plate_number',
             'driver',
             'driver_id',
            // 'driver_tel',
            // 'assistant',
            // 'assistant_id',
             'carrier',
             'carrier_tel',
             'customer',
            // 'customer_user',
            // 'customer_address',
            // 'customer_tel',
            // 'remakes_control',
            // 'status',

                     [        'class' => 'yii\grid\ActionColumn',        'header' => '操作',        'template' => '{update}{delete}',      ],
        ],
    ]); ?>
</div>
