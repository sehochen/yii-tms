<?php
define('QYDebug',true);
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=127.0.0.1;port=3306;dbname=suso_tms',
            'username' => 'root',
            'password' => 'admin123',
            'charset' => 'utf8',
			'tablePrefix' => 'wokav_',           
        ],                
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',      
            'useFileTransport' => true,
        ],
    ],
];

