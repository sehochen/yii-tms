<?php
return [
     'modules' => [
        'qiyo' => [
            'class' => 'frontend\modules\qiyo\module',
        ],
         'data' => [
            'class' => 'frontend\modules\data\data',
        ],
    ],

    
    //第三方库地址
    'vendorPath' => dirname(dirname(__DIR__)) . '/../vendor', 
     'language' => 'zh-CN' , //中文语言包
     'timeZone' => 'Asia/Shanghai',
     'components' => [
     //暂时使用文件缓存
        'cache' => [
            'class' => 'yii\caching\FileCache'
        ],
        //微信缓存
        'cacheWX' => [
            'class' => 'yii\caching\FileCache',
            'cachePath'=>'@runtime/Fcache',
        ],
          'formatter' => [
            'dateFormat' => 'yyyy-MM-dd',
            'timeFormat' => 'HH:mm:ss',
            'datetimeFormat' => 'yyyy-MM-dd HH:mm:ss'
        ]
    ],
];
