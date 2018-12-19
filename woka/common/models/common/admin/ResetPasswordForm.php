<?php
namespace  common\models\common\admin;

use yii;
use yii\base\Model;
use yii\base\InvalidParamException;
use common\models\common\admin\QiyoAdmin;

/**
 * Password reset form
 */
class ResetPasswordForm extends Model
{
    public $password;

    /**
     * @var \common\models\User
     */
    private $_admin;


    /**
     * Creates a form model given a token.
     *
     * @param string $token
     * @param array $config name-value pairs that will be used to initialize the object properties
     * @throws \yii\base\InvalidParamException if token is empty or not valid
     */
    public function __construct( $adminId,$config = [])
    {

        $this->_admin = QiyoAdmin::findIdentity($adminId);
        if (!$this->_admin) {
            throw new InvalidParamException('获取管理员信息失败！');
        }
        parent::__construct($config);
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['password', 'required'],
            ['password', 'string', 'min' => 6],
        ];
    }

    /**
     * Resets password.
     *
     * @return bool if password was reset.
     */
    public function resetPassword()
    {
        $user = $this->_admin;
        $user->password=Yii::$app->security->generatePasswordHash($this->password);
        return $user->save(false);
    }

    public function attributeLabels()
    {
        return [
            'password' => '密码',

        ];
    }
}
