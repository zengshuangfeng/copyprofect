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
				<h2>充值活动添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石</a></li>
					<li><strong><a href="${BASE_PATH}/changeactivity/list">充值活动</a></strong>
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
										<form id="tab" action="${BASE_PATH}/changeactivity/save"
											method="post">		
											<div class="form-group">
												<label class="col-sm-2 control-label">选择套餐：</label>
												<div class="col-sm-5">
													<select name="change_id" class="form-control">
														<c:forEach items="${changeList}" var="change">
															<option value="${change.id}" data-ref="${change.change_rmb}">${change.virtual_count}钻石</option>
														</c:forEach>
													</select>
												</div>
											</div>			
											<div class="form-group">
												<label class="col-sm-2 control-label">原价：</label>
												<div class="col-sm-5">
													<label class="control-label" id="change_rmb">￥${change_rmb}</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">现价：</label>
												<div class="col-sm-5">
													<input type="text" name="activity_rmb" class="form-control" value="${changeActivity.activity_rmb}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">是否是首充：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="0" name="is_first" checked="checked"/> <label for="inlineRadio1">&nbsp;否</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="1" class="ml15"
															name="is_first"/> <label for="inlineRadio2">&nbsp;是</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">开始时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="开始时间"
														name="start_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">结束时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="结束时间"
														name="end_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>		
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online" checked="checked"/> <label for="inlineRadio3">&nbsp;正常</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online"/> <label for="inlineRadio4">&nbsp;关闭</label>
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
	var jumpUrl = "${BASE_PATH}/changeactivity/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				activity_rmb: {required:true, digits:true},
				start_time: {required:true},
				end_time: {required:true}
			},
			messages: {
				activity_rmb: {required:"现价不能为空", digits:"现价只能是正整数"},
				start_time: {required:"开始时间不能为空"},
				end_time: {required:"结束时间不能为空"}
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
		$("select[name=change_id]").change(function(){
			$("#change_rmb").text("￥"+$(this).find("option:selected").attr("data-ref"));
		});
	});
</script>