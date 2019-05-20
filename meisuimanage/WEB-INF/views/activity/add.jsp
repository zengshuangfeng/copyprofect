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
				<h2>首页活动添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/activity/list">广场首页活动列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/activity/save"
											method="post">											
											<div class="form-group">
												<label class="col-sm-2 control-label">活动名称：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">链接：</label>
												<div class="col-sm-5">
													<input type="text" name="url" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">上线时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="上线时间"
														name="start_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">下线时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="下线时间"
														name="end_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>												
											<div class="form-group">
												<label class="col-sm-2 control-label">平台：</label>
												<div class="col-sm-5">
													<label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="10">&nbsp;&nbsp;&nbsp;iOS
													</label> <label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="20">&nbsp;&nbsp;&nbsp;安卓
													</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"
															checked="checked" /> <label for="inlineRadio1">&nbsp;上线</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online" /> <label for="inlineRadio2">&nbsp;下线</label>
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
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/activity/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {required:true,maxlength:100},
				url: {required:true,maxlength:200},
				start_time: {required:true},
				end_time: {required:true}
			},
			messages: {
				name: {required:"活动名称不能为空",maxlength:"活动名称长度不能大于100个字"},
				url: {required:"链接不能为空",maxlength:"链接长度不能大于200个字"},
				start_time: {required:"上线时间不能为空"},
				end_time: {required:"下线时间不能为空"}
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
   