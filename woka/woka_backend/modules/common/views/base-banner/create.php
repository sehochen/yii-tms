<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\common\base\BaseBanner */

$this->title = '添加滚动图';
$this->params['breadcrumbs'][] = ['label' => 'Base Banners', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="base-banner-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
