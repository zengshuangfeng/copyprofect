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
				<h2>邀请设置编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物管理</a></li>
					<li><strong><a href="${BASE_PATH}/anchorinvite/list">邀请设置列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/anchorinvite/save"
											method="post">											
											<div class="form-group">
												<input type="hidden" name="id" value="${anchorInviteConfig.id}"/>
												<label class="col-sm-2 control-label">主播UID：</label>
												<div class="col-sm-5">
													<input type="text" name="uid" class="form-control" value="${anchorInviteConfig.uid}">
												</div>
											</div>												
											<div class="form-group">
												<label class="col-sm-2 control-label">主播昵称：</label>
												<div class="col-sm-5">
													<input type="text" name="nickname" class="form-control" readonly="readonly" value="${anchorInviteConfig.nickname}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">随机最低钻石数：</label>
												<div class="col-sm-5">
													<input type="text" name="min_reward" class="form-control" value="${anchorInviteConfig.min_reward}">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">随机最高钻石数：</label>
												<div class="col-sm-5">
													<input type="text" name="max_reward" class="form-control" value="${anchorInviteConfig.max_reward}">
												</div>
											</div>												
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"<c:if test="${anchorInviteConfig.is_online==1}"> checked="checked"</c:if>/> <label for="inlineRadio1">&nbsp;开启</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online"<c:if test="${anchorInviteConfig.is_online==0}"> checked="checked"</c:if>/> <label for="inlineRadio2">&nbsp;关闭</label>
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
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/anchorinvite/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				uid: {required:true},
				max_reward: {required:true,digits:true},
				min_reward: {required:true,digits:true}
			},
			messages: {
				uid: {required:"主播UID不能为空"},
				max_reward: {required:"随机最高钻石数不能为空", digits:"随机最高钻石数只能是正整数"},
				min_reward: {required:"随机最低钻石数不能为空", digits:"随机最低钻石数只能是正整数"}
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
		$("input[name=uid]").blur(function(){
			$.get("${BASE_PATH}/anchorinvite/getexist",{uid:$(this).val()},function(json){
			    $("input[name=uid]").next("label").remove();
				if(json.code>0)
				{
					$("input[name=uid]").addClass("error");
				    $("input[name=uid]").after("<label class=\"error\">不能重复设置</label>");
				    $("#tab .ladda-button").attr("disabled","disabled");
				}
				else if(json.code==-1)
				{
					$("input[name=uid]").addClass("error");
				    $("input[name=uid]").after("<label class=\"error\">主播不存在</label>");
				    $("#tab .ladda-button").attr("disabled","disabled");
				}
				else
				{
					$("input[name=uid]").removeClass("error");
				    $("input[name=uid]").next("label").remove();
				    $("#tab .ladda-button").removeAttr("disabled");
				}
				$("input[name=nickname]").val(json.nickname);
			});	
		});
	});
</script>
   