<?php
namespace wechat\controllers;
use Yii;
use wokaextend\WCController;
use wokaextend\wechat\Wechat;
use wokaextend\wechat\UserManage;
use wokaextend\wechat\Menu;
use wokaextend\jiesi\wechatoption;
use  common\models\wechat\user\WechatUsers;
use   wechat\components\CWechatUser;
use common\models\project\Uqrcode;
use common\models\woka\user\ScanLogin; //扫码登录
use wokaextend\wechat\Popularize;
use wechat\components\CWechatDo;
use wokaextend\wechat\ResponseInitiative;
use common\models\project\Cacheqrcode;
use common\models\project\Wxuser;
use wokaextend\wechat\Media;


header("Content-type: text/html; charset=utf-8"); 

class MainWechatController extends WCController
{
    public $layout=false;
    //页面初始化-加载主微信配置
    public  function init()
    {
        define("WECHAT_URL", yii::$app->params['mainWechat']['wechatUrl']);
        define('ENCODING_AES_KEY', yii::$app->params['mainWechat']['encodingAesKey']);
        define("WECHAT_MAIN", yii::$app->params['mainWechat']['wechatMain']);
        define('WECHAT_TOKEN', yii::$app->params['mainWechat']['wechatToken']); //微信Token值
        define("WECHAT_APPID", yii::$app->params['mainWechat']['wchatAPPID']);
        define("WECHAT_APPSECRET", yii::$app->params['mainWechat']['wechatAPPSecret']);
    }

    public function actionIndex()
    {
        
        //微信处理接口
        $wokav_wechat=new wechat(WECHAT_TOKEN, false);
        //判断是否为微信绑定验证信息
        if(!$wokav_wechat->isValid())
        {
            echo $wokav_wechat->run();
        }else
        {
            $wokav_wechat->checkSignature(WECHAT_TOKEN);
        }
        //结束继续执行
        die();
    }
    
    /**
     * Summary of actionScanImg  返回扫码登录
     */
    public function actionVerScan()
    {
        if(isset($_GET['code']))
        {
            $modelScanLogin=ScanLogin::find()->where(["token"=>Yii::$app->request->get("scanToken")])->one();
            if($modelScanLogin)
            {
                $url='https://api.weixin.qq.com/sns/oauth2/access_token?appid='.WECHAT_APPID.'&secret='.WECHAT_APPSECRET.'&code='.$_GET['code'].'&grant_type=authorization_code';
                $html = file_get_contents($url);
                $_userinfo=json_decode($html);                 
                //   $session['vanzer_openid']=$_userinfo->openid;
                //保存扫码结果 
                $modelScanLogin->status=10;
                $modelScanLogin->openid=$_userinfo->openid;
                $modelScanLogin->save();
                
            }else
            {
                echo "二维码已过期！";
                exit;
            }          
        }else
        {
            echo '获取权限错误！';
            exit;
        }
        
        
    }
    function resize_jpg($img,$w,$h){ 
        // $thumb = imagecreate ($w, $h); 
        $image = imagecreatefromjpeg($img); 
        $imagedata = getimagesize($img); 
        if ($h = "auto") $h = $w/($imagedata[0]/$imagedata[1]);//根据原图的纵横比得出高度！ 
        $thumb = imagecreatetruecolor ($w, $h); 
        imagecopyresized ($thumb, $image, 0, 0, 0, 0, $w, $h, $imagedata[0], $imagedata[1]); 
        $fileNmaeEnd=date("Y-m-dHis",time()).uniqid().'.jpg';
        $fileNmae=Yii::getAlias('@webbase')."/upload/" .$fileNmaeEnd;
        imagejpeg($thumb,$fileNmae); 
        return $fileNmaeEnd;
    } 

    public function actionTest1()
    {
        $url = 'http://woka19.wokawoka.cn/wechat.php/main-wechat/test'; 
        $param = array( 
          'openid'=>'ofNdgxIZiiHFmgBdjB6KP1snnsVo'       
        ); 
        
       self::doRequest($url, $param); 
    }
    
    public function actionTest2()
    {
        $openid=Yii::$app->request->post("openid");      
        $openid='ofNdgxPfv1Tls6TlGPv7HK_DFGeU';
        if(empty($openid))
        {
            ResponseInitiative::text("ofNdgxPfv1Tls6TlGPv7HK_DFGeU","接受错误");            
        }else
        {
            $Dow=new CWechatDo();
            $Dow->sendTg($openid);
        }
        
        return ;
    }
    
