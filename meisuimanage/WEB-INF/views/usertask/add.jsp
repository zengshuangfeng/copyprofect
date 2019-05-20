<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>每日任务添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/usertask/list">每日任务列表</a></strong>
					</li>
					<li class="active"><strong><a>添加</a></strong></li>
				</ol>
			</div>
		</div>
        <div class="wrapper wrapper-content animated fadeInRight ecommerce">
            <div class="row">
                <div class="col-lg-12">
                    <div class="tabs-container">
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<fieldset class="form-horizontal">
										<form id="tab" action="${BASE_PATH}/usertask/save"
											method="post">		
											<div class="form-group">
												<label class="col-sm-2 control-label">任务事件：</label>
												<div class="col-sm-4">
													<select name="type" class="form-control">
														<option value="1">分享主播</option>
														<option value="2">游戏获胜</option>
														<option value="3">打赏主播</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">任务标题：</label>
												<div class="col-sm-4">
													<input type="text" name="name" class="form-control">
												</div>
											</div>		
											<div class="form-group">
												<label class="col-sm-2 control-label">图标</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="icon"/>
														<div id="singleDiv"></div>
														<img src="" class="hide" id="image" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;图片大小：</span>
												</div>
											</div>											
											<div class="form-group">
												<label class="col-sm-2 control-label">完成次数：</label>
												<div class="col-sm-4">
													<input type="text" name="num" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">奖励钻石：</label>
												<div class="col-sm-4">
													<input type="text" name="reward_count" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">排序：</label>
												<div class="col-sm-4">
													<input type="text" name="sort" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-4 col-sm-offset-2">
													<button class="ladda-button btn btn-info"
														data-style="slide-up">
														<i class="fa fa-check"></i>&nbsp;保存
													</button>
												</div>
											</div>
										</form>
									</fieldset>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/usertask/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {required:true, maxlength:20},
				icon: {required:true},
				num: {required:true, digits:true},				
				reward_count: {required:true, digits:true},	
				sort: {required:true, digits:true}
			},
			messages: {
				name: {required:"任务标题不能为空",maxlength:"任务标题长度不能大于20个字"},
				icon: {required:"图标不能为空"},
				num: {required:"完成次数不能为空", digits:"完成次数只能是正整数"},
				reward_count: {required:"奖励钻石不能为空", digits:"奖励钻石只能是正整数"},
				sort: {required:"排序不能为空", digits:"排序只能是正整数"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#tab"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
			        	show(json, jumpUrl);
		        });
	        	return false;
	    	}
		});
	});
	$(function(){	
		singleImage("#fileInput", "peipei", "#image", "input[name=icon]", "singleDiv");
	});
</script>