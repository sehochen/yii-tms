
<?php
use yii\widgets\LinkPager;
use yii\base\Object;
use yii\bootstrap\ActiveForm;
use common\models\common\rbac\RbacAdminRight;
use yii\helpers\Url;
$modelLabel = new \common\models\common\rbac\RbacAdminRight();
?>

<?php $this->beginBlock('header');  ?>
<!-- <head></head>中代码块 -->
<?php $this->endBlock(); ?>
<style>
    .modal-backdrop{
        z-index:0 !important;
    }

</style>
<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
      
        <div class="box-header">
          <h3 class="box-title">路由管理</h3>
          <div class="box-tools">
            <div class="input-group input-group-sm" style="width: 150px;">
                <button id="create_btn" type="button" class="btn btn-xs btn-primary">添&nbsp;&emsp;加</button>
        			|
        		<button id="delete_btn" type="button" class="btn btn-xs btn-danger">批量删除</button>
            </div>
          </div>
        </div>
        <!-- /.box-header -->
        
        <div class="box-body">
          <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
            <!-- row start search-->
          	<div class="row">
          	<div class="col-sm-12">
                <?php ActiveForm::begin(['id' => 'admin-right-search-form', 'method'=>'get', 'options' => ['class' => 'form-inline'], 'action'=>Url::toRoute('admin-right/index')]); ?>     
                
                  <div class="form-group" style="margin: 5px;">
                      <label><?=$modelLabel->getAttributeLabel('id')?>:</label>
                      <input type="text" class="form-control" id="query[id]" name="query[id]"  value="<?=isset($query["id"]) ? $query["id"] : "" ?>">
                  </div>
              <div class="form-group">
              	<a onclick="searchAction()" class="btn btn-primary btn-sm" href="#"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>搜索</a>
           	  </div>
               <?php ActiveForm::end(); ?> 
            </div>
          	</div>
          	<!-- row end search -->
          	
          	<!-- row start -->
          	<div class="row">
          	<div class="col-sm-12">
          	<table id="data_table" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="data_table_info">
            <thead>
            <tr role="row">
            
            <?php 
		      echo '<th><input id="data_table_check" type="checkbox"></th>';
              echo '<th tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('id').'</th>';
//               echo '<th class="sorting" tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('menu_id').'</th>';
              echo '<th tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('right_name').'</th>';
//               echo '<th class="sorting" tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('display_label').'</th>';
//               echo '<th class="sorting" tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('des').'</th>';
              echo '<th tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('display_order').'</th>';
              echo '<th tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('update_user').'</th>';
              echo '<th tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >'.$modelLabel->getAttributeLabel('update_date').'</th>';
         
			?>
	
            <th tabindex="0" aria-controls="data_table" rowspan="1" colspan="1" aria-sort="ascending" >操作</th>
            </tr>
            </thead>
            <tbody>
            
            <?php
            $row = 0;
            foreach ($models as $model) {
                echo '<tr id="rowid_' . $model->id . '">';
                echo '  <td><label><input type="checkbox" value="' . $model->id . '"></label></td>';
                echo '  <td>' . $model->id . '</td>';
//                 echo '  <td>' . $model->menu_id . '</td>';
                echo '  <td>' . $model->right_name . '</td>';
//                 echo '  <td>' . $model->display_label . '</td>';
//                 echo '  <td>' . $model->des . '</td>';
                echo '  <td>' . $model->display_order . '</td>';
                //echo '  <td>' . $model->has_lef . '</td>';
                //echo '  <td>' . $model->create_user . '</td>';
                //echo '  <td>' . $model->create_date . '</td>';
                echo '  <td>' . $model->update_user . '</td>';
                echo '  <td>' . $model->update_date . '</td>';
                echo '  <td class="center">';
                echo '      <a id="view_btn" onclick="viewAction(' . $model->id . ')" class="btn btn-primary btn-sm" href="#"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>查看</a>';
                echo '      <a id="edit_btn" onclick="editAction(' . $model->id . ')" class="btn btn-primary btn-sm" href="#"> <i class="glyphicon glyphicon-edit icon-white"></i>修改</a>';
                echo '      <a id="delete_btn" onclick="deleteAction(' . $model->id . ')" class="btn btn-danger btn-sm" href="#"> <i class="glyphicon glyphicon-trash icon-white"></i>删除</a>';
                echo '  </td>';
                echo '<tr/>';
            }
            
            ?>
            
           
           
            </tbody>
            <!-- <tfoot></tfoot> -->
          </table>
          </div>
          </div>
          <!-- row end -->
          
          <!-- row start -->
          <div class="row">
          	<div class="col-sm-5">
            	<div class="dataTables_info" id="data_table_info" role="status" aria-live="polite">
            		<div class="infos">
            		从<?= $pages->getPage() * $pages->getPageSize() + 1 ?>            		到 <?= ($pageCount = ($pages->getPage() + 1) * $pages->getPageSize()) < $pages->totalCount ?  $pageCount : $pages->totalCount?>            		 共 <?= $pages->totalCount?> 条记录</div>
            	</div>
            </div>
          	<div class="col-sm-7">
              	<div class="dataTables_paginate paging_simple_numbers" id="data_table_paginate">
              	<?= LinkPager::widget([
              	    'pagination' => $pages,
              	    'nextPageLabel' => '下一页',
              	    'prevPageLabel' => '上一页',
              	    'firstPageLabel' => '首页',
              	    'lastPageLabel' => '尾页',
              	]); ?>	
              	
              	</div>
          	</div>
		  </div>
		  <!-- row end -->
        </div>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
