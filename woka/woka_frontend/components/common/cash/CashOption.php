<?phpnamespace frontend\components\common\cash;use Yii;use yii\helpers\Json;use common\models\common\user\Wxuser;use common\models\common\user\UserExtend;use common\models\common\cash\ConfigCashRecharge;use common\models\common\cash\CashWithdraw;use common\models\common\cash\QiyoCashPay;use common\models\common\cash\CashLog;
use frontend\modules\three\components\wechat\Template;
use frontend\modules\qiyo\components\wechat\WechatRedPacket;/** * Summary of Woka * 基础操作  * auth:Vanzer * date:2017年10月2日15:14:29 */class CashOption extends CashBase{                public static function changeSubscribe($uid,$money)    {        $reData=[            ];        $remark='推荐新用户关注公众号！';        $modelUE=UserExtend::findOne(['uid'=>$uid]);        $modelCashLog=new CashLog();                if(!$modelUE)        {            $modelUE=new UserExtend();            $modelUE->uid=$uid;            $modelUE->point=0;            $modelUE->money=0;            $modelUE->freez_money=0;            $modelUE->level=1;            $modelUE->save();        }                $modelCashLog->uid= $modelUE->uid;        $modelCashLog->content= $remark;        $modelCashLog->time= time();        $modelCashLog->before_money=   $modelUE->money;        $reData['change']=$money;        $modelCashLog->change_money=$money;        $modelCashLog->type=1;                $modelUE->money +=$money;                $reData['end']= $modelUE->money ;        if($modelUE->save())        {            $modelCashLog->save();                        return $reData;        }                return false;    }        /**     * Summary of addUserMoney     * 添加用户金额     * @param mixed $uid      * @param mixed $money      * @param mixed $remark      */    public static function addUserMoney($uid,$money,$remark)    {        $modelUE=UserExtend::findOne(['uid'=>$uid]);        $modelCashLog=new CashLog();                if(!$modelUE)        {            $modelUE=new UserExtend();            $modelUE->uid=$uid;            $modelUE->point=0;            $modelUE->money=0;            $modelUE->freez_money=0;            $modelUE->level=1;            $modelUE->save();        }        $modelCashLog->uid= $modelUE->uid;        $modelCashLog->content= $remark;        $modelCashLog->time= time();        $modelCashLog->before_money=   $modelUE->money;        $modelCashLog->change_money=$money;        $modelCashLog->type=1;                $modelUE->money +=$money;                        if($modelUE->save())        {            $modelCashLog->save();            $modelWXU=Wxuser::findOne(['id'=>$modelUE->uid]);            Template::sendChangeMoney(1,$modelWXU->openid,$money,$modelUE->money,$remark);            return true;        }              return false;    }        /**     * Summary of createWithdraw     * @param mixed $money      * @param mixed $uid      * @param mixed $openid      * @return mixed     */    public static function createWithdraw($money,$uid,$openid)    {        $flag=self::subMoney($uid,$money,'提现扣除金额');        if($flag)        {            $modelCW=new CashWithdraw();                        $modelCW->uid=$uid;            $modelCW->money=$money;            $modelCW->status=0;            $modelCW->time=time();            $modelCW->openid=$openid;            if($modelCW->save())            {                if(Yii::$app->params['isAutoWithdraw'] == true)                {                    $flag=self::sendRedPacket(2,$modelCW);                }                                return true;                            }            //数据保存错误            return false;                    }        // 处理错误             return '修改资金错误！';    }            public static function sendRedPacket($wxid,$model)    {       $flag=    WechatRedPacket::sendRedPacket($wxid,$model->openid,$model->money);        if($flag === true)        {            return true;        }        return '提现失败！';    }            public static function  subMoney($uid,$money,$remark)    {                $modelUE=UserExtend::findOne(['uid'=>$uid]);        $modelCashLog=new CashLog();                if(!$modelUE)        {            $modelUE=new UserExtend();            $modelUE->uid=$uid;            $modelUE->point=0;            $modelUE->money=0;            $modelUE->freez_money=0;            $modelUE->level=1;            $modelUE->save();        }        if($modelUE->money  < $money)        {            //提现金额小于可提现金额            return false;        }                        $modelCashLog->uid= $modelUE->uid;        $modelCashLog->content= $remark;        $modelCashLog->time= time();        $modelCashLog->before_money=  $modelUE->money;        $modelCashLog->change_money=$money;        $modelCashLog->type=2;     //提现金额           //冻结金额添加        $modelUE->freez_money +=$money;        //减少实际金额        $modelUE->money -=$money;                   if($modelUE->save())        {            $modelCashLog->save();            return true;        }                return false;                    }}