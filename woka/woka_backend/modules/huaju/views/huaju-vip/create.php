<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\project\huaju\HuajuVip */

$this->title = '添加会员';
$this->params['breadcrumbs'][] = ['label' => 'Huaju Vips', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="huaju-vip-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
