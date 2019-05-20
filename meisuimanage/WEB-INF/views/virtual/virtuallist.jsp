<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<style type="text/css">
.actiondiv{display:none;position: absolute;background-color: #fff;z-index: 10;border: 1px solid #e7eaec;padding: 10px 20px 20px 20px;right: 0px;}
</style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>会员列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>会员管理</a></li>
					<li class="active"><strong>会员列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&nickname=${nickname}&f_uuid=${f_uuid}&uid=${uid }&operate_center_id=${operate_center_id}&agent_id=${agent_id}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/virtual/virtuallist" autocomplete="off"
											method="get" id="search_form">
											<div class="row">											
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>										
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">用户房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>			
												<div class="col-sm-2" style="width: 150px">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
														<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择运营中心</label>
														<div class="input-group">
															<select name="operate_center_id"class="form-control">
																<option value="0">请选择运营中心</option>
																<c:forEach items="${operateCenterList}" var="operateCenter">
																	<option value="${operateCenter.id}"<c:if test="${operateCenter.id==operate_center_id}"> selected="selected"</c:if>>${operateCenter.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>	
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择代理</label>
														<div class="input-group">
															<select name="agent_id"class="form-control">
																<option value="0">请选择代理</option>
																<c:forEach items="${agentList}" var="agent">
																	<option value="${agent.id}"<c:if test="${agent.id==agent_id}"> selected="selected"</c:if>>${agent.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<button type="submit" class="btn btn-primary">搜索</button>
															</span>
														</div>
													</div>
												</div>
												
													<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="javascript:AddVirtual()"
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加会员</button>
														</a>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/virtual/uservirtualrecord"
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">会员添加日志</button>
														</a>
													</div>
												</div>
												
												<br/>
												<br/>								
											</div>
										</form>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
															
																<th class="text-center">用户UID</th>
																<th class="text-center">用户房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">所属运营中心</th>	
																<th class="text-center">所属代理</th>
																<th class="text-center">是否为推广员</th>																				
																<th class="text-center">钻石余额</th>																																			
																<th class="text-center">是否关闭会员</th>																														
																
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${list}" var="user">
																<tr class="text-center">
																	<td>${user.id}</td>																	
																	<td>${user.f_uuid}</td>
																	<td><a
																		href="${BASE_PATH}/userinfo/detail?id=${user.id}">${user.nickname}</a></td>
																	
																	
																	 <td>${user.operateName }</td>
																	 <td>${user.agentName }</td>
																 	 <td>
																 	 <c:if test="${user.is_promote==1}">是</c:if>
																	<c:if test="${user.is_promote==0}">否</c:if>
																 	 </td>
																	<td>
																	<input type="hidden" class="balancevirtual" id="balancevirtual${user.id}" value="${user.balance_virtual}">
																	${user.balance_virtual}</td>																																
																		<td>																		
																		<c:choose>
																			<c:when test="${user.is_virtual==0}">
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" class="onoffswitch-checkbox2"
																						id="examples${user.id}" value="${user.id}">
																					<label class="onoffswitch-label"
																						for="examples${user.id}"> <span
																						class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>

																			</c:when>
																			<c:otherwise>
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" checked
																						class="onoffswitch-checkbox" 
																						id="examples${user.id}" value="${user.id}">
																					<label class="onoffswitch-label"
																						for="examples${user.id}"> <span
																						class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose></td>																
																</tr>
															</c:forEach>
														</tbody>
														<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="rewardkey-modal-form2" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">添加会员</h3>
						<form id="reward3" action="${BASE_PATH}/virtual/addvirtual" method="post">							
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">房间号：</label>
								<div class="col-sm-9">
									<input type="text" name="f_uuid" class="form-control">
								</div>
							</div>
							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									data-dismiss="modal">取消</button>
							</div>
							<div class="col-sm-2">
								<button class="btn btn-primary pull-right" type="submit">
									<strong>确定</strong>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$('.i-checks').iCheck({
			checkboxClass : 'icheckbox_square-green',
			radioClass : 'iradio_square-green',
		});

		 $(".onoffswitch-checkbox").click(function() {
				var checked = $(this).prop("checked");
				var id = $(this).val();
				var balanceid="balancevirtual"+id;
				var balance_virtual=$("#"+balanceid).val();
				if(balance_virtual<100){
					swal({
						title : "设置会员账号",
						text : checked ? "是否确定设为会员？" : "是否确定取消会员？",
						type : "warning",
						showCancelButton : true,
						confirmButtonColor : "#1ab394",
						confirmButtonText : "确认",
						cancelButtonText : "取消",
						closeOnConfirm : true,
						closeOnCancel : true
					}, function(isConfirm) {
						if (isConfirm) {
							$.ajax({
								type : "POST",
								url : "${BASE_PATH}/virtual/updateisvirtual",
								data : {
									id : id,
									is_virtual : checked ? 1 : 0
								},
								success : function(data) {
									if (data > 0) {
										window.location.reload();
									}
								}
							});
						}else{
							window.location.reload();
						}
					});
				}else if(balance_virtual>100){
					swal({ 
						  title: "", 
						  text: "钻石余额＞100无法取消", 
						  type: "warning",
						  showCancelButton: true, 
						  confirmButtonColor: "#DD6B55",
						  confirmButtonText: "确定", 
						  cancelButtonText: "取消",
						  closeOnConfirm: false, 
						  closeOnCancel: false	
						},
						function(isConfirm){ 				
							  window.location.reload();						
						});
				
				}
					
			}); 
		
		$("#reward3").validate({
			rules : {
				f_uuid : {
					required : true,
					number:true
				}
			},
			messages : {
				f_uuid : {
					required : "房间号不能为空",
					number : "房间号只能是整数"
				}
			},
			submitHandler : function() {
				ajaxSubmit($("#reward3"),
					function(json) {
						if (json.code == -3) {
							for (var key in json.msg) {
								$("#reward3 input[name="+ json.msg[key].name + "]").addClass("error");
								$("#reward3 input[name="+ json.msg[key].name + "]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+ json.msg[key].value+ "</label>");
							}
						} else
							window.location.reload();
					});
				return false;
			}
		});

	});

	function balanceVirtualAdd(uid, balance_virtual) {
		$("#rewardkey-modal-form").modal('show');
		$("#rewardkey-modal-form").find("input[name=id]").val(uid);
		$("#rewardkey-modal-form").find("#balance_virtual").text(balance_virtual);
	}
	function AddVirtual() {
		$("#rewardkey-modal-form2").modal('show');
	}

	
	$(function(){
		$("select[name=operate_center_id]").change(function(){
			var centerId = $(this).val();
			$.ajax({
				url:"${BASE_PATH}/virtual/agentlist",
				data:{centerId:centerId},
				success:function(data){
					var agentId = ${agent_id};
					var optionStr = '<option value="0">请选择代理</option>';
					for(var key in data.list){
						optionStr += '<option value="'+data.list[key].id+'">'+data.list[key].name+'</option>';
					}
					$("select[name=agent_id]").html(optionStr);
				}
			})
		});
	});
</script>