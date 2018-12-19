<?php
use frontend\widgets\foot\foot;
use wokaextend\wechat\jssdk\JSSdk;
$jssdk = new JSSdk( yii::$app->params['mainWechat']['wchatAPPID'], yii::$app->params['mainWechat']['wechatAPPSecret']);
$signPackage = $jssdk->GetSignPackage();
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>健康从早起开始</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <link rel="stylesheet" href="/css/for_thedaka.css?v=2" />
    <link rel="stylesheet" href="/css/alert.css" />
    <link rel="stylesheet" type="text/css" href="/css/sign2.css" />
       <link rel="stylesheet" type="text/css" href="/css/vzToast.css" />
	       <link rel="stylesheet" type="text/css" href="css/deposits.css"/>
</head>
<body>
    <div class="for_thewrapper_index" style="z-index: -1;">
    </div>
    <!--遮罩-->
    <div class="shade"></div>
    <div>
        <!--日历-->
        <div class="calendar_divs">
            <div class="calendar_dis">
                <div class="calendar_outs">
                    <a href="#">
                        <img src="/img/close_1.png"></a>
                </div>
                 <div class="calendar_top">
                    <span id="dakaLevel">一元连续打卡等级：</span>
                  <div id="userNumber">				
				  </div>
                </div>
             <!--   <h1 class="calendar_tit">打卡日历</h1>
                <div style="" id="calendar"></div>
                <div class="calendar_times"><span>9月30日  14:17</span>已打卡</div> -->
                <div class="calendar_out">
                    一个星星是1天,一个月亮是4天,一个太阳是16天,一个钻为64天，一个皇冠为256天。
                </div>
            </div>
        </div>
        <!--首页-->
        <div class="for_index_header" >
            <div class="for_index_headerleft">
                <div><?=$dateInfo["date"]?></div>
                <div><?=$dateInfo["dateNL"]?></div>
                <div id="updateTime"><?=$dateInfo["time"]?></div>
            </div>
            <div class="for_index_headerright" onclick="doShowLevel();">
                <img src="/img/index_right.png" class="for_index_headerright_img" />
                <div>打卡统计</div>
            </div>
        </div>
        <!--头部结束-->
		<style >
		    .guize_100s{width: 60px; line-height: 30px;font-size: 14px;text-align: center;position: relative;left:0px;top:20px;background-color: #8a85a6;border-radius: 3px;}
			.guize_10s{width: 60px; line-height: 30px;font-size: 14px;text-align: center;position: relative;left:-3px;top:20px;background-color: #8a85a6;border-radius: 3px;margin-left: 5px;}
			.guize_1s{width: 60px; line-height: 30px;font-size: 14px;text-align: center;position: relative;left:0;top:20px;background-color: #8a85a6;border-radius: 3px;margin-right: 5px;}
			.jiangchi_one{width: 150px;height: 150px;border: 2px solid #fff;border-radius: 200px;margin: 0 auto;background: url(../img/jiangchi_1.png) no-repeat center;background-size: 120%;margin-top:-105px ;}
		</style>
       <!--打卡奖池切换-->
        <div class="wrapper_index">
           <div class="for_kachi2" >
				<div onclick="changeType(3);">
                <div class="kachi_t" >百元打卡</div>
                <img src="/img/zuanshi_daka.png" class="for_kachi1_img" />
                   <div class="hovers_select flash" style="display:none;">
                    <img src="/img/hovers_select.png" />
                </div>
				</div>
				<div class="guize_100s">百元规则</div>
            </div>
            <div class="for_kachi1 for_select">
				<div  onclick="changeType(1);">
                <div class="kachi_t">一元打卡</div>
                <img src="/img/gold_daka.png" class="for_kachi1_img" />
                 <div class="hovers_select flash" >
                    <img src="/img/hovers_select.png" />
					
                </div>
				</div>
				<div class="guize_1s">一元规则</div>
				
            </div>
            <div class="for_kachi3">
				<div onclick="changeType(2);">
                <div class="kachi_t">十元打卡</div>
                <img src="/img/gold_daka.png" class="for_kachi1_img" />
                 <div class="hovers_select flash" style="display:none;">
                    <img src="/img/hovers_select.png" />
                </div>
				</div>
				<div class="guize_10s">十元规则</div>
            </div>
            <div class="for_clear"></div>
            <style type="text/css">
                .for_select {
                    position: relative;
                }

                .hovers_select {
                    position: absolute;
                    top: -21px;
                    left: -5px;
                }

                    .hovers_select img {
                        width: 80px;
                    }
					    .flash{  
        -webkit-animation: twinkling 1s infinite ease-in-out  
    }  
    .animated{  
        -webkit-animation-duration: 1s;  
        animation-duration: 1s;  
        -webkit-animation-fill-mode: both;  
        animation-fill-mode: both  
    }  
    @-webkit-keyframes twinkling{  
        0%{  
            opacity: 0.5;  
        }  
        100%{  
            opacity: 1;  
        }  
    }  
    @keyframes twinkling{  
        0%{  
            opacity: 0.5;  
        }  
        100%{  
            opacity: 1;  
        }  
    }  
            </style>
            <!--打卡奖池切换结束-->
            <!--奖池-->
            <div class="jiangchi_one">
                <div class="jiangchi_one_wrapper">
                    <div class="for_money_jiangchi1" ><span id="allMoney">...</span><strong>元</strong></div>
                    <div id="typeText">一元打卡挑战金</div>
                </div>
            </div>
            <!--奖池结束-->
            <div class="challenge_index">
                明日有<strong><span id="allCount">...</span>人</strong>参加挑战		
            </div>
            <!--挑战人数-->
               <div style="width:100%;min-height:100px;line-height:100px;text-align:center;" id="dakaUserLoad">
                    挑战信息加载中...
                </div>
            <div class="challenge_touxiang"  id="dakaUserList" style="display:none;">
               <div id="dakaUserListInfo">
              
               </div>
                <a href="javascript:void(0);" onclick="showPartake();">
                    <div class="challenge_touxiang_img">
                        <img src="/img/challenge_more.png" />
                    </div>
                </a>
            </div>
            <!--挑战者头像-->
            <div class="challenge_guize">
                挑战时间早上<?= Yii::$app->params["beginTime"]; ?>~<?= Yii::$app->params["endTime"]; ?>		
            </div>
            <!--规则-->
            <div class="button_index">
                <div class="button_challenge" id="doDaka">加载中...</div>
               <a href="/index.php/banji">  <div class="button_zhibo">早起约定</div> </a>
            </div>

            <div class="button_index" style="width:100%;margin-top:10px;text-align:center;">
               <div class="button_challenge" id="oneKeyDaka" onclick="oneKeyDaka();" style="margin:0 auto; float:none;position:relative;">一键打卡</div>
              </div>
			    <div class="clear_menu"></div>
		    <div style="width:100%;display:block;padding-bottom:20px;height:110px;">
        <div style="width:33.33%;display:inline-block;text-align:center;float:left;">
            <img id="zqzx" src="http://thirdwx.qlogo.cn/mmopen/vi_32/4ic6gOGFUiclP5xsdas12BfBmt8X88n4IRFw83RmM3GI9k4xZSQdpOL9s4ls0sibibH8ZRicFiatiaKDyVECCYiagwI5iaA/132"  style="width:50%;max-width:80px;height:auto;display:block;border-radius:50%;margin:auto;" />
            <span style="top:15px; position:relative; width:100%;text-align:center;padding-top:15px;color:#b5b2d6;margin-top:15px;">早起之星</span>
           <br/> <span id="zqsj" style="top:15px; position:relative; width:100%;text-align:center;padding-top:15px;color:#b5b2d6;margin-top:15px;">05:00</span>
      
         </div>
         <div style="width:33.33%;display:inline-block;text-align:center;float:left;">
            <img id="xyzx" src="http://thirdwx.qlogo.cn/mmopen/vi_32/4ic6gOGFUiclP5xsdas12BfBmt8X88n4IRFw83RmM3GI9k4xZSQdpOL9s4ls0sibibH8ZRicFiatiaKDyVECCYiagwI5iaA/132"  style="width:50%;max-width:80px;height:auto;display:block;border-radius:50%;margin:auto;" />
            <span style="top:15px; position:relative; width:100%;text-align:center;padding-top:15px;color:#b5b2d6;margin-top:15px;">幸运之星</span>
        <br/>  <span id="jlje" style="top:15px; position:relative; width:100%;text-align:center;padding-top:15px;color:#b5b2d6;margin-top:15px;">8.88元</span>
     
         </div>
         <div style="width:33.33%;display:inline-block;text-align:center;float:left;">
            <img id="tj" src="http://thirdwx.qlogo.cn/mmopen/vi_32/4ic6gOGFUiclP5xsdas12BfBmt8X88n4IRFw83RmM3GI9k4xZSQdpOL9s4ls0sibibH8ZRicFiatiaKDyVECCYiagwI5iaA/132"  style="width:50%;max-width:80px;height:auto;display:block;border-radius:50%;margin:auto;" />
            <span style="top:15px; position:relative; width:100%;text-align:center;padding-top:15px;color:#b5b2d6;margin-top:15px;">推荐之星</span>
         <br/>   <span id="tjrs" style="top:15px; position:relative; width:100%;text-align:center;padding-top:15px;color:#b5b2d6;margin-top:15px;">25人</span>
       
              </div>
    </div>
            <!--按钮结束-->
			<!--<div class="for_prize">
               
                 <div style="width:80%;margin-left:10%; margin-top:10px; margin-bottom:20px; min-height:100px;text-align:center;font-size:0.9rem;">
               早起分钱奖励:<br/>连续打卡30天,10个名额抽奖每人奖100元<br/>
			   连续打卡60天,10个名额抽奖每人奖200元<br/>连续打卡90天,20个名额抽奖每人奖500元
                </div>
             
            </div>-->
			<br/>
			
			<div class="shuang11" style="margin-bottom:50px;" ><img src="/img/jingxi.png"  style="width:100%;" ></div>
			<div style ="display:none;">
            <div class="for_prize" >
                <div class="for_prize_title">今日早起挑战实物奖品:</div>
                 <div style="width:100%;min-height:100px;line-height:100px;text-align:center;" id="dakaPrizeLoad">
                    奖品信息加载中...
                </div>

                <div class="for_prize_piclis" id="dakaPrizeList" style="display:none;">
                    <div class="for_prize_picwrapper" id="dakaPrizeListInfo">
                    
                    </div>
                    <!--图片列表-->
                </div>
            </div>
			</div>
            <!--奖品设置-->
        </div>
        <!--首页盒子内容-->
      
   <?php
        echo foot::widget();
        ?>
        <!--底部菜单-->
       
		<!--<div class="for_index_guize for_click_guize "  onclick="$('.hides_wrapper_canyu1').show();">
				<div class="guize_wrapper" >>>点我查看打卡规则<<</div>
		</div>-->
		
			<!--奖金排行榜begin-->
			<style type="text/css">
				.for_this_rankings{width: 90%;margin:0 5%;margin-bottom:80px;}
			</style>

	  <div class="for_this_rankings">
				<div class="data_ranking">
					<div style="color: #b5b2d6;">
						今日早起奖金排行榜
					</div>
			</div><!--排行榜数据统计-->
          <div id="dakaTop10">
		
              </div>
			</div>
			<!--奖金排行榜end-->
		
		

        <!--查看规则-->
        <!--alert弹框-->
        <div class="main_explain">
            <div class="main_explain_content">
                <div class="main_explain_text">                 
               <img src="/img/main_explain_bgimg.png" class="img_wrapper_alert" /> 
                    <div class="main_explain_shut">
                        <img src="/img/close_1.png" />
                    </div>
                </div>
            </div>
        </div>
        <!--弹框-->
    
          <style type="text/css">
				.hides_wrapper_canyu{width:100%;height:100%;background:rgba(0,0,0,0.8);z-index: 9999;position: fixed;top: 0;/*display: none;*/display: none;overflow:scroll;}
				.hides_wrapper_canyu1{width:100%;height:100%;background:rgba(0,0,0,0.8);z-index: 9999;position: fixed;top: 0;/*display: none;*/display: none;overflow:scroll;}
				.for_canyu_wrapper{width: 80%;margin:30px 5%;font-size: 14px;line-height: 20px;background-color: #e4c5ed;color: #292C39;padding: 5%;border-radius: 15px;}
				.agree_tiaokuan{text-align: center;zoom: 1;line-height: 35px;}
				.agree_tiaokuan_txt{width: 170px;margin: 0 auto;text-align: center;}
				.for_agree_input{width: 15px;height: 15px;margin-top: 10px;margin-left: 5px;float: left;background-color: #fff;border: none;}
				.for_box_wrapper_canyu{width: 100%;margin: 5px 0;}
				.canyuleft{width:10%;float: left;}
				.canyuright{float: left;width:90%;}
				.for_index_button{width: 100%;overflow: hidden;line-height: 50px;}
				.for_index_button button{width: 45%;float: left;line-height: 40px;}
				.for_canyu_button{border: none;color:#fff;background-color: #ff7b11;border-radius:10px ;outline: none;margin:0 2.5%;}
				.for_canyu_button1{border: none;color:#fff;background-color: #2e2d3d;border-radius:10px ;outline: none;}
			</style>
			<div class="hides_wrapper_canyu">
				<div class="for_canyu_wrapper">
					<div><h4 style="text-align: center;line-height: 40px;" class="for_click_guize">加入挑战前请仔细阅读挑战规则</h4>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">1.</div><div class="canyuright">每天早上05:00-08:00之间到平台点击打卡算打卡成功（注意区分打卡级别）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">2.</div><div class="canyuright">打卡成功的随机获得没有打卡的挑战金和平台奖励金（根据打卡人数暂定500-5000元）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">3.</div><div class="canyuright">支付一次挑战金以后只要不中断便可连续打卡，支付挑战金后没有打卡,支付的挑战金就会在当天被随机分掉,需要重新支付挑战金才可获得继续挑战的资格。<br /></div>
</div>
<!--<div class="for_box_wrapper_canyu">
<div class="canyuleft">4.</div><div class="canyuright">支付挑战金后没有打卡,支付的挑战金就会在当天被随机分掉,需要重新支付挑战金才可获得继续挑战的资格</div>
</div>-->
<div class="for_box_wrapper_canyu">
<div class="canyuleft">4.</div><div class="canyuright">忘记打卡的挑战金被分掉后平台不予退还,余额超过1.01元可以提现,提现手续费1%，在您提出提现申请后5分钟内不到您的微信账户，请及时联系在线客服！<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">5.</div><div class="canyuright">打卡成功后截图保存,用于向在线客服提出问题时的证明,没有截图平台客服不受理打卡失败问题,如遇到恶意骚扰在线客服人员,平台有权做出拉黑和请出打卡平台处理</div>
</div>
<!--<div class="for_box_wrapper_canyu">
<div class="canyuleft">6.</div><div class="canyuright">凡在微信群里和工作人员微信有无理取闹,辱骂攻击平台的行为,立即拉黑,挑战金不予退还,奖励金清零,平台曝光有关人员信息<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">7.</div><div class="canyuright">早起分钱平台自2017年10月17日正式上线测试,平台功能会不断完善,以满足不同需求的早友参加,欢迎早友多提发展提议<br /></div>
</div>-->
<div class="for_box_wrapper_canyu">
<div class="canyuleft">6.</div><div class="canyuright">05：00点之前支付的，在当日的 05：00 —— 08：00 进行打卡挑战，05：00点之后支付的，一律到次日 05：00 —— 08：00 进行打卡操作。<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">7.</div><div class="canyuright">没有参与我们平台打卡的，余额里的钱不会提现到微信零钱，并且提现的时候会给自动清零。<br /></div>
</div>


<!--<div class="for_box_wrapper_canyu">
<div class="canyuleft">8.</div><div class="canyuright">早起分钱平台自2017年10月17日正式上线测试，平台功能会不断完善，平台将近日陆续推出10元打卡和58元打卡，以满足不同需求的早友参加，欢迎早友多提发展建议。<div style="margin: 7.5px 0;">平台创始人微信/手机18769900288<br />客服上班时间：正常工作日早8点-晚5点<br />早起平台服务电话：4008008848<br />客服微信/手机13954416029</div></div>
</div>-->
					<div class="agree_tiaokuan">我同意并遵守以上条款规则
                </div>
				<div class="for_index_button"><button class="for_canyu_button" onclick="createPayorder();">同意并支付</button><button class="for_canyu_button1">不同意</button></div>
		  		
				</div>
			</div>
    
    </div>
	
	
	<div class="hides_wrapper_canyu1 yiyuanhezi">
	
	
				<div class="for_canyu_wrapper">
					<div><h4 style="text-align: center;line-height: 40px;">一元打卡挑战规则</h4>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">1.</div><div class="canyuright">每天早上05:00-08:00之间到平台点击打卡算打卡成功（注意区分打卡级别）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">2.</div><div class="canyuright">打卡成功的随机获得没有打卡的挑战金和平台奖励金（根据打卡人数暂定500-5000元）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">3.</div><div class="canyuright">一元打卡支付一次挑战金以后只要不中断便可连续打卡，支付挑战金后没有打卡,支付的挑战金就会在当天被随机分掉,需要重新支付挑战金才可获得继续挑战的资格。<br /></div>
</div>

<div class="for_box_wrapper_canyu">
<div class="canyuleft">4.</div><div class="canyuright">一元打卡早上打卡成功后,上午10:00~下午14:00结算当日早上8点之前的打卡奖励金,本金不会退还,只要不中断打卡以后每天都可连续打卡。(因微信零钱限制余额超过1.01元可以提现，提现手续费1%，在您提出提现申请后5分钟内不到您的微信账户，请及时联系在线客服！)<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">5.</div><div class="canyuright">打卡成功后截图保存,用于向在线客服提出问题时的证明,没有截图平台客服不受理打卡失败问题,如遇到恶意骚扰在线客服人员,平台有权做出拉黑和请出打卡平台处理</div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">6.</div><div class="canyuright">5点之前支付的,需在当日的 05:00 — 08:00 进行打卡操作,5点之后支付的,一律到次日 05:00 — 08:00 进行打卡操作。<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">7.</div><div class="canyuright">没有参与我们平台打卡的，余额里的钱不会提现到微信零钱，并且提现的时候会给自动清零。<br /></div>
</div>
					
				<div class="for_index_button" style="text-align:center;"><button class="for_canyu_button1" style="float:none;width:80%;" onclick="$('.hides_wrapper_canyu1').hide();">我知道了</button></div>
		  		
				</div>
			</div>
    
    </div>
	<!--一元盒子规则结束-->
	<div class="hides_wrapper_canyu1 shiyuanhezi ">
	
	
				<div class="for_canyu_wrapper">
					<div><h4 style="text-align: center;line-height: 40px;">十元挑战规则</h4>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">1.</div><div class="canyuright">每天早上05:00-08:00之间到平台点击打卡算打卡成功（注意区分打卡级别）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">2.</div><div class="canyuright">打卡成功的随机获得没有打卡的挑战金和平台奖励金（根据打卡人数暂定500-5000元）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">3.</div><div class="canyuright">十元打卡支付一次挑战金以后只要不中断便可连续打卡，支付挑战金后没有打卡,支付的挑战金就会在当天被随机分掉,需要重新支付挑战金才可获得继续挑战的资格。<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">4.</div><div class="canyuright">十元打卡早上打卡成功后,上午10:00~下午14:00结算当日早上8点之前的打卡奖励金,本金不会退还,只要不中断打卡以后每天都可连续打卡。（因微信零钱限制，余额超过1.00元才可以提现,提现手续费1%，在您提出提现申请后5分钟内不到您的微信账户，请及时联系在线客服！）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">5.</div><div class="canyuright">打卡成功后截图保存,用于向在线客服提出问题时的证明,没有截图平台客服不受理打卡失败问题,如遇到恶意骚扰在线客服人员,平台有权做出拉黑和请出打卡平台处理</div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">6.</div><div class="canyuright">5点之前支付的,需在当日的 05:00 — 08:00 进行打卡操作,5点之后支付的,一律到次日 05:00 — 08:00 进行打卡操作。<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">7.</div><div class="canyuright">没有参与我们平台打卡的，余额里的钱不会提现到微信零钱，并且提现的时候会给自动清零。<br /></div>
</div>
					
				<div class="for_index_button" style="text-align:center;"><button class="for_canyu_button1" style="float:none;width:80%;" onclick="$('.hides_wrapper_canyu1').hide();">我知道了</button></div>
		  		
				</div>
			</div>
    
    </div>
	<!--十元盒子结束-->
	<div class="hides_wrapper_canyu1 baiyuanhezi">
	
	
				<div class="for_canyu_wrapper">
					<div><h4 style="text-align: center;line-height: 40px;">百元挑战规则</h4>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">1.</div><div class="canyuright">每天早上05:00-08:00之间到平台点击打卡算打卡成功（注意区分打卡级别）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">2.</div><div class="canyuright">打卡成功的随机获得没有打卡的挑战金和平台奖励金（根据打卡人数暂定500-5000元）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">3.</div><div class="canyuright">百元打卡只需支付一次挑战金以后只要不中断便可连续打卡，支付挑战金后没有打卡,支付的挑战金就会在当天被随机分掉,需要重新支付挑战金才可获得继续挑战的资格。<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">4.</div><div class="canyuright">百元打卡早上打卡成功后,上午10:00~下午14:00结算当日早上8点之前的打卡奖励金,本金不会退还,只要不中断打卡以后每天都可连续打卡。（因微信零钱限制，余额超过1.01元才可以提现，提现手续费1%，在您提出提现申请后5分钟内不到您的微信账户，请及时联系在线客服！）<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">5.</div><div class="canyuright">打卡成功后截图保存,用于向在线客服提出问题时的证明,没有截图平台客服不受理打卡失败问题,如遇到恶意骚扰在线客服人员,平台有权做出拉黑和请出打卡平台处理</div>
</div>
<!--<div class="for_box_wrapper_canyu">
<div class="canyuleft">6.</div><div class="canyuright">凡在微信群里和工作人员微信有无理取闹,辱骂攻击平台的行为,立即拉黑,挑战金不予退还,奖励金清零,平台曝光有关人员信息<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">7.</div><div class="canyuright">早起分钱平台自2017年10月17日正式上线测试,平台功能会不断完善,以满足不同需求的早友参加,欢迎早友多提发展提议<br /></div>
</div>-->
<div class="for_box_wrapper_canyu">
<div class="canyuleft">6.</div><div class="canyuright">5点之前支付的,需在当日的 05:00 — 08:00 进行打卡操作,5点之后支付的,一律到次日 05:00 — 08:00 进行打卡操作。<br /></div>
</div>
<div class="for_box_wrapper_canyu">
<div class="canyuleft">7.</div><div class="canyuright">没有参与我们平台打卡的，余额里的钱不会提现到微信零钱，并且提现的时候会给自动清零。<br /></div>
</div>
					
				<div class="for_index_button" style="text-align:center;"><button class="for_canyu_button1" style="float:none;width:80%;" onclick="$('.hides_wrapper_canyu1').hide();">我知道了</button></div>
		  		
				</div>
			</div>
    
    </div>
	<!--百元盒子结束-->
	<!--<div class="hides_wrapper_canyu1" style="display:block;">
	
	
				<div class="for_canyu_wrapper">
					<div><h4 style="text-align: center;line-height: 40px;">招商合作</h4>
<div class="for_box_wrapper_canyu">自2017年12月16日起至2017年12月30日止面向全国招募城市合伙人10家，每省只限一个城市合伙人，目前已有广东、陕西两地合伙人加入，一次性投资2万元，我们将给您一个独立的打卡平台，我们提供全部技术支持，推广培训，运营管理，在线客服，后期平台免费升级。要求：有注册公司执照，法人必须到早起平台面签合伙人协议，有意合作者请加早起平台创始人微信联系。
					
				<div class="for_index_button" style="text-align:center;"><button class="for_canyu_button1" style="float:none;width:80%;" onclick="$('.hides_wrapper_canyu1').hide();">我知道了</button></div>
		  		
				</div>
			</div>
    
    </div>-->
	<!--百元盒子结束-->
	  
		
			<style type="text/css">
			.for_imgs_alert_tuiguang{ position: fixed;top: 0;left: 0;width: 100%;height: 100%;background:url('/img/bgblack.png');z-index: 9999;}
			.for_imgs_alert_tuiguang #vzimgs{width: 90%;margin:100px 5%;}
			.for_close_tuiguang{color: #fff;font-size: 18px;line-height: 60px;text-align: center;text-shadow: 3px 3px 3px #000000;}
			.for_close_tuiguangs{position: fixed;top:80px;right:10px;}
		</style>

    <script>
        //全局函数
        var beginTime = <?=$time;?>; 
        //当前打卡类型
        var _currentType=1;

    </script>
     <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>  
	
	 
     <script type="text/javascript" src="/js/vzToast.js"></script>
     <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script  type="text/javascript" src="/js/hour_1.js?v=<?=time();?>"></script>
     <script type="text/javascript" src="/js/app3-bate.js?v=<?=time();?>"></script>

    <script>

        function getTopInfoNew(type)
        {
            $.ajax({
                url: '/index.php/api/get-top-new',
                type: 'POST', //GET
                async: true,    //或false,是否异步
                data: {
                    type:type
                },
                timeout: 25000,    //超时时间
                dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                beforeSend: function (xhr) {
                    console.log(xhr)
                    console.log('发送前')
                },
                 success: function (data, textStatus, jqXHR) {
                    //处理完成
                  console.log(data.data.xyzx);
                    //获取数据
                    if (data.status == 0) {
                        $("#xyzx").attr('src', data.data.xyzx.headimgurl);
                        $("#tj").attr('src', data.data.tj.headimgurl);
                        $("#zqzx").attr('src', data.data.zqzx.headimgurl);
                        $("#zqsj").text(data.data.zqzx.date);
                        $("#jlje").text(data.data.xyzx.money+'元');
                        $("#tjrs").text(data.data.tj.num +'人');
                    } else {
                        Toast(data.message);
                    }

                },
                error: function (xhr, textStatus) {
                    _oneKeyDaka = false;
                    Toast("网络错误,请稍后重试！");
                    console.log('错误')
                    console.log(xhr)
                    console.log(textStatus)
                }
            })


        }
    </script>
      <script>
        var  _oneKeyDaka=false;
        /******
         一键打卡
        ******/
        function oneKeyDaka()
        {
            if(!_oneKeyDaka)
            {
                _oneKeyDaka=true;
                $.ajax({
                    url: '/index.php/api/one-key-daka',
                    type: 'POST', //GET
                    async: true,    //或false,是否异步
                    data: {                    
                    },
                    timeout: 25000,    //超时时间
                    dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                    beforeSend: function (xhr) {
                        console.log(xhr)
                        console.log('发送前')
                    },
                    success: function (data, textStatus, jqXHR) {
                        //处理完成
                        _oneKeyDaka = false;
                        //获取数据
                        if (data.status == 0) {
                            //更新页面显示
                            //重新设置用户打卡记录
                            var type1Status=data.data.type1.status;
                            if(_currentType == 1)
                            {
                                setUserStatus(data.data.type1.status, false);
                            }else  if(_currentType == 2)
                            {
                                setUserStatus(data.data.type2.status, false);
                            }else  if(_currentType == 3)
                            {
                                setUserStatus(data.data.type3.status, false);
                            }
                            
                            vzToast.show({
                                class: '',
                                color: 'dark',
                                icon: 'icon-contacts',
                                title: '一键打卡信息',
                                message: '一元打卡【'+getDakaStatusInfo(data.data.type1.status)+'】<br/>十元打卡【'+getDakaStatusInfo(data.data.type2.status)+'】<br/>百元打卡【'+getDakaStatusInfo(data.data.type3.status)+'】',
                                position: 'topCenter',
                                transitionIn: 'flipInX',
                                transitionOut: 'flipOutX',
                                progressBarColor: 'rgb(0, 255, 184)',
                                image: '/img/sun.png',
                                timeout:10000,
                              //  imageWidth: 70,
                                layout:2,
                                onClose: function(){
                                    console.info('onClose');
                                },
                                iconColor: 'rgb(0, 255, 184)'
                            });

                        } else {
                            Toast(data.message);
                        }

                    },
                    error: function (xhr, textStatus) {
                        _oneKeyDaka = false;
                        Toast("网络错误,请稍后重试！");
                        console.log('错误')
                        console.log(xhr)
                        console.log(textStatus)
                    }
                })


            }else{
                alert("请稍后重试！");
            }

        }

        function getDakaStatusInfo(status)
        {
            if (status == 0) {
                return ("未参加挑战");              

            } else if (status == 1) {
                return ("打卡");
               
            } else if (status == 2) {
                return ("请继续挑战");
             
            } else if (status == 10) {
                return ("今日已经打卡");
            } else if (status == 9) {
                return ("已经打卡");
               
            }else if (status == 8) {
                return ("请明日打卡");              
            }
            else if (status == 11) {
                return ("不在打卡时间内");
            }
            return ("未知状态!");
        }

    </script>
	 
	       <script type="text/javascript">
		      $(".shuang11").click(function(){
				  window.location.href="/index.php/banji";
				  })
		   
          // yii::$app->params['mainWechat']['wchatAPPID']
          // yii::$app->params['mainWechat']['wechatAPPSecret']
        //  var _token = "<?php echo $signPackage["appId"];?>";
          wx.config({
              debug: false,
              appId: '<?php echo $signPackage["appId"];?>',
              timestamp: '<?php echo $signPackage["timestamp"];?>',
              nonceStr: '<?php echo $signPackage["nonceStr"];?>',
              signature: '<?php echo $signPackage["signature"];?>',
              jsApiList: [
                   'checkJsApi',
              
              'onMenuShareTimeline',
              'onMenuShareAppMessage'
                // 所有要调用的 API 都要加到这个列表中
              ]
          });
          wx.ready(function () {
              // 在这里调用 API
              wx.onMenuShareAppMessage({
                  title: '<?php echo $news['Title'];?>',
                  desc: '<?php echo $news['Description'];?>',
                  link: '<?php echo $news['Url'];?>',
                  imgUrl: '<?php echo $news['PicUrl'];?>',
                  trigger: function (res) {
                      // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
                      //   alert('用户点击发送给朋友');
                  },
                  success: function (res) {
                                       $.ajax({
                url: '/index.php/api/doshare',
                type: 'POST', //GET
                async: true,    //或false,是否异步
                data: {
                   
                },
                timeout: 25000,    //超时时间
                dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                beforeSend: function (xhr) {
                    console.log(xhr)
                    console.log('发送前')
                },
                success: function (data, textStatus, jqXHR) {
   if(data.status == 0)
                              {
                                  Toast("分享完成");
                              }else{
                                  Toast(data.message);
                              }    
                },
                error: function (xhr, textStatus) {                 
                    Toast("网络错误,请稍后重试！");
                    console.log('错误')
                    console.log(xhr)
                    console.log(textStatus)
                }
            })
                  },
                  cancel: function (res) {
                      toastDo("已取消分享！");
                  },
                  fail: function (res) {
                      //   alert(JSON.stringify(res));
                  }
              });

              wx.onMenuShareTimeline({
                  title: '<?php echo $news['Title'];?>',
                link: '<?php echo $news['Url'];?>',
                imgUrl: '<?php echo $news['PicUrl'];?>',
                trigger: function (res) {
                    // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
                    //   alert('用户点击分享到朋友圈');
                },
                success: function (res) {
                     $.ajax({
                url: '/index.php/api/doshare',
                type: 'POST', //GET
                async: true,    //或false,是否异步
                data: {
                   
                },
                timeout: 25000,    //超时时间
                dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                beforeSend: function (xhr) {
                    console.log(xhr)
                    console.log('发送前')
                },
                success: function (data, textStatus, jqXHR) {
                   
   if(data.status == 0)
                              {
                                  Toast("分享完成");
                              }else{
                                  Toast(data.message);
                              }    
                },
                error: function (xhr, textStatus) {                 
                    Toast("网络错误,请稍后重试！");
                    console.log('错误')
                    console.log(xhr)
                    console.log(textStatus)
                }
            })
					
                },
                cancel: function (res) {
                    //  alert('已取消');
                },
                fail: function (res) {
                    // alert(JSON.stringify(res));
                }
            });

          });
        wx.error(function (res) {
            console.log(res);
            // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
        });



 </script>
	 
<script type="text/javascript">
			$(".for_click_guize").click(function(){
					$('.hides_wrapper_canyu1').hid();
				});
		$('.for_canyu_button1').click(function(){$(".hides_wrapper_canyu").hide();});
		$(".guize_1s").click(function(){
			$(".yiyuanhezi").show();
			
		});
		$(".guize_10s").click(function(){
			$(".shiyuanhezi").show();
			
		});
		$(".guize_100s").click(function(){
			$(".baiyuanhezi").show();
			
		});

		</script>
    
    <script type="text/javascript">

        //查看打卡用户
        function showPartake()
        {
            //进入打卡信息页面
            var  url='/index.php/index/partake?type='+_currentType;
            window.location.href=url;

        }
	function vzOpen(url)
	{
	       $('.for_imgs_alert_tuiguang').hide();
            window.location.href=url;
	}


		</script>
        
</body>
</html>
