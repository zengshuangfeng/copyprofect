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
				<h2>新增变更</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/addressChange/list">归属变更记录</a></strong>
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
											<div class="form-group">
												<label class="col-sm-2 control-label">变更的房间号：</label>
												<div class="col-sm-2">
													<input type="text" name="f_uuid" id="f_uuid" class="form-control" onblur="chekuser()">
												</div>
											</div>	
											
											<div class="form-group">
												<label class="col-sm-2 control-label">用户昵称：</label>
												<div class="col-sm-2">
												<input type="text" name="nickname" readonly="readonly" id="nickname"  class="form-control" >
												</div>
											</div>			
											<div class="form-group">
												<label class="col-sm-2 control-label">原归属运营中心：</label>
												<div class="col-sm-2">
												<input type="text" name="old_center_name"  readonly="readonly" id="old_center_name"  class="form-control">
												</div>
											</div>											
											<div class="form-group">
												<label class="col-sm-2 control-label">变更到推广员房间号：</label>
												<div class="col-sm-2">
													<input type="text" name="agentfuuid" id="agentfuuid" class="form-control" onblur="chekagentuser()">
												</div>
											</div>										
											<div class="form-group">
												<label class="col-sm-2 control-label">归属运营中心：</label>
												<div class="col-sm-2">
													<input type="text" name="new_center_name"  id="new_center_name" readonly="readonly"class="form-control">
												</div>
											</div>										
											<div class="form-group">
												<label class="col-sm-2 control-label">归属代理：</label>
												<div class="col-sm-2">
													<input type="text" name="agentname"  id="agentname" readonly="readonly" class="form-control">
													<input type="hidden" name="agent_id"  id="agent_id"  >
													<input type="hidden" name="operate_center_id"  id="operate_center_id"  >
													<input type="hidden" name="agent_promoter_id"  id="agent_promoter_id"  >
												</div>
											</div>	
											<div class="form-group">
												<div class="col-sm-4 col-sm-offset-2">
												<button  onclick="quxiao()">
														<i class="fa fa-check"></i>&nbsp;取消
													</button>&nbsp;&nbsp;&nbsp;
													<button  disabled="true"  onclick="save()" id="bt1">
														<i class="fa fa-check"></i>&nbsp;保存
													</button>
												</div>
											</div>
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
function chekuser(){
	 $.ajax({
         type: "POST",
         url: "${BASE_PATH}/addressChange/getUserBYFuid",
         data: {fuuid:$("#f_uuid").val()},
         dataType: "json",
         success: function(data){
        	 $("#nickname").val(data.nickname);
        	 $("#old_center_name").val(data.old_center_name);
        	 $("#nickname").removeAttr("style");
          },
         error:function(cool){
        	 $("#nickname").val("此用户不存在");
        	 $("#old_center_name").val("");
        	 var ele=document.getElementById("nickname").style.color="red"; 
         }
     });
}
function chekagentuser(){
	 $.ajax({
         type: "POST",
         url: "${BASE_PATH}/addressChange/getAgentUserBYFuid",
         data: {fuuid:$("#agentfuuid").val()},
         dataType: "json",
         success: function(data){
        	 $("#agentname").val(data.agentname);
        	 $("#new_center_name").val(data.new_center_name);
        	 $("#agent_id").val(data.agent_id);
        	 $("#operate_center_id").val(data.operate_center_id);
        	 $("#agent_promoter_id").val(data.agent_promoter_id);
        	 $("#bt1").attr("disabled",false);
        	 $("#new_center_name").removeAttr("style");
        	 $("#bt1").addClass("ladda-button btn btn-info");
          },
         error:function(cool){
        	 $("#new_center_name").val("推广员不存在");
        	 $("#agentname").val("");
        	 $("#agent_id").val("");
        	 $("#operate_center_id").val("");
        	 $("#agent_promoter_id").val("");
        	 $("#target").removeClass("ladda-button btn btn-info");
        	 var ele=document.getElementById("new_center_name").style.color="red"; 
         }
     });
}
function save(){
	 $.ajax({
         type: "POST",
         url: "${BASE_PATH}/addressChange/saveAddressChange",
         data: {fuuid:$("#f_uuid").val(),nickname:$("#nickname").val(),old_center_name:$("#old_center_name").val(),agentfuuid:$("#agentfuuid").val(),new_center_name:$("#new_center_name").val(),
        	 agentname:$("#agentname").val(),agent_id:$("#agent_id").val(),operate_center_id:$("#operate_center_id").val(),agent_promoter_id:$("#agent_promoter_id").val()},
         dataType:"text",
         success:function(data){
        	 window.location.href="${BASE_PATH}/addressChange/list";
          },
         error:function(data){
        	alert("信息填写错误")
         }
     });
}
function quxiao(){
	window.history.back(-1);
}
</script>