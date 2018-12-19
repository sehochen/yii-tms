<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\project\huaju\HuajuListSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '话剧列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="huaju-list-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加话剧', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

          //  'id',
            'title',
            'begin_time:datetime',
            'end_time:datetime',
           // 'img',
             'address',
            // 'content_ld:ntext',
            // 'content:ntext',
            // 'content_sm:ntext',
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
