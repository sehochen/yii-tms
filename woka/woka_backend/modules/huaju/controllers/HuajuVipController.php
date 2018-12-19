<?php
namespace backend\modules\huaju\controllers;

use Yii;
use common\models\project\huaju\HuajuVip;
use common\models\common\user\Wxuser;
use common\models\project\huaju\HuajuVipSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use PHPExcel_IOFactory;
/**
 * HuajuVipController implements the CRUD actions for HuajuVip model.
 */
class HuajuVipController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all HuajuVip models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new HuajuVipSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * 获取上传表单
     */
    public function actionExcelUploadForm(){

        $model=new UploadForm();

        if( Yii::$app->request->isPost &&  isset($_POST["goodsProportion"]) )
        echo $this->renderAjax('_form-excel-upload',[
            'model'=>$model
            ]);
        exit;
    }
    
    public function saveInput($datas)
    {
        if($datas)
        {
            foreach($datas as $row)
            {
                $model=HuajuVip::findOne(['tel'=>$row['tel']]);
                if(!$model)
                {
                    $model=new HuajuVip();
                    $model->name=$row['name'];
                    
                    $model->tel=$row['tel'];
                    
                    $model->cardnum=$row['cardnum'];
                    
                    $model->num=$row['num'];
                    $model->isbind=0;
                    $model->save();
                }else{
                    echo $row['tel'].'已存在<br/>';
                }
            }
        }
        
        
    }
    
    /**
     * Displays a single HuajuVip model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new HuajuVip model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new HuajuVip();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing HuajuVip model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $oldBind=$model->isbind;
        if(Yii::$app->request->isPost)
        {
            $model->load(Yii::$app->request->post());          
            
            if (  $model->save()) {
                if($oldBind != $model->isbind  && $model->isbind != 1)
                {
                    $mdoelU=Wxuser::findOne(['vipid'=>$model->id]);
                    if($mdoelU)
                    {
                        $mdoelU->vipid=0;
                        $mdoelU->save();
                    }
                }
                
                return $this->redirect(['index', 'id' => $model->id]);
            } 
        }        
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing HuajuVip model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the HuajuVip model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return HuajuVip the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = HuajuVip::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}