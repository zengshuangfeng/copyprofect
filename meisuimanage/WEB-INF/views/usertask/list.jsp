<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>每日任务列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>每日任务列表</strong></li>
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
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label> <a
														href="${BASE_PATH}/usertask/add"
														class="input-group">
														<button type="button" class="btn btn-w-m btn-primary">添加</button>
													</a>
												</div>
											</div>
										</div>
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
																<th class="text-center footable-first-column">ID</th>
																<th class="text-center">任务标题</th>
																<th class="text-center">任务事件</th>
																<th class="text-center">需完成次数</th>
																<th class="text-center">图标</th>
																<th class="text-center">完成奖励钻石</th>
																<th class="text-center">排序</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">生效时间</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userTaskList}" var="userTask">
																<tr class="text-center">
																	<td class="footable-first-column">${userTask.id}</td>
																	<td>${userTask.name}</td>
																	<td>
																		<c:choose>
																			<c:when test="${userTask.type==1}">分享主播</c:when>
																			<c:when test="${userTask.type==2}">游戏获胜</c:when>
																			<c:when test="${userTask.type==3}">打赏主播</c:when>
																		</c:choose>
																	</td>
																	<td>${userTask.num}</td>
																	<td class="col-xs-1">
																		<c:choose><c:when test="${not empty userTask.icon}">
                                   			 							<img class="col-xs-12" src="${uploadUrl}${userTask.icon}">
                                   			 							</c:when>
                                   			 							<c:otherwise><img class="col-xs-12" src="${ctx}/img/default.jpg"  /></c:otherwise>
                                   			 							</c:choose>
                           											</td>						
																	<td>${userTask.reward_count}</td>	
																	<td>${userTask.sort}</td>																
																	<td>${userTask.w_name}</td>																	
																	<td>${userTask.create_time}</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/usertask/edit?id=${userTask.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteTask(${userTask.id})">删除</a>
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
<script type="text/javascript">
	function deleteTask(id) {
		deleteConfirm(id, "${BASE_PATH}/usertask/delete", "该任务，此操作不可撤销");
	}
</script>