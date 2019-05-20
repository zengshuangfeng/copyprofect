<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link
	href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>图片编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li><strong><a href="${BASE_PATH}/userinfo/list">用户列表</a></strong>
					</li>
					<li class="active"><strong><a>图片编辑</a></strong></li>
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
										<form id="tab" action="${BASE_PATH}/userinfo/updatepic"
											method="post">
											<input type="hidden" name="uid" value="${uid}">
											<div class="form-group">
												<label class="col-sm-2 control-label">头像修改：</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" />
														<input type="hidden" id="imageHidden" name="head" value="${head}"/>
														<div id="singleDiv"></div>
														<img src="${uploadUrl}${head}" class="wd200 mt10" id="image" />
													</div>
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
<script src="${ctx}/js/Sortable.min.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">
	singleImage("#fileInput", "peipei", "#image", "input[name=head]", "singleDiv");
	//multipleImage("#fileInput2", "peipei", "#imageHidden2");
	var jumpUrl = "${BASE_PATH}/userinfo/detail?id=${uid}";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				head: {required:true}			    	
			},
			messages: {
				head: {required:"不能为空"}					
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
	
</script>

