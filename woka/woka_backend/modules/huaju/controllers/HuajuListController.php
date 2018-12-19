<?php
namespace backend\modules\huaju\controllers;
use Yii;
use common\models\project\huaju\HuajuList;
use common\models\project\huaju\HuajuListSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * HuajuListController implements the CRUD actions for HuajuList model.
 */
class HuajuListController extends Controller
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
     * Lists all HuajuList models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new HuajuListSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single HuajuList model.
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
     * Creates a new HuajuList model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new HuajuList();

        $model->loadDefaultValues();
        if(Yii::$app->request->isPost)
        {
            $model->load(Yii::$app->request->post());
            $model->img=Yii::$app->request->post("img");
          
            if (  $model->save()) {
                return $this->redirect(['index', 'id' => $model->id]);
            } 
        }        
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing HuajuList model.
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
           
            if (  $model->save()) {
                return $this->redirect(['index', 'id' => $model->id]);
            } 
        }        
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing HuajuList model.
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
     * Finds the HuajuList model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return HuajuList the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = HuajuList::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
