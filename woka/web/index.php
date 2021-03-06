<?php
header("Content-type: text/html; charset=utf-8"); 
header('Location: /backend.php');
exit;


//defined('YII_DEBUG') or define('YII_DEBUG', false);
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'prod');

use yii\helpers\ArrayHelper;
require(__DIR__ . '/../../vendor/autoload.php');
require(__DIR__ . '/../../vendor/yiisoft/yii2/Yii.php');
require(__DIR__ . '/../common/config/bootstrap.php');

$config = ArrayHelper::merge(
    require(__DIR__ . '/../common/config/main.php'),
    require(__DIR__ . '/../../qiyo-base.php'),
    require(__DIR__ . '/../woka_frontend/config/main.php'),
    require(__DIR__ . '/../woka_frontend/config/main-local.php')
);

$application = new yii\web\Application($config);
$application->run();