<?php

use yii\helpers\Html;
use yii\grid\GridView;

use yii\bootstrap\Modal;
/* @var $this yii\web\View */
/* @var $searchModel common\models\project\huaju\HuajuVipSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '会员管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="huaju-vip-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <button class="btn btn-success" onclick='setExcelUploadForm();'>导入会员信息</button>
        <?= Html::a('添加会员', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

          //  'id',
            'name',
            'tel',
            'cardnum',
            'num',
             [
               'label' => '是否绑定',
               'filter' =>['0'=>'未绑定','1'=>'已绑定'],
              'attribute' => 'isbind',
            'format' => 'raw',
            'value' => function ($model) {
              if($model->isbind == 0)
              {
                  return "未绑定";
              }
              return "已绑定";
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

<?php
Modal::begin([
  'header' => '导入信息',
    'id' => 'modalGoodsPacking',
]);
echo '<div id="divModalBody"></div>';
Modal::end();
?>

<?php $this->beginBlock('proportionBlock') ?>

$().ready(function(){


});
function setExcelUploadForm()
{
   $.ajax({
             type: "POST",
             url: "/backend.php/huaju/huaju-vip/excel-upload-form",
             data: '',
             cache:false,
             dataType: "html",
             success: function(data){
                $('#divModalBody').html(data);
                $('#modalGoodsPacking').modal("show");
              },
              error:function(){
                alert('error');
             },
         });
}


<?php $this->endBlock() ?>
<?php  $this->registerJs($this->blocks['proportionBlock'], \yii\web\View::POS_END); ?>
