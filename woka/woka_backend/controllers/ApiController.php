<?php

namespace backend\controllers;

use Yii;
use yii\data\Pagination;
use backend\models\Test;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

use common\models\project\suso\tms\SusoPointList;
use common\models\project\suso\tms\SusoOrder;
use common\models\project\suso\tms\SusoYs;
use common\models\project\suso\tms\SusoYf;
/**
 * TestController implements the CRUD actions for Test model.
 */
class ApiController extends Controller
{
    
    public function actionSaveYs()
    {
        $redata=[
            'status'=>0,
            'message'=>'success'
            ];
        $oid=Yii::$app->request->post('oid');
        $price=Yii::$app->request->post('price');
        $compensatory=Yii::$app->request->post('compensatory');   
        $mdoel=SusoOrder::findOne($oid);
        if($mdoel)
        {
            $modelYs=SusoYs::findOne(['oid'=>$oid]);
            if(!$modelYs)
            {
                $modelYs=new SusoYs();
                $modelYs->oid=$oid;
            }
         
            $modelYs->price=$price;
            $modelYs->compensatory=$compensatory;
            $modelYs->freight=$price * $mdoel->tonnage;
            $modelYs->all=  $modelYs->freight +$compensatory;
            if($modelYs->save())
            {
                $redata=[
         'status'=>0,
         'message'=>'success'
         ];
            }else{
                $redata=[
             'status'=>1,
             'message'=>'数据保存错误'
             ];
            }
            
            
            
        }else{
            $redata=[
            'status'=>1,
            'message'=>'数据错误'
            ];
        }
        
        
       
        echo json_encode($redata);
        exit;
    }
    
    
    
    
    public function actionAddPoint()
    {
        $redata=[
            'status'=>0,
            'message'=>'success'
            ];
        $oid=Yii::$app->request->post('oid');
        $date=Yii::$app->request->post('pointdate');
        $info=Yii::$app->request->post('pointinfo');        
        $modelP=new SusoPointList();
        $modelP->oid=$oid;
        $modelP->date=$date;
        $modelP->info=$info;
        $modelP->addtime=time();
        $modelP->save();
        if($modelP->save())
        {
            $redata=[
          'status'=>0,
          'data'=>$modelP->id,
          'message'=>'success'
          ];
        }else{
            $redata=[
          'status'=>1,
          'message'=>'数据保存错误'
          ];
        }
        echo json_encode($redata);
        exit;
    }
    
    public function actionDelPoint()
    {
        $redata=[
            'status'=>0,
            'message'=>'success'
            ];
        $oid=Yii::$app->request->post('oid');
        $pid=Yii::$app->request->post('pid');     
        
        SusoPointList::deleteAll(['oid'=>$oid,'id'=>$pid]);
        
        echo json_encode($redata);
        exit;
    }
}
