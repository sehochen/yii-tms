<?php

namespace backend\controllers;

use Yii;
use common\models\project\suso\tms\SusoOrder;
use common\models\project\suso\tms\SusoOrderSearchYingshou;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

use common\models\project\suso\tms\SusoPointList;
use common\models\project\suso\tms\SusoYs;
/**
 * TmsYingshouController implements the CRUD actions for SusoOrder model.
 */
class TmsYingshouController extends BaseController
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
     * Lists all SusoOrder models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SusoOrderSearchYingshou();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }



    /**
     * Updates an existing SusoOrder model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $modlePoints=SusoPointList::find()
                    ->where(['oid'=>$id])
                    ->orderBy('date desc')
                    ->all();
        $modelYs=SusoYs::find()
                    ->where(['oid'=>$id])
                    ->orderBy('id desc')
                    ->one();
        if(!$modelYs)
        {
            $modelYs=new SusoYs();
            $modelYs->price=0;
            $modelYs->compensatory=0;
            $modelYs->freight=0;
            $modelYs->all=0;
        }
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'modlePoints'=>$modlePoints,
                'modelYs'=>$modelYs
            ]);
        }
    }

  

    /**
     * Finds the SusoOrder model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return SusoOrder the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = SusoOrder::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
