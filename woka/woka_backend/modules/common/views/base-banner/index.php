<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\common\base\BaseBannerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '滚动图管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="base-banner-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加滚动图', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title',
         //   'img',
            'addtime:datetime',
            'order',
        [
               'label' => '是否显示',
               'filter' =>['0'=>'不显示','1'=>'显示'],
              'attribute' => 'isshow',
            'format' => 'raw',
            'value' => function ($model) {
              if($model->isshow == 0)
              {
                  return "不显示";
              }
              return "显示";
            },
           ],           
           [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{update} {delete}',
                'headerOptions' => ['width' => '80'],
            ],
        ],
    ]); ?>
</div>
