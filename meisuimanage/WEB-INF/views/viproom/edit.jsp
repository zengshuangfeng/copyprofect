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
				<h2>VIP房套餐添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/levelscore/list">VIP房设置</a></strong>
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
										<form id="tab" action="${BASE_PATH}/viproom/save"
											method="post">		
											<input type="hidden" name="id" value="${vipChange.id}"/>
											<div class="form-group">
												<label class="col-sm-2 control-label">名称：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control"  value="${vipChange.name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">天数：</label>
												<div class="col-sm-5">
													<input type="text" name="days" class="form-control"  value="${vipChange.days}">
												</div>
											</div>																				
											<div class="form-group">
												<label class="col-sm-2 control-label">价格：</label>
												<div class="col-sm-5">
													<input type="text" name="price" class="form-control" value="${vipChange.change_rmb}">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"<c:if test="${vipChange.is_online==1}"> checked="checked"</c:if> /> <label for="inlineRadio1">&nbsp;正常</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online" <c:if test="${vipChange.is_online==0}"> checked="checked"</c:if>/> <label for="inlineRadio2">&nbsp;禁用</label>
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
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/viproom/vipchangelist";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {maxlength:30},				
				price: {required:true, digits:true},
				days:{required:true,digits:true}
			},
			messages: {
				name: {maxlength:"名称长度不能大于30个字"},
				price: {required:"所填价格不能为空", digits:"所填价格只能是正整数"},
				days:{required:"所填天数不能为空",digits:"所填天数只能是正整数"}
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