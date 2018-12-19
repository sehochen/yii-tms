<?php
namespace backend\modules\huaju\controllers;

use Yii;
use common\models\project\huaju\HuajuVip;
use common\models\common\user\Wxuser;
use common\models\project\huaju\HuajuVipSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use PHPExcel_IOFactory;use backend\models\upload\UploadForm;use yii\web\UploadedFile;
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

        if( Yii::$app->request->isPost &&  isset($_POST["goodsProportion"]) )        {             //接收上传文件处理            $model->file = UploadedFile::getInstances($model, 'file');                            $fileName=$model->file[0]->name;            $fileInfo=$model->file[0]->tempName;            //    var_dump($model->file[0]);            //   exit;            $fileExtension=explode('.',$fileName);            $fileExtension=array_pop($fileExtension);                      //文件验证            $objPHPExcel = new \PHPExcel();            if($fileExtension == 'xls'){                $reader = \PHPExcel_IOFactory::createReader('Excel5'); // xls            }else{                $reader = \PHPExcel_IOFactory::createReader('Excel2007'); // (Excel97-2003工作簿)xlsx格式            }            $PHPExcel = $reader->load( $fileInfo);            $sheet = $PHPExcel->getSheet(0); // 读取第一個工作表            $highestRow = $sheet->getHighestRow(); // 取得总行数            $highestColumm = $sheet->getHighestColumn(); // 取得总列数            /** 循环读取每个单元格的数据 */            $dataset = array();            for ($row = 1; $row <= $highestRow; $row++){//行数是以第1行开始                for ($column = 'A'; $column <= $highestColumm; $column++) {//列数是以A列开始                    $dataset[$row][$column] = (string)$sheet->getCell($column.$row)->getValue();                }            }                      $title=$dataset[1];                      $dataset = array_slice($dataset,1);            $save = array();                     foreach($dataset as $key=>$val){                foreach($val as $k=>$v){                    if(str_replace(' ','',$title[$k]) == '姓名'){                        $save[$key]['name'] = $v;                    }                    if(str_replace(' ','',$title[$k]) == '电话'){                        $save[$key]['tel'] = $v;                    }                    if(str_replace(' ','',$title[$k]) == '会员卡号'){                        $save[$key]['cardnum'] = $v;                    }                         if(str_replace(' ','',$title[$k]) == '会员次数'){                        $save[$key]['num'] = $v;                    }                     }            }            self::saveInput($save);                        return  $this->redirect(["index"]);        }   
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
