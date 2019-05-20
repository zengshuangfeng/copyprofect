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
				<h2>版本更新添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/versionupdate/list">版本更新列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/versionupdate/save"
											method="post">			
											<div class="form-group">
												<label class="col-sm-2 control-label">版本：</label>
												<div class="col-sm-5">
													<input type="text" name="version" class="form-control">
												</div>
												<span class="col-sm-5 help-block m-b-none text-danger" style="color: blue">例如：1.0.2</span>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">文案：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control" name="content"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">下载URL：</label>
												<div class="col-sm-5">
													<input type="text" name="url" class="form-control">
												</div>
											</div>												
											<div class="form-group">
												<label class="col-sm-2 control-label">生效时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control"
														name="effect_time"
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
												<label class="col-sm-2 control-label">是否强制更新：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="0" name="force"
															checked="checked" /> <label for="inlineRadio1">&nbsp;否</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="1" class="ml15"
															name="force" /> <label for="inlineRadio2">&nbsp;是</label>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/versionupdate/list";
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
	$().ready(function() {
		$("#tab").validate({
			rules: {
				version: {required:true,maxlength:100},
				content: {required:true,maxlength:200},
				effect_time: {required:true}
			},
			messages: {
				version: {required:"版本不能为空",maxlength:"版本长度不能大于100个字"},
				content: {required:"文案不能为空",maxlength:"文案长度不能大于200个字"},
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
</script>