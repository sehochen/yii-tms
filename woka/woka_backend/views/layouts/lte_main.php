<?php
//use Yii;
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = 'qiyo';

$system_menus = Yii::$app->admin->identity->getSystemMenus();
$system_rights = Yii::$app->admin->identity->getSystemRights();

$route = $this->context->route;
$absoluteUrl = Yii::$app->request->absoluteUrl;
$funInfo = isset($system_rights[$this->context->route]) == true ? $system_rights[$route] : null;

$otherMenu = true;

//检查是否为主菜单，主菜单不需要添加返回上一层菜单
if(isset($funInfo) == true && $funInfo['entry_url'] != $this->context->route){
    $referrer = Yii::$app->request->referrer;
    if(empty($referrer) == false){
        $referrer = urldecode($referrer);
        $system_menus_current = isset(Yii::$app->session['system_menus_current']) == true ? Yii::$app->session['system_menus_current'] : [];
        //检查当前URL是否已经在导航菜单中
        $inCurrent = false;
        foreach($system_menus_current as $key=>$m){
            if($inCurrent == true){
                unset($system_menus_current[$key]);

            }
            else if($m['route'] == $route){
                $inCurrent = true;
            }
        }
        if($inCurrent == false){
            $funLast = count($system_menus_current) > 0 ? $system_menus_current[count($system_menus_current) - 1] : null;
            // 检查当前url是否和前一个相同，判断是否刷新
            if($funLast['route'] != $route){
                $system_menus_current[] = ['url'=>$absoluteUrl,'route'=>$route, 'right_name'=>$funInfo['right_name']];

            }
        }
        Yii::$app->session['system_menus_current'] = $system_menus_current;
    }
    else{
        $otherMenu = false;
    }
}
else{
    $otherMenu = false;
}
if($otherMenu == false){
    Yii::$app->session['system_menus_current'] = null;
}

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$this->title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/libs/font-awesome.min.css">
  <!-- Ionicons  -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/libs/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="<?=Url::base()?>/themes/backend/rbac/plugins/datatables/dataTables.bootstrap.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- jQuery 2.2.3 -->
  <script src="<?=Url::base()?>/themes/backend/rbac/plugins/jQuery/jquery-2.2.3.min.js"></script>

  
  <script>
    $(function($){
        window.admin_tool = function(){
            return {
            	confirm : function(content, ok_fun){
            		$('#confirm_content').text(content);
            		$("#confirm_dialog_ok").one("click", function() { 
            			ok_fun();
            			$('#confirm_dialog').modal('hide');
            		});
          			//$('#confirm_dialog_ok').click(function(){
          			//	ok_fun();
          			//	$('#confirm_dialog').modal('hide'); 
          			//});
          			$('#confirm_dialog').modal('show');
          		},
          		alert : function(id, msg, type){
              		var alert_type = '';
              		switch(type){
              			case 'success':
              				alert_type = 'alert-success';
                  			break;
              			case 'warning':
              				alert_type = 'alert-warning';
                  			break;
              			case 'danger':
              				alert_type = 'alert-danger';
                  			break;
                  		default:
                  			alert_type = 'alert-info';
              		}
              		$('#' + id).html('<div class="alert ' + alert_type + ' alert-dismissable">'
                      		+ '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + msg + '</div>');
          		}
            };
        }();

        // 全选
        $('#data_table_check').click( function() {
            var b = this.checked;
        	$('#data_table tbody :checkbox').each(function(i){
        		this.checked = b;
        	});
        });
        
  	});
    </script>
  
<?php if(isset($this->blocks['header']) == true):?>
<?= $this->blocks['header'] ?>
<?php endif;?>
</head>
<body style="position:fixed;height:100%;width:100%;" class="hold-transition skin-blue-light sidebar-mini">
<div class="modal fade" id="confirm_dialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>请确认</h3>
			</div>
			<div id="confirm_content" class="modal-body">
                
            </div>
			<div class="modal-footer">
				<a id="confirm_dialog_cancel" href="#" class="btn btn-default" data-dismiss="modal">关闭</a> <a
					id="confirm_dialog_ok" href="#" class="btn btn-primary">确定</a>
			</div>
		</div>
	</div>
</div>


<div class="wrapper">



  <!-- Content Wrapper. Contains page content -->
  
  <div class="content-wrapper" style="position:absolute;height:100%;width:100%;">
    <section class="content-header">
     
      <h1> <?=$funInfo['menu_name']?> <small>
      
      </small></h1>
      <ol class="breadcrumb breadcrumb-quirk">
        <li><a href="<?=Url::toRoute('site/index')?>"><i class="fa fa-dashboard"></i> 首页</a></li>

        <?php
        if(isset($funInfo['module_name']) == true && isset($funInfo['menu_name']) == true){
            echo '<li><a href="#">'.$funInfo['module_name'].'</a></li>';
            echo '<li><a href="'.Url::toRoute($funInfo['entry_url']).'">'.$funInfo['menu_name'].'</a></li>';
          
        }
        ?>
      </ol>
    </section>
    
      
   
    
    
  <?= $content ?>
  
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer" style="position:fixed;bottom:0px;width:100%;">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0.1
    </div>
    <strong>Copyright &copy; 2015-<?=date('Y')?> <a href="/index.php">Qiyo</a>.</strong> All rights
    reserved.
  </footer>


  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<script src="<?=Url::base()?>/themes/backend/rbac/plugins/form/jquery.form.min.js"></script>

<!-- Bootstrap 3.3.6 -->
<script src="<?=Url::base()?>/themes/backend/rbac/bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="<?=Url::base()?>/themes/backend/rbac/libs/raphael-min.js"></script>
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/knob/jquery.knob.js"></script>
 
<!-- daterangepicker -->
<script src="<?=Url::base()?>/themes/backend/rbac/libs/moment.min.js"></script>
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/fastclick/fastclick.js"></script>
<!-- DataTables -->
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="<?=Url::base()?>/themes/backend/rbac/plugins/treeview/bootstrap-treeview.min.js"></script>

<!-- AdminLTE App -->
<script src="<?=Url::base()?>/themes/backend/rbac/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?=Url::base()?>/themes/backend/rbac/dist/js/demo.js"></script>


</body>

<?php if(isset($this->blocks['footer']) == true):?>
<?= $this->blocks['footer'] ?>
<?php endif;?>
</html>
