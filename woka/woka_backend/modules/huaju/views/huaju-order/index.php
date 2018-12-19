<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\project\huaju\HuajuList;
use common\models\project\huaju\HuajuVip;
use common\models\common\user\Wxuser;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $searchModel common\models\project\huaju\HuajuPriceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$parentCategory =  ArrayHelper::map(HuajuList::find()->asArray()->all(), 'id', 'title');
/* @var $this yii\web\View */
/* @var $searchModel common\models\project\huaju\HuajuOrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '订单管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="huaju-order-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

          //  'id',
            'ordersn',
            'uid',
       
              [
               'filter' =>'',
              'attribute' => 'uid',
            'format' => 'raw',
            'value' => function ($model) {
            $modelU=Wxuser::findOne($model->uid);
            if($modelU)
            {
                if($modelU->vipid != 0)
                {
                    $modelVip=HuajuVip::findOne($modelU->vipid);
                   if($modelVip)
                   {
                        return $modelVip-tel.'[会员]';  
                   }
                   return '会员信息错误';                      
                }else{
                       return $modelU->nickname. '[微信用户]';
                }
            }
            return '获取失败';
           
            },
           ],  
            
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
             'paymoney',
             'num',
             'zw:ntext',
        
                  [
               'filter' =>['0'=>'未支付','1'=>'未分配','2'=>'分配完成','3'=>'作废'],
              'attribute' => 'status',
            'format' => 'raw',
            'value' => function ($model) {
             $arr=['0'=>'未支付','1'=>'未分配','2'=>'分配完成','3'=>'作废'];
              return $arr[$model->status];
            },
           ],  
             
             'addtime:datetime',
             'paytime:datetime',
 [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{update} {delete}',
                'headerOptions' => ['width' => '80'],
            ],
        ],
    ]); ?>
</div>
