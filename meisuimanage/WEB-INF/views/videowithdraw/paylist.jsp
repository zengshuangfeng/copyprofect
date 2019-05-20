<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>待支付列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>提现管理</a></li>
					<li class="active"><strong>待支付列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&nickname=${nickname}&o_id=${o_id}&status=${status}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/withdrawpay/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">订单号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${o_id}" name="o_id">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="level">状态</label> <select
															name="status" id="status" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${status==1}"> selected="selected"</c:if>>待支付</option>
															<option value="2"<c:if test="${status==2}"> selected="selected"</c:if>>已完成</option>
															<option value="3"<c:if test="${status==3}"> selected="selected"</c:if>>已拒绝</option>
														</select>
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
																<th class="text-center">订单号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">账号状态</th>
																<th class="text-center">提现渠道</th>
																<th class="text-center">支付账号</th>
																<th class="text-center">申请金额</th>
																<th class="text-center">订单状态</th>
																<th class="text-center">申请时间</th>
																<th class="text-center">审核时间</th>
																<th class="text-center">操作</th>
																<th class="text-center">原因</th>
																<th class="text-center">审核操作人</th>
																<th class="text-center">支付操作人</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${videoWithdrawList}" var="videoWithdraw">
																<tr class="text-center">
																	<td>${videoWithdraw.o_id}</td>
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${videoWithdraw.uid}">${videoWithdraw.nickname}</a></td>
																	<td>
																	<span class="label ${videoWithdraw.user_is_blocked==1?'label-danger':'label-primary'}">${videoWithdraw.user_is_blocked==1?'封号':'正常'}</span>
																	</td>
																	<td>${videoWithdraw.withdraw_type==0?'支付宝':'微信'}</td>	
																	<td>${videoWithdraw.withdraw_pass}</td>	
																	<td>${videoWithdraw.withdraw_money}</td>	
																	<td><c:choose>
																			<c:when test="${videoWithdraw.status==0}">待审核</c:when>
																			<c:when test="${videoWithdraw.status==1}">待支付</c:when>
																			<c:when test="${videoWithdraw.status==2}">已完成</c:when>
																			<c:when test="${videoWithdraw.status==3}">已拒绝</c:when>
																			</c:choose>
																	</td>										
																	<td>${videoWithdraw.create_time}</td>									
																	<td>${videoWithdraw.audit_time}</td>		
																	<td>
																		<c:choose>
																			<c:when test="${videoWithdraw.status==1}">
																				<a
																				href="javascript:pay(${videoWithdraw.id},2,'支付')"
																				class="btn btn-xs btn-outline btn-primary">支付</a>
																				<a
																				href="javascript:refuse(${videoWithdraw.id})"
																				class="btn btn-xs btn-outline btn-primary">拒绝</a>
																			</c:when>
																			<c:when test="${videoWithdraw.status==1}">
																			<span class="label label-primary">已通过 </span>
																			</c:when>
																			<c:when test="${videoWithdraw.status==3}">
																			<span class="label label-danger">已拒绝 </span>
																			</c:when>
																			</c:choose>
																	</td>								
																	<td>${videoWithdraw.remark}</td>									
																	<td>${videoWithdraw.audit_w_name}</td>									
																	<td>${videoWithdraw.pay_w_name}</td>												
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
<div id="refuse-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">拒绝原因</h3>
						<form id="refuse" action="${BASE_PATH}/withdrawapply/audit" method="post">
							<input type="hidden" name="id" />
							<input type="hidden" name="status" value="3"/>
							<input type="hidden" name="is_from" value="1"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">&nbsp;</label>
								<div class="col-sm-9">
									<div class="radio radio-inline">
										<input type="radio" value="1" class="ml15" name="is_need" checked="checked" />
										<label for="inlineRadio2">&nbsp;需要原因</label>
									</div>
									<div class="radio radio-info radio-inline">
										<input type="radio" value="0" name="is_need" /> <label for="inlineRadio1">&nbsp;不需要原因</label>
									</div>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">原因：</label>
								<div class="col-sm-9">
									<textarea rows="3" class="form-control" name="remark"></textarea>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#refuse").validate({
			rules: {
				remark: {required:true,maxlength:200}
			},
			messages: {
				remark: {required:"原因不能为空",maxlength:"原因长度不能大于200个字"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#refuse"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
		        		window.location.reload();
		        });
	        	return false;
	    	}
		});
	});	
	function pay(id, status, title)
	{
		swal({
			title : "",
			text : "确定要"+title+"该申请？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({type: "POST",url:"${BASE_PATH}/withdrawpay/pay",data:{id:id,status:status},success:function(){
						window.location.reload(true);	
				}});

			}
		});
	}
	function refuse(id) {
		$("#refuse-modal-form").modal('show');
		$("#refuse-modal-form").find("input[name=id]").val(id);
	}
</script>