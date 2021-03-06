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
				<h2>邀请有礼编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/invite/list">邀请有礼列表</a></strong>
					</li>
					<li class="active"><strong><a>编辑</a></strong></li>
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
										<form id="tab" action="${BASE_PATH}/invite/save"
											method="post">		
											<input name="id" type="hidden" value="${invite.id}"/>									
											<div class="form-group">
												<label class="col-sm-2 control-label">文案：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control" name="content" style="height:100px">${invite.content}</textarea>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">邀请者获得钻石：</label>
												<div class="col-sm-5">
													<input type="text" name="virtual_count" class="form-control" value="${invite.virtual_count}"/>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">被邀请者获得钻石：</label>
												<div class="col-sm-5">
													<input type="text" name="to_virtual_count" class="form-control" value="${invite.to_virtual_count}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">生效时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="生效时间"
														name="effect_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" value="${invite.effect_time}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"
															<c:if test="${invite.is_online==1}"> checked="checked"</c:if> /> <label for="inlineRadio1">&nbsp;正常</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online" <c:if test="${invite.is_online==0}"> checked="checked"</c:if>/> <label for="inlineRadio2">&nbsp;禁用</label>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/invite/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				content: {required:true,maxlength:200},
				virtual_count: {required:true, digits:true},
				to_virtual_count: {required:true, digits:true},
				effect_time: {required:true}
			},
			messages: {
				content: {required:"文案不能为空",maxlength:"文案长度不能大于200个字"},
				virtual_count: {required:"邀请者获得钻石不能为空", digits:"邀请者获得钻石只能是正整数"},
				to_virtual_count: {required:"被邀请者获得钻石不能为空", digits:"被邀请者获得钻石只能是正整数"},
				effect_time: {required:"生效时间不能为空"}
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
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
	});
</script>
   