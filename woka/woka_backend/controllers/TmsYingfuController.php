<?php

namespace backend\controllers;

use Yii;
use common\models\project\suso\tms\SusoOrder;
use common\models\project\suso\tms\SusoOrderSearchYingfu;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

use common\models\project\suso\tms\SusoPointList;
use common\models\project\suso\tms\SusoYf;
/**
 * TmsYingfuController implements the CRUD actions for SusoOrder model.
 */
class TmsYingfuController extends BaseController
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
        $searchModel = new SusoOrderSearchYingfu();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single SusoOrder model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

  
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $modlePoints=SusoPointList::find()
                           ->where(['oid'=>$id])
                           ->orderBy('date desc')
                           ->all();
        $modelYf=SusoYf::find()
                    ->where(['oid'=>$id])
                    ->orderBy('id desc')
                    ->all();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'modlePoints'=>$modlePoints,
                'modelYf'=>$modelYf
            ]);
        }
    }

    /**
     * Deletes an existing SusoOrder model.
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
