<?php
return [
 
     'paymentUrl'=>'http://woka11.samayi.com/',
    //配置信息
    'configInfo'=> require(__DIR__ . '/language/zh-cn.php'),
   //资金配置信息
    'isAutoWithdraw'=>true,   
    
    'adminEmail' => 'admin@example.com',
    'supportEmail' => 'support@example.com',
    'user.passwordResetTokenExpire' => 3600,
    'frontend_pwdPrefix'=>'fwokavz',
    'backend_pwdPrefix'=>'bwokavz'
     
];
