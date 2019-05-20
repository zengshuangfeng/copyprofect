<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>举报用户列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>举报用户列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&nickname=${nickname}&uid=${uid}&o_uid=${o_uid}&o_nickname=${o_nickname}&islook=${islook}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">
										<form id="reportselect" action="${BASE_PATH}/userreport/list" autocomplete="off"
											method="get" >
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:13%">
													<div class="form-group">
														<label class="control-label">用户昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">举报人UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${o_uid>0?o_uid:''}" name="o_uid">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:13%">
													<div class="form-group">
														<label class="control-label">举报人昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${o_nickname}" name="o_nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">处理结果</label> <select
															name="islook" class="form-control"
															onchange="$('#reportselect').submit()">
															<option value="-1">全部</option>
															<option value="0"<c:if test="${islook==0}"> selected="selected"</c:if>>等待处理</option>
															<option value="1"<c:if test="${islook==1}"> selected="selected"</c:if>>已禁言</option>
															<option value="2"<c:if test="${islook==2}"> selected="selected"</c:if>>已忽略</option>
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
																<th class="text-center">被举报人信息</th>
																<th class="text-center">对话信息</th>
																<th class="text-center">举报时间</th>
																<th class="text-center">举报人信息</th>
																<th class="text-center">处理结果</th>
																<th class="text-center">全局状态</th>
																<th class="text-center">处理人</th>
																<th class="text-center">处理时间</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${reportList}" var="report">
																<tr class="text-center">
																	<td>被举报人昵称：${report.nickname}<br/>
																	UID：<a href="${BASE_PATH}/userinfo/detail?id=${report.uid}">${report.uid}</a></td>
																	<td></td>
																	<td>${report.create_time}</td>
																	<td>举报人昵称：${report.o_nickname}<br/>
																	举报人UID：<a href="${BASE_PATH}/userinfo/detail?id=${report.o_uid}">${report.o_uid}</a></td>
																	<td>
																		<c:choose>
																			<c:when test="${report.islook==0}">等待处理</c:when>
																			<c:when test="${report.islook==1}">已禁言</c:when>
																			<c:when test="${report.islook==2}">已忽略</c:when>
																		</c:choose>
																	</td>
																	<td>
																	 <c:choose>
																			<c:when test="${report.is_forbid==1}">禁言中</c:when>
																			<c:otherwise>-</c:otherwise>
																		</c:choose>
																	</td>
																	<td>${report.w_name}</td>
																	<td>${report.update_time}</td>
																	<td>
																		<c:if test="${report.islook==0}">
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:forbidUser(${report.id}, ${report.uid},'${report.nickname}')">禁言</a>
																		<a href="javascript:ignoreUser(${report.id})" class="btn btn-xs btn-outline btn-success">忽略</a>
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
						<h3 class="m-t-none m-b">设置禁言</h3>
						<form id="forbid" action="${BASE_PATH}/userreport/forbiduser" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">用户：</label>
								<div class="col-sm-6">
									<input type="hidden" name="uid"/>
									<input type="hidden" name="id"/>
									<label class="control-label" id="info"></label>
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
<div id="ignore-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">忽略举报</h3>
						<form id="ignore" action="${BASE_PATH}/userreport/updateislook" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">&nbsp;</label>
								<div class="col-sm-6">
									<input type="hidden" name="id"/>
									<input type="hidden" name="islook" value="2"/>
									<label class="control-label">忽略该举报信息？</label>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#forbid").validate({
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
		$("#ignore").validate({
			submitHandler: function(){
		        ajaxSubmit($("#ignore"), function(json){
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
	function forbidUser(id, uid, nickname)
	{
		$("#forbid").find("input[name=id]").val(id);
		$("#forbid").find("input[name=uid]").val(uid);
		$("#info").text(nickname+"（UID："+uid+"）");
		$("#forbid-modal-form").modal('show');
	}
	function ignoreUser(id)
	{
		$("#ignore").find("input[name=id]").val(id);
		$("#ignore-modal-form").modal('show');
	}
</script>