</section>
<!-- /.content -->

<div class="modal fade" id="edit_dialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>路由管理</h3>
			</div>
			<div class="modal-body">
                <?php $form = ActiveForm::begin(["id" => "admin-right-form", "class"=>"form-horizontal", "action"=>Url::toRoute('admin-right/save')]); ?>                      
                 
                 <input type="hidden" class="form-control" id="id" name="id" />
          		 <input type="hidden" class="form-control" id="menu_id" name="RbacAdminRight[menu_id]" value="<?=$menu_id?>" />
                 
          <div id="right_name_div" class="form-group">
              <label for="right_name" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("right_name")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="right_name" name="RbacAdminRight[right_name]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="display_label_div" class="form-group">
              <label for="display_label" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("display_label")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="display_label" name="RbacAdminRight[display_label]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="des_div" class="form-group">
              <label for="des" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("des")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="des" name="RbacAdminRight[des]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="display_order_div" class="form-group">
              <label for="display_order" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("display_order")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="display_order" name="RbacAdminRight[display_order]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

			<div id="controller_div" class="form-group">
    			<label for="controller" class="col-sm-2 control-label">控制器ID</label>
    			<div class="col-sm-10">
    				<select class="form-control" name="SystemFunction[controller]" id="controller">
    				  <option>请选择</option>
    				<?php 
    				   
    				  foreach($controllerData as $key=>$data){
    				      echo "<option value='" . $key . "'>". $key."</option>";
    				  }
    				?>
            	   </select>
    			</div>
    			<div class="clearfix"></div>
    		</div>

			<div id="actions_div" class="form-group">
    			<label for="actions" class="col-sm-2 control-label">路由地址</label>
    			<div class="col-sm-10">
    				<div id="treeview"  >	
    				</div>
    			</div>
    			<div class="clearfix"><br/></div>
    		</div>  

          <div id="has_lef_div" class="form-group">
              <label for="has_lef" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("has_lef")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="has_lef" name="RbacAdminRight[has_lef]" placeholder="必填" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="create_user_div" class="form-group">
              <label for="create_user" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("create_user")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="create_user" name="RbacAdminRight[create_user]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="create_date_div" class="form-group">
              <label for="create_date" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("create_date")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="create_date" name="RbacAdminRight[create_date]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="update_user_div" class="form-group">
              <label for="update_user" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("update_user")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="update_user" name="RbacAdminRight[update_user]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>

          <div id="update_date_div" class="form-group">
              <label for="update_date" class="col-sm-2 control-label"><?php echo $modelLabel->getAttributeLabel("update_date")?></label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" id="update_date" name="RbacAdminRight[update_date]" placeholder="" />
              </div>
              <div class="clearfix"></div>
          </div>
                    

			<?php ActiveForm::end(); ?>          
                </div>
			<div class="modal-footer">
				<a href="#" class="btn btn-default" data-dismiss="modal">关闭</a> <a
					id="edit_dialog_ok" href="#" class="btn btn-primary">确定</a>
			</div>
		</div>
	</div>
