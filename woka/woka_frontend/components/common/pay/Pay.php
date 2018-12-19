<?phpnamespace frontend\components\common\pay;use Yii;use yii\base\Object;use wokaextend\components\pay\wechatpay\JsApiPay;use wokaextend\components\pay\wechatpay\WxPayUnifiedOrder;
use wokaextend\components\pay\wechatpay\WxPayApi;use common\models\common\cash\QiyoCashPay;use frontend\components\common\cash\CashOption;
class Pay extends Object{        public function init()    {            }    /**     * Summary of createWxPay     * @param mixed $params      *              openid     *              body     *              ordersn     *              money         *              notifyurl     * @return mixed     *     $params=[
    'openid'=>'',
    'body'=>'',
    'money'=>0.01,
    'ordersn'=>'',
    'notifyurl'=>''
    ];     */    public function createWxPay($params,$pid=1)    {        
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
        return $jsApiParameters;    }        public static function payEnd($result)    {        /*         *  {
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
         * */                  $orderSn=$result['out_trade_no'];          $money=$result["total_fee"]/100;          $modelPay=  QiyoCashPay::find()              ->where(['ordersn'=>$orderSn])              ->one();          if($modelPay)          {              if($modelPay->paystatus == 0 && $modelPay->money == $money )              {                  $modelPay->paystatus=1;                  $modelPay->paytime=time();                  $modelPay->reinfo=json_encode($result);                  if($modelPay->save())                  {                      //更新用户余额                                            CashOption::addUserMoney($modelPay->uid,$money,'微信账户充值');                      return true;                  }                  //保存错误                  return false;                                }                           //订单状态不正确              return false;          }                  //订单不存在          return false;    }    }