   public function doRequest($url, $param=array()){ 
        
        $urlinfo = parse_url($url); 
        
        $host = $urlinfo['host']; 
        $path = $urlinfo['path']; 
        $query = isset($param)? http_build_query($param) : ''; 
        
        $port = 80; 
        $errno = 0; 
        $errstr = ''; 
        $timeout = 10; 
        
        $fp = fsockopen($host, $port, $errno, $errstr, $timeout); 
        
        $out = "POST ".$path." HTTP/1.1\r\n"; 
        $out .= "host:".$host."\r\n"; 
        $out .= "content-length:".strlen($query)."\r\n"; 
        $out .= "content-type:application/x-www-form-urlencoded\r\n"; 
        $out .= "connection:close\r\n\r\n"; 
        $out .= $query; 
        
        fputs($fp, $out); 
        fclose($fp); 
    } 
    
    
   public function actionTest()
   {
       $openid=Yii::$app->request->post("openid");      
    
       if(empty($openid))
       {
           ResponseInitiative::text("ofNdgxPfv1Tls6TlGPv7HK_DFGeU","接受错误");            
       }else
       {
           $Dow=new CWechatDo();
           $Dow->sendTg($openid);
       }
       
       return ;
   }
   //获取微信用户信息
   public function actionGetUserInfo()
   {
        $openid=Yii::$app->request->post("openid");      
        $modelWxuser=Wxuser::findOne(["openid"=>$openid]);
               
        if(!$modelWxuser)
        {
            try{                
                $modelWxuser=new Wxuser();
                $userinfo=  UserManage::getUserInfo($openid);
                if(!isset($userinfo['nickname']))
                {
                    echo "获取用户信息错误，请重新关注！";
                    exit;                    
                }                
                $modelConfigCash=ConfigCash::findOne(["id"=>1]);                
                $modelWxuser->openid=$openid;
                $modelWxuser->nickname=$userinfo['nickname'];
                if(        $userinfo['sex']== 1)
                {
                    $modelWxuser->sex='男';
                }else
                {
                    $modelWxuser->sex='女';                    
                }          
                $modelWxuser->city=$userinfo['city'];
                $modelWxuser->province=$userinfo['province'];
                $modelWxuser->headimgurl=$userinfo['headimgurl'];
                $modelWxuser->basecash=$modelConfigCash->fs_base_cash;
                $modelWxuser->code=uniqid();                
                if($modelWxuser->save())
                {
                    
                }else
                {
                    var_dump($modelWxuser);
                }
                
            
            }catch  (Exception $e){
                var_dump($modelWxuser);
            }   
        }
        
        $userId=$modelWxuser->id;                
        $Re=Popularize::createTicket(2,0,$userId);           
        $modelQr = new Uqrcode();                
        $modelQr->userid=$userId;
        $modelQr->ticket=$Re['ticket'];
        
        $fileNmaeEnd=date("Y-m-dHis",time()).uniqid().'.jpg';
        $fileNmae=Yii::getAlias('@webbase')."/upload/" .$fileNmaeEnd;
        $modelQr->qrcode=$fileNmaeEnd;
        $ReQR=Popularize::getQrcode($Re['ticket'],$fileNmae);
        //缩放正常比例
        $modelQr->qrcode=   $fileNmae=self::resize_jpg($fileNmae,200,200);
        
        $modelQr->save();
        
   }
   //获取微信用户信息
   public function actionQcode()
   {
       $begintime=time();
       $id=2;
       $modelWxuser=Wxuser::findOne($id);
       $touser='ofNdgxPfv1Tls6TlGPv7HK_DFGeU';
       $bg="images/sharebg.png";        
       $modelQr=Uqrcode::findOne(["userid"=>$id]);
       
     
           //获取微信头像
           $fileHeadEnd=date("Y-m-dHis",time()).uniqid().'.jpg';
           $filehend=Yii::getAlias('@webbase')."/upload/" .$fileHeadEnd;
           echo '获取头像前：'.(time()-$begintime).'<br/>';
           $himg=  self::GrabImage($modelWxuser->headimgurl,$filehend);
           echo $fileHeadEnd;
           echo '获取头像时间：'.(time()-$begintime).'<br/>';
           //处理头像大小
           $fileHeadEnd=  self::resize_jpg($filehend,60,60);    
           echo '获取头像时间daxiao：'.(time()-$begintime).'<br/>';
           echo $fileHeadEnd;
           exit;
               $userId=$id;                
               $Re=Popularize::createTicket(2,0,$userId);           
               $modelQr = new Uqrcode();                
               $modelQr->userid=$userId;
               $modelQr->ticket=$Re['ticket'];
                   
               echo 'shengcheng：'.(time()-$begintime).'<br/>';
               
               
               $fileNmaeEnd=date("Y-m-dHis",time()).uniqid().'.jpg';
               $fileNmae=Yii::getAlias('@webbase')."/upload/" .$fileNmaeEnd;
               $modelQr->qrcode=$fileNmaeEnd;
               $ReQR=Popularize::getQrcode($Re['ticket'],$fileNmae);
               //缩放正常比例
               $modelQr->qrcode=   $fileNmae=self::resize_jpg($fileNmae,200,200);
                  echo '下载时间：'.(time()-$begintime).'<br/>';
               $modelQr->save();
           
           $filename="upload/".$modelQr->qrcode;                      
           $bgImg = imagecreatefromstring(file_get_contents($bg));
           $bigImg = imagecreatefromstring(file_get_contents($filename));
           
           $filehend=Yii::getAlias('@webbase')."/upload/" .$fileHeadEnd;
           $headimg=imagecreatefromstring(file_get_contents($filehend));
              echo '加载资源：'.(time()-$begintime).'<br/>';
           
           list($qCodeWidth, $qCodeHight, $qCodeType) = getimagesize($filename);
           // imagecopymerge使用注解
           imagecopymerge($bgImg, $bigImg,130 ,440, 0, 0, $qCodeWidth, $qCodeHight, 100);
              echo '合成：'.(time()-$begintime).'<br/>';
           list($qCodeWidth, $qCodeHight, $qCodeType) = getimagesize($filehend);
           // imagecopymerge使用注解
           imagecopymerge($bgImg, $headimg,130 ,360, 0, 0, $qCodeWidth, $qCodeHight, 100);
           
              echo '合成2：'.(time()-$begintime).'<br/>';
           $black = imagecolorallocate($bgImg,  255,255,255);//字体颜色 RGB
         /*  
           $font =   Yii::getAlias('@webbase')."/fonts/" .'msyh.ttc';//字体
           $sname=$modelWxuser->nickname;
           $le=strlen($sname);    
           $le=200;        
           $le1=65;
           imagefttext($bgImg, 12, 0, $le, 395, $black, $font, $sname);
           */
           $fileTgEnd=date("Y-m-dHis",time()).uniqid().'.png';
           $fileTg=Yii::getAlias('@webbase')."/upload/" .$fileTgEnd;
           
           imagepng($bgImg,$fileTg);
           $modelQr->yqimg=$fileTgEnd;
           $modelQr->save();            
      
       
       $filename=Yii::getAlias('@webbase')."/upload/" .$modelQr->yqimg;
       
       if(empty($modelQr->mediaid))
       {
           $uRe= Media::upload($filename,'image');
           if(isset( $uRe['media_id']))
           {
               $modelQr->mediaid=$uRe['media_id'];
               $modelQr->save();
           }else
           {
               ResponseInitiative::text($touser,'系统错误！');
               return ;
           }
       }
       ResponseInitiative::image($touser, $modelQr->mediaid);
   }
   
