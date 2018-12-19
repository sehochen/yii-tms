<?php
use wokaextend\components\pay\wechatpay\WxPayApi;

    'openid'=>'',
    'body'=>'',
    'money'=>0.01,
    'ordersn'=>'',
    'notifyurl'=>''
    ];
        $tools = new JsApiPay();
        $input = new WxPayUnifiedOrder();
        $input->SetBody($params['body']);
        $input->SetAttach($params['body']);
        $input->SetOut_trade_no($params['ordersn']);
        //支付金额
        $amount=$params['money']* 100;
        $input->SetTotal_fee($amount);
        $input->SetTime_start(date("YmdHis"));
        $input->SetGoods_tag($params['body']."123");
        $input->SetNotify_url($params['notifyurl']);
        $input->SetTrade_type("JSAPI");
        $input->SetOpenid($params['openid']);  
        $order = WxPayApi::unifiedOrder($input);   
        $jsApiParameters = $tools->GetJsApiParameters($order,false);     
        return $jsApiParameters;
            "appid": "wx426b3015555a46be", 
            "attach": "test", 
            "bank_type": "CFT", 
            "cash_fee": "1", 
            "fee_type": "CNY", 
            "is_subscribe": "Y", 
            "mch_id": "1900009851", 
            "nonce_str": "YdcUMBIUpZWkEaEc", 
            "openid": "oHZx6uAoyCLLCAwYNUqbTGjhFMeo", 
            "out_trade_no": "190000985120160925132216", 
            "result_code": "SUCCESS", 
            "return_code": "SUCCESS", 
            "return_msg": "OK", 
            "sign": "B6AFEB766239479D18C44F8D611FBF9D", 
            "time_end": "20160925132030", 
            "total_fee": "1", 
            "trade_state": "SUCCESS", 
            "trade_type": "NATIVE", 
            "transaction_id": "4005142001201609254882285416"
            } 
         * */