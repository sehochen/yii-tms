<?phpnamespace frontend\components\common\order;use Yii;use yii\base\Object;class Base extends Object{        /**     * Summary of getSn     * @param mixed $prefix      * @return mixed     */    public static function getSn($prefix='Qiyo')    {        return $prefix.date('ymd').uniqid(). str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);    }    
}