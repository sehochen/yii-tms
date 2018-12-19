<?php
//use Yii;
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = '管理平台';

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
<section class="hbox stretch">
    <!-- .aside -->
    <aside class="bg-black dk aside hidden-print" id="nav">
        <section class="vbox">
            <section class="w-f-md scrollable">
                <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railopacity="0.2">
                    <!-- nav -->
                    <nav class="nav-primary hidden-xs">
                        <ul class="nav bg clearfix">
                            <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">常用功能                             </li>
                         
                            <li class="m-b hidden-nav-xs"></li>
                        </ul>
                        <ul class="nav" data-ride="collapse">
                            <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">平台管理                    </li>
                          
                                   <?php 
        
			foreach($system_menus as $menu){
			    $funcList = $menu['funcList'];
			    $isMenuActive = '';
			    $isTreeView = count($funcList) > 0 ? "treeview" : "";
                $menuHtml ='';
			
                   $menuHtml .= '  <li><a href="javascript:void();" class="auto" target="wokam_content">';                   $menuHtml .= '            <span class="pull-right text-muted"><i class="fa fa-angle-left text"></i>';                   $menuHtml .= '                  <i class="fa fa-angle-down text-active"></i></span>';                   $menuHtml .= '           <i class="icon-screen-desktop icon"></i><span>'. $menu['label'] .'</span>';                   $menuHtml .= '              </a>';
               
			   if($isTreeView != ""){
			       $menuHtml .= ' <ul class="nav dk text-sm">';
			       foreach($funcList as $fun){
                       $isActive='';
			           $isActive = $fun['url'] == $funInfo['entry_url'] ? 'class="active"' : ''; //'. $isActive .'
			           $menuHtml .= '<li '. $isActive .'><a href="'.Url::to([$fun['url']]).'"  class="auto"  target="wokam_content"><i class="fa fa-angle-right text-xs"></i>'. $fun['label'] .'</a></li>';
			           if(empty($isMenuActive) == true && $isActive != ""){
			               $isMenuActive = 'active ';
			           } 
                       
			       }
			       $menuHtml .= '</ul>';
			   }
			    $menuHtml .= '</li>';
			    $menuHtml = str_replace('#isMenuActive#', $isMenuActive, $menuHtml);
			    echo $menuHtml;
			}
		?>

                        </ul>
                    </nav>
                    <!-- / nav -->
                </div>
            </section>
            <footer class="footer hidden-xs no-padder text-center-nav-xs">
                <div class="bg hidden-xs ">
                    <?php   if(! Yii::$app->admin->isGuest){?>
                    <div class="dropdown dropup wrapper-sm clearfix">
                        <a href="javascript:void();" class="dropdown-toggle" data-toggle="dropdown"><span class="thumb-sm avatar pull-left m-l-xs">
                            <img src="/themes/backend/images/a0.jpg" alt="...">
                            <i class="on b-black"></i></span></a>
                        <ul class="dropdown-menu animated fadeInRight aside text-left">
                            <li><span class="arrow bottom hidden-nav-xs"></span><a href="/backend.php/index/reset-password" target="wokam_content">修改密码</a>                            </li>
                            <li class="divider"></li>
                            <li><a href="<?php echo Url::toRoute('index/logout');?>"  >退出</a>                            </li>
                        </ul>
                    </div>
                    <?php }else { ?>
                    <div class="dropdown dropup wrapper-sm clearfix">
                        <a href="javascript:void();" class="dropdown-toggle" data-toggle="dropdown"><span class="thumb-sm avatar pull-left m-l-xs">
                            <img src="/themes/backend/images/a0.jpg" class="dker" alt="...">
                            <i class="on b-black"></i></span></a>
                        <ul class="dropdown-menu animated fadeInRight aside text-left">
                            <li><span class="arrow top"></span><a href="<?php echo Url::toRoute('index/login');?>">登陆</a>                            </li>
                            <li class="divider"></li>
                        </ul>
                    </div>
                    <?php } ?>
                </div>
            </footer>
        </section>
    </aside>
    <!-- /.aside -->
    <section id="content">
        <section class="hbox stretch">
            <section>
                <section class="vbox">
                    <iframe src="<?php echo Url::toRoute('subindex/index');?>" name="wokam_content" style="position:absolute; height:100%;width:100%;border:0px;min-height:500px;" ></iframe>
                </section>
            </section>
            <!-- side content -->
            <!-- / side content -->
        </section>
    </section>
</section>
