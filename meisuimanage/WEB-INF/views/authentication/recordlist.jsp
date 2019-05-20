<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>身份认证审核记录</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>代理管理</a></li>
					<li class="active"><strong>身份认证审核记录</strong></li>
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
												<div class="col-sm-1">
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
																<th class="text-center">失败类型</th>
																<th class="text-center">审核失败原因</th>
																<th class="text-center">审核状态</th>
																<th class="text-center">审核人</th>
																<th class="text-center">审核时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${getAllauditRecordList}" var="auditRecordList">
																<tr class="text-center">
																	<td>${auditRecordList.error_type}</td>
																	<td>${auditRecordList.remark}</td>
																	<td><c:if test="${auditRecordList.is_status==0}">通过</c:if><c:if test="${auditRecordList.is_status==1}">未通过</c:if></td>
																	<td>${auditRecordList.check_name}</td>
																	<td>${auditRecordList.time}</td>
																	<%-- <td>${report.key_count}</td> --%>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
</script>