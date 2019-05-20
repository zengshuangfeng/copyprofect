<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>归属变更记录</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>归属变更记录</strong></li>
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
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group"><div style="width:700px"></div>
															<span class="input-group-btn"  >
															<a id="biaoqian" href="${BASE_PATH}/addressChange/add" class="input-group">
																<button type="button" class="btn btn-w-m btn-primary">新增变更</button>
															</a>
															</span>
														</div>
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
																<th class="text-center">用户房间号</th>
																<th class="text-center">用户昵称</th>
																<th class="text-center">原所属运营中心</th>
																<th class="text-center">现所属运营中心</th>
																<th class="text-center">所属代理</th>
																<th class="text-center">推广员房间号</th>
																<th class="text-center">操作人</th>
																<th class="text-center">操作时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${getAlladdressChangeList}" var="addressChangeList">
																<tr class="text-center">
																	<td>${addressChangeList.f_uuid}</td>
																	<td>${addressChangeList.nickname}</td>
																	<td>${addressChangeList.old_center_name}</td>
																	<td>${addressChangeList.new_center_name}</td>
																	<td>${addressChangeList.agentname}</td>
																	<td>${addressChangeList.agentfuuid}</td>
																	<td>${addressChangeList.create_name}</td>
																	<td>${addressChangeList.create_time}</td>
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