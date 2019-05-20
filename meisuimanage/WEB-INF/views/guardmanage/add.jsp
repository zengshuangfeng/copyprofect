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
				<h2>添加守护</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li><strong><a href="${BASE_PATH}/guardmanage/list">守护列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/guardmanage/save"
											method="post">											
											<div class="form-group">
												<label class="col-sm-2 control-label">主播房间号：</label>
												<div class="col-sm-2">
													<input type="text" name="anchor_f_uuid" class="form-control" id="anchor_f_uuid">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">守护者UID：</label>
												<div class="col-sm-2">
													<input type="text" name="uid" class="form-control" id="uid">
												</div>
											</div>																						
												<div class="form-group">
												<label class="col-sm-2 control-label">守护类型：</label>
												<div class="col-sm-2">
													<select name="change_id" class="form-control"
														id="change_id">
														<option value="">请选择</option>
														<c:forEach items="${anchorlist}" var="anchorlist">
															<option value="${anchorlist.id}">${anchorlist.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>																				
											<div class="form-group">
												<label class="col-sm-2 control-label">类别：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="need_pay"
															checked="checked" /> <label for="inlineRadio1">&nbsp;用户开通</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="need_pay" /> <label for="inlineRadio2">&nbsp;奖励赠送</label>
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
	var jumpUrl = "${BASE_PATH}/guardmanage/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				anchor_f_uuid: {required:true},
				uid: {required:true},
				change_id: {required:true,min:1}
			},
			messages: {
				anchor_f_uuid: {required:"主播房间号不能为空"},
				uid: {required:"守护者UID不能为空"},
				change_id: {required:"守护套餐不能为空",min:"守护类型值最小为1"}
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
	
	$(function(){	
		$("input[name=anchor_f_uuid]").change(function(){
			$.get("${BASE_PATH}/guardmanage/getfuuidexist",{anchor_f_uuid:$(this).val()},function(json){
			    $("input[name=anchor_f_uuid]").next("label").remove();
			 if(json.code==-1)
				{
					$("input[name=anchor_f_uuid]").next("label").remove();
					$("input[name=anchor_f_uuid]").addClass("error");
				    $("input[name=anchor_f_uuid]").after("<label class=\"error\">主播不存在</label>");
				    $("select[name=change_id]").val("");
				    $("#change_id").next("label").remove();
				    $("#tab .ladda-button").attr("disabled","disabled");
				}
				else
				{
					$("input[name=anchor_f_uuid]").next("label").remove();
					$("input[name=anchor_f_uuid]").removeClass("error");
				    $("input[name=anchor_f_uuid]").next("label").remove();
				    $("select[name=change_id]").val("");
				    $("#change_id").next("label").remove();
				    $("#tab .ladda-button").removeAttr("disabled");
				}			
			});	
		});
	});
	
	$(function(){	
		$("input[name=uid]").change(function(){
			$.get("${BASE_PATH}/guardmanage/getuidexist",{uid:$(this).val()},function(json){
			    $("input[name=uid]").next("label").remove();
			 if(json.code==-1) 
				{
					$("input[name=uid]").next("label").remove();
					$("input[name=uid]").addClass("error");
				    $("input[name=uid]").after("<label class=\"error\">该用户不存在</label>");
				    $("select[name=change_id]").val("");
				    $("#change_id").next("label").remove();
				    $("#tab .ladda-button").attr("disabled","disabled");
				}
				else
				{
					$("input[name=uid]").next("label").remove();
					$("input[name=uid]").removeClass("error");
				    $("input[name=uid]").next("label").remove();
				    $("select[name=change_id]").val("");
				    $("#change_id").next("label").remove();
				    $("#tab .ladda-button").removeAttr("disabled");
				}			
			});	
		});
	});
	
	$(function(){	
		$("#change_id").change(function(){
			$.get("${BASE_PATH}/guardmanage/getchangeid",{change_id:$(this).val(),anchor_f_uuid:$("#anchor_f_uuid").val(),uid:$("#uid").val()},function(json){
			    $("#change_id").next("label").remove();
			 if(json.code==-1) 
				{
					$("#change_id").next("label").remove();
					$("#change_id").addClass("error");
				    $("#change_id").after("<label class=\"error\">所选套餐不符，套餐等级不能往下</label>");
				    $("#tab .ladda-button").attr("disabled","disabled");
				}
				else if(json.code==-2){
					$("#change_id").next("label").remove();
					$("#change_id").addClass("error");
				    $("#change_id").after("<label class=\"error\">请将主播房间号或守护者UID填写完整</label>");
				    $("#tab .ladda-button").attr("disabled","disabled");
				}else{
					$("#change_id").next("label").remove();
					$("#change_id").removeClass("error");
				    $("#change_id").next("label").remove();
				    $("#tab .ladda-button").removeAttr("disabled");
				}			
			});	
		});
	});
</script>
   