<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>充值活动</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石</a></li>
					<li class="active"><strong>充值活动</strong></li>
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
														href="${BASE_PATH}/changeactivity/add" class="input-group">
														<button type="button" class="btn btn-w-m btn-primary">添加活动</button>
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
																<th class="text-left footable-first-column">ID</th>
																<th class="text-center">充值钻石数</th>
																<th class="text-center">活动价（元）</th>
																<th class="text-center">原价（元）</th>
																<th class="text-center">是否为首充</th>
																<th class="text-center">状态</th>
																<th class="text-center">开始时间</th>
																<th class="text-center">结束时间</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">编辑时间</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${changeActivityList}" var="changeActivity">
																<tr class="text-center">
																	<td class="text-left footable-first-column">${changeActivity.id}</td>
                           											<td>${changeActivity.virtual_count}</td>
                           											<td>${changeActivity.activity_rmb}</td>	
                           											<td>${changeActivity.change_rmb}</td>	
                           											<td>${changeActivity.is_first==1?'是':'否'}</td>
                           											<td>
                           											<c:choose>
                           											<c:when test="${changeActivity.is_online==0}">
																		<span class="label label-danger">关闭</span>
																	</c:when> <c:when test="${changeActivity.is_online==1}">
																		<span class="label label-primary">正常</span>
																	</c:when>
																	</c:choose>
																	</td>		
                           											<td>${changeActivity.start_time}</td>
                           											<td>${changeActivity.end_time}</td>																
																	<td>${changeActivity.w_name}</td>																	
																	<td>${changeActivity.update_time}</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/changeactivity/edit?id=${changeActivity.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteActivity(${changeActivity.id})">删除</a>
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
	function deleteActivity(id) {
		deleteConfirm(id, "${BASE_PATH}/changeactivity/delete", "该信息");
	}
</script>