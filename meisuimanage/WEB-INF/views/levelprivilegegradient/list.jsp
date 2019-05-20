<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>特权梯度</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li><strong><a href="${BASE_PATH}/levelprivilege/list">特权管理</a></strong>
					</li>
					<li class="active"><strong>特权梯度</strong></li>
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
													<label class="control-label" for="status">&nbsp</label> <a
														href="${BASE_PATH}/levelprivilege/gradient/add?p_id=${p_id}" class="input-group">
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
																<th class="text-center">解锁等级</th>
																<th class="text-center">特权名称</th>
																<th class="text-center">特权参数</th>
																<th class="text-center">状态</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">更新时间</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${levelPrivilegeGradientList}" var="levelPrivilegeGradient">
																<tr class="text-center">
																	<td>${levelPrivilegeGradient.level}</td>
																	<td>${levelPrivilegeGradient.name}</td>		
                           											<td>${levelPrivilegeGradient.virtual_count}</td>
                           											<td>
                           											<c:choose>
                           											<c:when test="${levelPrivilegeGradient.is_online==0}">
																		<span class="label label-danger">关闭</span>
																	</c:when> <c:when test="${levelPrivilegeGradient.is_online==1}">
																		<span class="label label-primary">正常</span>
																	</c:when>
																	</c:choose>
																	</td>																		
																	<td>${levelPrivilegeGradient.w_name}</td>																	
																	<td>${levelPrivilegeGradient.update_time}</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/levelprivilege/gradient/edit?id=${levelPrivilegeGradient.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteGradient(${levelPrivilegeGradient.id})">删除</a>
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
	function deleteGradient(id) {
		deleteConfirm(id, "${BASE_PATH}/levelprivilege/gradient/delete", "该信息");
	}
</script>