</div>
<?php $this->beginBlock('footer');  ?>
<!-- <body></body>后代码块 -->
 <script>
 window.controllerData = <?php echo json_encode($controllerData); ?>;
 function searchAction(){
		$('#admin-right-search-form').submit();
	}
 function viewAction(id){
		initModel(id, 'view', 'fun');
	}

 function initEditSystemModule(data, type){
	if(type == 'create'){
		$("#id").val('');
// 		$("#menu_id").val('');
		$("#right_name").val('');
		$("#display_label").val('');
		$("#des").val('');
		$("#display_order").val('');
		$("#has_lef").val('');
		$("#create_user").val('');
		$("#create_date").val('');
		$("#update_user").val('');
		$("#update_date").val('');
		
	}
	else{
		$("#id").val(data.id);
    	$("#menu_id").val(data.menu_id);
    	$("#right_name").val(data.right_name);
    	$("#display_label").val(data.display_label);
    	$("#des").val(data.des);
    	$("#controller option").each(function(){
        	var opt = $(this);
    		if(opt.val() == data.controller){
    			opt.attr('selected', true);
    			opt.change();
    			return false;
    		}
        });
    	$("#display_order").val(data.display_order);
    	$("#has_lef").val(data.has_lef);
    	$("#create_user").val(data.create_user);
    	$("#create_date").val(data.create_date);
    	$("#update_user").val(data.update_user);
    	$("#update_date").val(data.update_date);
    	}
	if(type == "view"){
      $("#id").attr({readonly:true,disabled:true});
//       $("#menu_id").attr({readonly:true,disabled:true});
      $("#right_name").attr({readonly:true,disabled:true});
      $("#display_label").attr({readonly:true,disabled:true});
      $("#display_label").parent().parent().show();
      $("#des").attr({readonly:true,disabled:true});
      $("#display_order").attr({readonly:true,disabled:true});
      $("#has_lef").attr({readonly:true,disabled:true});
      $("#has_lef").parent().parent().show();
      $("#create_user").attr({readonly:true,disabled:true});
      $("#create_user").parent().parent().show();
      $("#create_date").attr({readonly:true,disabled:true});
      $("#create_date").parent().parent().show();
      $("#update_user").attr({readonly:true,disabled:true});
      $("#update_user").parent().parent().show();
      $("#update_date").attr({readonly:true,disabled:true});
      $("#update_date").parent().parent().show();
	$('#edit_dialog_ok').addClass('hidden');
	}
	else{
      $("#id").attr({readonly:false,disabled:false});
//       $("#menu_id").attr({readonly:false,disabled:false});
      $("#right_name").attr({readonly:false,disabled:false});
      $("#display_label").attr({readonly:false,disabled:false});
      $("#display_label").parent().parent().hide();
      $("#des").attr({readonly:false,disabled:false});
      $("#display_order").attr({readonly:false,disabled:false});
      $("#has_lef").attr({readonly:false,disabled:false});
      $("#has_lef").parent().parent().hide();
      $("#create_user").attr({readonly:false,disabled:false});
      $("#create_user").parent().parent().hide();
      $("#create_date").attr({readonly:false,disabled:false});
      $("#create_date").parent().parent().hide();
      $("#update_user").attr({readonly:false,disabled:false});
      $("#update_user").parent().parent().hide();
      $("#update_date").attr({readonly:false,disabled:false});
      $("#update_date").parent().parent().hide();
		$('#edit_dialog_ok').removeClass('hidden');
		}
		$('#edit_dialog').modal('show');
}

function initModel(id, type, fun){
	
	$.ajax({
		   type: "GET",
		   url: "<?=Url::toRoute('admin-right/view')?>",
		   data: {"id":id},
		   cache: false,
		   dataType:"json",
		   error: function (xmlHttpRequest, textStatus, errorThrown) {
			    alert("出错了，" + textStatus);
			},
		   success: function(data){
			   initEditSystemModule(data.model, type);
			   $('#treeview').treeview({
					data:data.actions,
					showIcon: false,
			        showCheckbox: true,
			        levels: 2,
			        onNodeChecked: function(event, node) {
			          changeCheckState(node, true);
			        },
			        onNodeUnchecked: function (event, node) {
			        	changeCheckState(node, false);
			        }
				});
		   }
		});
}
	
function editAction(id){
	initModel(id, 'edit');
}

function deleteAction(id){
	var ids = [];
	if(!!id == true){
		ids[0] = id;
	}
	else{
		var checkboxs = $('#data_table tbody :checked');
	    if(checkboxs.size() > 0){
	        var c = 0;
	        for(i = 0; i < checkboxs.size(); i++){
	            var id = checkboxs.eq(i).val();
	            if(id != ""){
	            	ids[c++] = id;
	            }
	        }
	    }
	}
	if(ids.length > 0){
		admin_tool.confirm('请确认是否删除', function(){
		    $.ajax({
				   type: "GET",
				   url: "<?=Url::toRoute('admin-right/delete')?>",
				   data: {"ids":ids},
				   cache: false,
				   dataType:"json",
				   error: function (xmlHttpRequest, textStatus, errorThrown) {
					    alert("出错了，" + textStatus);
					},
				   success: function(data){
					   for(i = 0; i < ids.length; i++){
						   $('#rowid_' + ids[i]).remove();
					   }
					   admin_tool.alert('msg_info', '删除成功', 'success');
					   window.location.reload();
				   }
				});
		});
	}
	else{
		admin_tool.alert('msg_info', '请先选择要删除的数据', 'warning');
	}
    
}

