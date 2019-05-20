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
				<h2>群组编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>权限管理</a></li>
					<li><strong><a href="${BASE_PATH}/admingroup/list">群组管理</a></strong>
					</li>
					<li class="active"><strong><a>群组编辑</a></strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<form id="form_submit1" action="${BASE_PATH}/admingroup/save"
									method="post">
									<div class="panel-body">
										<fieldset class="form-horizontal">
											<div class="form-group">
												<label class="col-sm-2 control-label">群组名称：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="name" value="${admin_Group.name}">
												</div>
											</div>	  
											<input type="hidden" name="id" value="${admin_Group.id}" />                                							
										   <div class="form-group">
		                                        <div class="col-sm-4 col-sm-offset-2">
		                                            <button class="ladda-button btn btn-info demo1" data-style="slide-up"><i class="fa fa-check"></i>&nbsp;保存</button>
		                                        </div>
			                               </div>
										</fieldset>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>						
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/admingroup/list";
	$().ready(function() {
		$("#form_submit1").validate({
			rules: {
				name: {required:true}
			},
			messages: {
				name: {required:"群组名称不能为空"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#form_submit1"), function(json){
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