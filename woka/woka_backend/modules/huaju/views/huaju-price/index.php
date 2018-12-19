<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\project\huaju\HuajuList;

use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $searchModel common\models\project\huaju\HuajuPriceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$parentCategory =  ArrayHelper::map(HuajuList::find()->asArray()->all(), 'id', 'title');
$this->title = '话剧价格管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="huaju-price-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加话剧价格', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

          //  'id',
                  [
            'attribute' => 'lid',
            'value' => function ($model) {
           $modelL=HuajuList::findOne($model->lid);
           if($modelL)
           {
               return $modelL->title;
           }
                 return  '获取失败';
            },
            'filter' =>$parentCategory,
        ],
            'price',

           [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{update} {delete}',
                'headerOptions' => ['width' => '80'],
            ],
        ],
    ]); ?>
</div>
