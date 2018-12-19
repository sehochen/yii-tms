<?php
namespace backend\modules\common\controllers;

use Yii;
use common\models\common\base\BaseBanner;
use common\models\common\base\BaseBannerSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * BaseBannerController implements the CRUD actions for BaseBanner model.
 */
class BaseBannerController extends Controller
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
    public function actions()
    {
        return [
            'editor-upload' => [
                'class' => 'common\components\uwidgets\kindeditor\KindEditorAction',
            ],
              'Kupload' => [
                'class' => 'common\components\uwidgets\kindeditor\KindEditorAction',
            ]
        ];
    }
    /**
     * Lists all BaseBanner models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new BaseBannerSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single BaseBanner model.
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
     * Creates a new BaseBanner model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new BaseBanner();
        $model->loadDefaultValues();
        if(Yii::$app->request->isPost)
        {
            $model->load(Yii::$app->request->post());
            $model->img=Yii::$app->request->post("img");
            $model->addtime=time();
            if (  $model->save()) {
                return $this->redirect(['index', 'id' => $model->id]);
            } 
        }        
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing BaseBanner model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if(Yii::$app->request->isPost)
        {
            $model->load(Yii::$app->request->post());
            $model->img=Yii::$app->request->post("img");
            $model->addtime=time();
            if (  $model->save()) {
                return $this->redirect(['index', 'id' => $model->id]);
            } 
        }        
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing BaseBanner model.
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
     * Finds the BaseBanner model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return BaseBanner the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = BaseBanner::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
