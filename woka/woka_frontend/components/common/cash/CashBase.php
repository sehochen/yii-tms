<?phpnamespace frontend\components\common\cash;use Yii;use yii\helpers\Json;use common\models\common\user\UserExtend;use common\models\common\cash\ConfigCashRecharge;use common\models\common\cash\QiyoCashPay;use common\models\common\cash\CashLog;use frontend\components\common\order\Base;use frontend\components\common\cash\CashOption;/** * Summary of Woka * 基础操作  * auth:Vanzer * date:2017年10月2日15:14:29 */class CashBase{    /**     * Summary of getUserMoney     * 返回用户金额     * @param mixed $uid      * @return mixed     */    public static function getUserMoney($uid)    {        $modelUE=UserExtend::findOne(['uid'=>$uid]);        //不存在则重新添加-一般在创建用户时候就应该添加此条数据        if(!$modelUE)        {            $modelUE=new UserExtend();            $modelUE->uid=$uid;            $modelUE->point=0;            $modelUE->money=0;            $modelUE->freez_money=0;            $modelUE->level=1;            $modelUE->save();        }        return $modelUE->attributes;    }               /**     * Summary of recharge     * 充值金额     * @param mixed $money      */    public static function createRecharge($money,$uid)    {        $modelP=new QiyoCashPay();                $modelP->uid=$uid;        $modelP->ordersn=Base::getSn('QYCR');        $modelP->money=$money;        $modelP->addtime=time();        $modelP->paystatus=0;        $modelP->type=1;        $modelP->paytype=1;        if($modelP->save())        {            return $modelP;        }        return false;            }        /**     * Summary of getRecharge     * 获取充值金额     */    public static function getRecharge()    {        $reList=[];        $modelList=ConfigCashRecharge::find()            ->where(['isshow'=>1])            ->orderBy('money asc')            ->all();        if($modelList)        {            foreach($modelList as $rowConfig)            {                $reList[]=$rowConfig->attributes;            }        }        return $reList;    }        /**     * Summary of getCashLog     * f     * @param mixed $uid      * @param mixed $page      * @param mixed $type      * @return mixed     */    public static function getCashLog($uid,$page=1,$type=1)    {        $pageCount=20;        $modelList=CashLog::find()            ->where(['uid'=>$uid])            ->offset( ($page-1)*$pageCount)            ->limit($pageCount)            ->orderBy('id desc')               ->asarray()            ->all();           return $modelList;    }}