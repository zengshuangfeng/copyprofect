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
				<h2>主播列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>魅力值变更日志</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&uid=${uid}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-12">
												<h3>${nickname}主播魅力值日志</h3>
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
																<th class="text-center">编号</th>
																<th class="text-center">主播UID</th>
																<th class="text-center">变更魅力值</th>
																<th class="text-center">总魅力值</th>
																<th class="text-center">已使用魅力值</th>
																<th class="text-center">可用魅力值</th>
																<th class="text-center">操作时间</th>
																<th class="text-center">操作说明</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${anchorVirtualChangeRecordList}" var="anchorVirtualChangeRecord">
																<tr class="text-center">
																	<td>${anchorVirtualChangeRecord.id}</td>
																	<td>${anchorVirtualChangeRecord.uid}</td>
																	<td>${anchorVirtualChangeRecord.change_virtual}</td>
																	<td>${anchorVirtualChangeRecord.total_anchor_virtual}</td>
																	<td>${anchorVirtualChangeRecord.total_change_virtual}</td>
																	<td>${anchorVirtualChangeRecord.surplus_anchor_virtual}</td>
																	<td><fmt:formatDate value="${anchorVirtualChangeRecord.create_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>${date}</td>
																	<td>${anchorVirtualChangeRecord.remark}</td>
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