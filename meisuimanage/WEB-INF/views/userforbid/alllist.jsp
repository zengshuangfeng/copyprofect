<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>禁言列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>禁言列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&uid=${uid}&f_uuid=${f_uuid}&nickname=${nickname}&status=${status}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">	
								<div class="m-b-sm">										
										<form action="${BASE_PATH}/userforbid/list"
											autocomplete="off" method="get" id="form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户房间号</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:200px">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">状态</label>
														<div class="input-group"> <select
															name="is_forbid" class="form-control"
															onchange="$('form').submit()">
															<option value="-1">所有</option>															
															<option value="1"<c:if test="${is_forbid==1}"> selected="selected"</c:if>>禁言中</option>
															<option value="0"<c:if test="${is_forbid==0}"> selected="selected"</c:if>>可发言</option>
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
															href="#forbid-modal-form" data-toggle="modal" 
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加禁言用户</button>
														</a>
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
																<th class="text-center">用户UID</th>
																<th class="text-center">用户房间号</th>
																<th class="text-center">用户昵称</th>
																<th class="text-center">状态</th>
																<th class="text-center">开始禁言时间</th>
																<th class="text-center">结束禁言时间</th>
																<th class="text-center">处理人</th>
																<th class="text-center">处理时间</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userForbidList}" var="userForbid">
																<tr class="text-center">
																	<td>${userForbid.uid}</td>
																	<td>${userForbid.f_uuid}</td>
																	<td>${userForbid.nickname}</td>
																	<td>${userForbid.status_name}</td>	
																	<td>${userForbid.start_time}</td>
																	<td>${userForbid.end_time}</td>																
																	<td>${userForbid.w_name}</td>																	
																	<td>${userForbid.update_time}</td>
																	<td class="text-right footable-last-column">
																	<c:if test="${userForbid.status_name=='禁言中'}">
																	<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:cancelForbid(${userForbid.uid}, '${userForbid.nickname}')">取消禁言</a>
																	</c:if>
																	</td>
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
<div id="forbid-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<form id="forbid" action="${BASE_PATH}/userforbid/save" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<!-- <div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">用户UID：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="uid">
								</div>
							</div> -->
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">房间号：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="f_uuid">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">当前状态：</label>
								<div class="col-sm-6">
									<label class="control-label" id="current_status"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">禁言类型：</label>
								<div class="col-sm-8">
									<div class="radio radio-info radio-inline">
										<input type="radio" value="1" name="hour"
											checked="checked" /> <label for="inlineRadio1">&nbsp;禁言1小时</label>
									</div>
									<div class="radio radio-inline">
										<input type="radio" value="24" class="ml15" name="hour" />
										<label for="inlineRadio2">&nbsp;禁言24小时</label>
									</div>
									<div class="radio radio-inline">
										<input type="radio" value="0" class="ml15" name="hour" />
										<label for="inlineRadio2">&nbsp;永久禁言</label>
									</div>
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#forbid").validate({
			rules: {
				uid: {required:true,digits:true}
			},
			messages: {
				uid: {required:"用户UID不能为空",digits:"用户UID只能是正整数"},
			},
			submitHandler: function(){
		        ajaxSubmit($("#forbid"), function(json){
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
		$("#forbid input[name=uid]").blur(function(){
			$.ajax({type: "GET",url:"${BASE_PATH}/userforbid/getisforbid",data: {uid:$(this).val()},success:function(data){
				if(data>0)
				{
					$("#forbid input[name=id]").val(data);
					$("#current_status").text("禁言中");
				}
				else
				{
					$("#current_status").text("可发言");
				}
			}});
		});
		$("#forbid input[name=f_uuid]").blur(function(){
			$.ajax({type: "GET",url:"${BASE_PATH}/userforbid/getisforbid",data: {f_uuid:$(this).val()},success:function(data){
				if(data>0)
				{
					$("#current_status").text("禁言中");
				}
				else
				{
					$("#current_status").text("可发言");
				}
			}});
		});
	});
	function cancelForbid(uid, nickname)
	{
		swal({
			title : "取消禁言",
			text : "确认取消对用户"+nickname+"的禁言限制？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#1ab394",
			confirmButtonText : "确认",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({type: "POST",url:"${BASE_PATH}/userforbid/cancel",data: {uid:uid},success:function(data){
					window.location.reload();
				}});
			}
		});	
	}
</script>