function getSelectedIdValues(formId)
{
	var value="";
	$( formId + " :checked").each(function(i)
	{
		if(!this.checked)
		{
			return true;
		}
		value += this.value;
		if(i != $("input[name='id']").size()-1)
		{
			value += ",";
		}
	 });
	return value;
}

$('#edit_dialog_ok').click(function (e) {
    e.preventDefault();
	$('#admin-right-form').submit();
});

$('#create_btn').click(function (e) {
    e.preventDefault();
    var menu_id = $("#menu_id").val();
	$.ajax({
		   type: "GET",
		   url: "<?=Url::toRoute('admin-right/right-action')?>",
		   data: {'rightId':0, 'menu_id':menu_id},
		   cache: false,
		   dataType:"json",
		   error: function (xmlHttpRequest, textStatus, errorThrown) {
			    alert("出错了，" + textStatus);
			},
		   success: function(data){
			    console.log(data);
				$('#treeview').treeview({
					data:data,
					showIcon: false,
			        showCheckbox: true,
			        levels: 2,
			        onNodeChecked: function(event, node) {
			          //console.log('======',node);
			          changeCheckState(node, true);
			        },
			        onNodeUnchecked: function (event, node) {
			        	changeCheckState(node, false);
			        }
					});
		   }
		});
    initEditSystemModule({}, 'create');
});

$('#delete_btn').click(function (e) {
    e.preventDefault();
    deleteAction('');
});

$('#admin-right-form').bind('submit', function(e) {
	e.preventDefault();

	var checkNodes = $('#treeview').treeview('getChecked');
	var rightUrls = [];
	if(checkNodes.length > 0){
		for(i = 0; i < checkNodes.length; i++){
			var node = checkNodes[i];
			if(node.type == 'a'){
				var url = {'c':node.c, 'a':node.a};
				rightUrls.push(url);
			}
		}
	}
	
	var id = $("#id").val();
	var action = id == "" ? "<?=Url::toRoute('admin-right/create')?>" : "<?=Url::toRoute('admin-right/update')?>";
    $(this).ajaxSubmit({
    	type: "post",
    	dataType:"json",
    	url: action,
    	data:{id:id},
    	data: {"rightUrls":rightUrls},
    	success: function(value) 
    	{
        	if(value.errno == 0){
        		$('#edit_dialog').modal('hide');
        		admin_tool.alert('msg_info', '添加成功', 'success');
        		window.location.reload();
        	}
        	else{
            	var json = value.data;
        		for(var key in json){
        			$('#' + key).attr({'data-placement':'bottom', 'data-content':json[key], 'data-toggle':'popover'}).addClass('popover-show').popover('show');
        			
        		}
        	}

    	}
    });
});

//配置功能url
function changeCheckState(node, checked){
	if(!!node.nodes == true){
		var nodes = node.nodes;
		for(var i = 0; i < nodes.length; i++){
			var node1 = nodes[i];
			if(checked == true){
				$('#treeview').treeview('checkNode', [ node1.nodeId, { silent: true } ]);
			}
			else{
				$('#treeview').treeview('uncheckNode', [ node1.nodeId, { silent: true } ]);
			}
			changeCheckState(node1, checked);
		}
	}
}

$("#controller").change(function(){
    // 先清空第二个
	var controller = $(this).val();
     $("#action").empty();
     var option = $("<option>").html("请选择");
     $("#action").append(option);
    // 实际的应用中，这里的option一般都是用循环生成多个了
     var actions = window.controllerData[controller];
     var nodes = actions.nodes;
     var rightTree = {'text':controller, 'selectable':false, 'state':{'checked':false}, 'type':'r'};
     rightTree['nodes'] = nodes;
     
     $('#treeview').treeview({
		data: [rightTree],
		showIcon: false,
        showCheckbox: true,
        levels: 2,
        onNodeChecked: function(event, node) {
          changeCheckState(node, true);
        },
        onNodeUnchecked: function (event, node) {
        	changeCheckState(node, false);
        }
	});
     
});
</script>
<?php $this->endBlock(); ?>