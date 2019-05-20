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
				<h2>消息推送列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>消息推送列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&status=${status}&title=${title}&s_time=${s_time}&e_time=${e_time}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/userpush/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">										
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${s_time}" name="s_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${e_time}" name="e_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width: 155px">
													<div class="form-group">
														<label class="control-label">平台</label> <select
															name="platform" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="">全部</option>
															<option value="00"
																<c:if test="${platform=='00'}"> selected="selected"</c:if>>全平台</option>
															<option value="10"
																<c:if test="${platform=='10'}"> selected="selected"</c:if>>IOS</option>
															<option value="20"
																<c:if test="${platform=='20'}"> selected="selected"</c:if>>安卓</option>
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
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/userpush/add" class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加</button>
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
																<th class="text-left footable-first-column">推送ID</th>
																<th class="text-center">推送标题</th>
																<th class="text-center">路由</th>
																<th class="text-center">接收人</th>
																<th class="text-center">平台</th>
																<th class="text-center">版本</th>
																<th class="text-center">末次推送时间</th>															
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${user_PushList}" var="userpush">
																<tr class="text-center">
																	<td class="text-left footable-first-column">${userpush.id}</td>
																	<td>${userpush.title}</td>
																	<td>
																	<c:if test="${userpush.jumpname !=null}">${userpush.jumpname}</c:if>
																	<c:if test="${userpush.jumpname ==null}">链接</c:if>												
																	</td>
																	<td>
																	<c:if test="${userpush.p_range==0}">指定</c:if>
																	<c:if test="${userpush.p_range==1}">全部</c:if>
																	</td>
																	<td>
																	<c:if test="${userpush.platform=='00'}">全平台</c:if>
																	<c:if test="${userpush.platform=='10'}">IOS</c:if>
																	<c:if test="${userpush.platform=='20'}">安卓</c:if>
																	</td>
																	<td>
																	${userpush.version}
																	</td>
																	<td><div>起：${userpush.start_time}</div>
																		<div>止：${userpush.end_time}</div></td>
																	
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/userpush/edit?id=${userpush.id}">编辑</a>
																		<a
																		class="btn btn-xs btn-outline btn-primary"
																		href="javascript:RepushUserPush(${userpush.id})">重新推送</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteUserPush(${userpush.id})">删除</a>
																		
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function deleteUserPush(id) {
		deleteConfirm(id, "${BASE_PATH}/userpush/delete", "该信息");
	}
	function RepushUserPush(id){
		swal({ 
			  title: "", 
			  text: "确认重新推送?", 
			  type: "warning",
			  showCancelButton: true, 
			  confirmButtonColor: "green",
			  confirmButtonText: "确定", 
			  cancelButtonText: "取消",
			  closeOnConfirm: false, 
			  closeOnCancel: false	
			},
			function(isConfirm){ 
				if(isConfirm){
				$.ajax({
					type : "POST",
					url : "${BASE_PATH}/userpush/repush",
					data : {
						id : id,				
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
	}
</script>