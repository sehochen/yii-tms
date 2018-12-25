<?php

namespace backend\controllers;
use yii;
use wokaextend\BackendController;
use wokav\filters\AdminControl;
use common\models\admin\LoginForm;
use common\models\admin\SignupForm;
use common\models\common\admin\ResetPasswordForm;
use common\models\common\admin\AdminLoginForm;


class IndexController extends BackendController
{
    
 
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'base' => [
                'class' => AdminControl::className(),
                'only' => ['logout', 'signup','index'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout','index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],

        ];
    }
    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionIndex()
    {
        $this->layout='parent-main.php';
        
        $menus = Yii::$app->admin->identity->getSystemMenus();
        
        return $this->render('index', [
                'system_menus' => $menus
            ]);
    }
    //wokav  login action  This password user config_parem set===infomore  goto mode code.
    public function actionLogin()
    {
        $this->layout='login.php';
        if (!\Yii::$app->admin->isGuest) {
            return $this->goHome();
        }
        $model = new AdminLoginForm();


        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goHome();
          //  return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionLogout()
    {
        $session=yii::$app->session;
        $session->destroy();
        
        Yii::$app->admin->logout();
        return $this->goHome();
    }


    public function actionResetPassword()
    {
        $this->layout="sub.php";

        $model = new ResetPasswordForm(yii::$app->admin->id);

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->admin->logout();
            echo '<script> window.parent.location.href = "/backend.php/index"; </script>';
            exit;
            /**
            Yii::$app->admin->logout();
            return $this->goHome();
             */
        }
        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }

}
