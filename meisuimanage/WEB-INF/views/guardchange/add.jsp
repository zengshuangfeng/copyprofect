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
				<h2>守护配置添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石管理</a></li>
					<li><strong><a href="${BASE_PATH}/guardchange/list">守护配置</a></strong>
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
										<form id="tab" action="${BASE_PATH}/guardchange/save"
											method="post">		
											<div class="form-group">
												<label class="col-sm-2 control-label">选择守护类型：</label>
												<div class="col-sm-2">
													<select name="type" class="form-control">
														<option value="0">包月守护</option>
														<option value="1">包季守护</option>
														<option value="2">包年守护</option>
													</select>
												</div>
											</div>			
											<div class="form-group">
												<label class="col-sm-2 control-label">充值名称：</label>
												<div class="col-sm-2">
													<input type="text" name="name" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">充值面额：</label>
												<div class="col-sm-2">
													<input type="text" name="change_rmb" class="form-control">
												</div>
											</div>	
												<div class="form-group">
												<label class="col-sm-2 control-label">头像装饰图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="guard_head" />
														<div id="singleDiv"></div>
														<img src="" class="hide wd200" id="image" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
												</div>
											</div>
												<div class="form-group">
												<label class="col-sm-2 control-label">入场特效图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload1" id="fileInput1" type="file" /><input
															type="hidden" id="imageHidden1" name="entrance_pic" />
														<div id="singleDiv1"></div>
														<img src="" class="hide wd200" id="image1" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
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
<script src="${ctx}/js/uploadfiy.setting.js?r=1" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/guardchange/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				change_rmb: {required:true, digits:true},
				name: {required:true},
				guard_head: {required:true},
				entrance_pic: {required:true}
			},
			messages: {
				change_rmb: {required:"充值面额不能为空", digits:"充值面额只能是正整数"},
				name: {required:"充值名称不能为空"},
				guard_head: {required:"头像装饰图片不能为空"},
				entrance_pic:{required:"入场特效图片不能为空"}
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
	singleImage("#fileInput", "meisui", "#image", "input[name=guard_head]", "singleDiv");
	singleImage("#fileInput1", "meisui", "#image1", "input[name=entrance_pic]", "singleDiv1");
</script>