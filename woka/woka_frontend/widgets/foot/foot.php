<?php

namespace frontend\widgets\foot;

use yii;
/**
 * Alert widget renders a message from session flash. All flash messages are displayed
 * in the sequence they were assigned using setFlash. You can set message as following:
 *
 * ```php
 * \Yii::$app->session->setFlash('error', 'This is the message');
 * \Yii::$app->session->setFlash('success', 'This is the message');
 * \Yii::$app->session->setFlash('info', 'This is the message');
 * ```
 *
 * Multiple messages could be set as follows:
 *
 * ```php
 * \Yii::$app->session->setFlash('error', ['Error 1', 'Error 2']);
 * ```
 *
 * @author Kartik Visweswaran <kartikv2@gmail.com>
 * @author Alexander Makarov <sam@rmcreative.ru>
 */
class foot extends \yii\bootstrap\Widget
{
   
    /**
     * @var array the options for rendering the close button tag.
     */
    public $closeButton = [];

    public function init()
    {
       
    }


    public function run()
    {
        $Cid= Yii::$app->controller->id;
        $CActionId=Yii::$app->controller->action->id;

     
        $html=' <div class="for_box_menu"> '; 

        if($Cid =='index' && $CActionId == 'index')
        {
              $html .= '<a href="javascript:void(0);">
                  <div class="for_menus">
                    <div class="daka_1">
                        <img src="/img/for_menu_daka.png" />
                    </div>
                    <div class="for_menu_index">我的打卡</div>
                </div>
            </a>';
        }else
        {
              $html .= '<a href="/"> 
                  <div class="for_menus">
					<div class="daka_1">
						<img src="/img/for_menu_daka.png"  />
					</div>
					<div class="for_menu_index">我的打卡</div>
				</div>
            </a>';
        }          

                $html .= ' <!--我的打卡-->
            <a href="http://tb.yusanhuzhu.cn/">
                <div class="for_menus">
                    <div class="daka_1">
                        <img src="/img/for_menu_tuijian.png" />
                    </div>
                    <div class="for_menu_index">淘宝优惠</div>
                </div>
            </a>
            <!--精品推荐-->
            <a href="http://wx.yusanbang.cn/help/index/help.html">
                <div class="for_menus">
                    <div class="daka_1">
                        <img src="/img/for_menu_quanzi.png" />
                    </div>
                    <div class="for_menu_index">常见问题</div>
                </div>
            </a>
            <!--我的圈子-->
         ';

                if($Cid =='index' && $CActionId == 'my')
                {
                    $html .= '  <a href="javascript:void(0);">
				<div class="for_menus">
					<div>
						<img src="/img/for_menu_mys.png"  />					</div>
					<div class="for_menu_index">个人中心</div>
				</div>
				</a>';
                }else
                {
                    $html .= '   <a href="/index.php/index/my">
                <div class="for_menus">
                    <div>
                        <img src="/img/for_menu_mys.png" />
                    </div>
                    <div class="for_menu_index">个人中心</div>
                </div>
            </a> ';
                }     

          $html .= ' <!--我的个人中心-->

        </div>
            '; 

                return $html;
        
    }


}