   public function GrabImage($url, $filename = "") {
       //去除URL连接上面可能的引号
       $url = preg_replace( '/(?:^[\'"]+|[\'"\/]+$)/', '', $url );
       $hander = curl_init();
       $fp = fopen($filename,'wb');
       curl_setopt($hander,CURLOPT_URL,$url);
       curl_setopt($hander,CURLOPT_FILE,$fp);
       curl_setopt($hander,CURLOPT_HEADER,0);
       curl_setopt($hander,CURLOPT_FOLLOWLOCATION,1);
 
       curl_setopt($hander,CURLOPT_TIMEOUT,60);
     
       curl_exec($hander);
       curl_close($hander);
       fclose($fp);
       Return true; 
   } 

   
    public function actionSetmenu()
    {
          $menuList = array(
            array('id'=>'10', 'pid'=>'',  'name'=>'证照	📷', 'type'=>'view', 'code'=>'http://zzgf17.com'),
          
            array('id'=>'20', 'pid'=>'',  'name'=>'个人中心', 'type'=>'', 'code'=>'key_2'),
            array('id'=>'21', 'pid'=>'20',  'name'=>'订单查询', 'type'=>'view', 'code'=>'http://zzgf17.com/index.php/index/my'),
            array('id'=>'22', 'pid'=>'20',  'name'=>'我的二维码', 'type'=>'click', 'code'=>'share'),
            array('id'=>'23', 'pid'=>'20',  'name'=>'优惠活动', 'type'=>'view', 'code'=>'http://mp.weixin.qq.com/s/mB76zPVzZUKO7LOgZUVjYA'),        
            array('id'=>'24', 'pid'=>'20',  'name'=>'商务合作', 'type'=>'view', 'code'=>'http://mp.weixin.qq.com/s/mB76zPVzZUKO7LOgZUVjYA'),
            
          
         
        );
     $re=   Menu::setMenu($menuList);
     var_dump($re);
        echo "y";
        exit;

    }
}
