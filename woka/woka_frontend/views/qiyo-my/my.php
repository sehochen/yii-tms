<?phpuse yii\helpers\Url;?>
<!-- HTML5文件 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
	<meta content="telephone=no,email=no" name="format-detection">
	<meta name="wap-font-scale" content="no">
	<title>We鱼个人中心</title>
	<!-- ui框架引入css -->
	<link href="/themes/frontend/public/css/weui.min.css" rel="stylesheet" type="text/css" />
	<link href="/themes/frontend/public/css/jquery-weui.min.css" rel="stylesheet" type="text/css" />
	<!-- 公用样式css -->
	<link href="/themes/frontend/public/css/base.css" rel="stylesheet" type="text/css" />
	<!-- 界面引入css -->
	<link href="/themes/frontend/public/css/app/user/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="main bot44">
   <div class="user-site">
      <div class="user-field">
         <b><img src="<?=$arrUserInfo['headimgurl'];?>" /></b>
         <i>
           <p>微信昵称:<?=$arrUserInfo['nickname'];?></p>
           <p>平台ID：<span class="green"><?= 'QIYO1'.sprintf("%09d", $arrUserInfo['id']+10000) ;?></span></p>
           <p>当前称谓:<span class="red" style="display:inline-block;float:none;" >创始鱼苗</span> </p>
         </i>
      </div>
      <div class="user-hand">
        <li>
           <div class="box box6">
              <p>可用余额</p>
              <p><?=$arrCashInfo['money'];?></p>
           </div>
        </li>
        <li>
           <div class="box box6">
              <p>当前积分</p>
              <p><?=$arrCashInfo['point'];?></p>
           </div>
        </li>
        <li>
           <div class="box box6">
              <p>冻结金额</p>
              <p><?=$arrCashInfo['freez_money'];?></p>
           </div>
        </li>
      </div>
   </div>
   <div class="user-menu">
           <div class="weui-grids">
              <a href="<?= Url::toRoute('game/paper/my');?>" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/pepar.jpg" alt="">
                </div>
                <p class="weui-grid__label">
                   石头剪刀布
                </p>
              </a>
            <!--    <a href="gold-log.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/icon/u-2.png" alt="">
                </div>
                <p class="weui-grid__label">
                  金币日志
                </p>
              </a>
              <a href="money-log.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/icon/u-3.png" alt="">
                </div>
                <p class="weui-grid__label">
                  余额日志
                </p>
              </a>
              <a href="../detail/order-pay.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/icon/u-4.png" alt="">
                </div>
                <p class="weui-grid__label">
                  我的订单
                </p>
              </a>
              <a href="detail.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/icon/u-5.png" alt="">
                </div>
                <p class="weui-grid__label">
                  我的账户
                </p>
              </a>
              <a href="sale-log.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/icon/u-6.png" alt="">
                </div>
                <p class="weui-grid__label">
                  我的分销
                </p>
              </a>
              <a href="gold.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/icon/u-7.png" alt="">
                </div>
                <p class="weui-grid__label">
                  金币兑换
                </p>
              </a>
              <a href="address.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/icon/u-8.png" alt="">
                </div>
                <p class="weui-grid__label">
                  我的地址
                </p>
              </a>
              <a href="money.html" class="weui-grid js_grid">
                <div class="weui-grid__icon">
                  <img src="/themes/frontend/public/images/icon/u-9.png" alt="">
                </div>
                <p class="weui-grid__label">
                  申请提现
                </p>
              </a>-->
            </div>
      </div>
</div>
    <!-- footer -->
<footer class="footer">
     <div class="weui-tabbar">
        <a href="../index.html" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="/themes/frontend/public/images/icon/i-1.png" alt="">
          </div>
          <p class="weui-tabbar__label">产品订购</p>
       </a>
      <a href="../index.html" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="/themes/frontend/public/images/icon/i-2.png" alt="">
          </div>
          <p class="weui-tabbar__label">我的二维码</p>
        </a>
        <a href="../order/index.html" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="/themes/frontend/public/images/icon/i-3.png" alt="">
          </div>
          <p class="weui-tabbar__label">我的订单</p>
        </a>
        <a href="/" class="weui-tabbar__item weui-bar__item--on">
          <div class="weui-tabbar__icon">
            <img src="/themes/frontend/public/images/icon/i-4.png" alt="">
          </div>
          <p class="weui-tabbar__label">个人中心</p>
        </a> 
      </div>
</footer>

<!-- jquery引入 -->
<script type="text/javascript" src="/themes/frontend/public/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/themes/frontend/public/js/jquery/flexible.js"></script>

</body>
</html>
