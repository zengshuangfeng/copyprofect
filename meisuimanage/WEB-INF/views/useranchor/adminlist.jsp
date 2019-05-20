<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>房管设置</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li><strong><a href="${BASE_PATH}/useranchor/list">主播列表</a></strong>
					</li>
					<li class="active"><strong>房管设置</strong></li>
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
																<th class="text-center">昵称</th>
																<th class="text-center">房管类型</th>																										
																<th class="text-center footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${user_AdminList}" var="user_Admin">
																<tr class="text-center">
																	<td>${user_Admin.uid}</td>		
																	<td>${user_Admin.f_uuid}</td>
																	<td>${user_Admin.nickname}</td>
																	<td>场控</td>																		
																	<td>
																	<a href="javascript:deleteAdmin(${user_Admin.id},${user_Admin.uid})" class="btn btn-xs btn-outline btn-danger">撤销</a>
																	</td>																
																</tr>
															</c:forEach>
															<c:forEach items="${user_ControlList}" var="user_Control">
																<tr class="text-center">
																	<td>${user_Control.uid}</td>		
																	<td>${user_Control.f_uuid}</td>
																	<td>${user_Control.nickname}</td>
																	<td>房管</td>																		
																	<td>
																	<a href="javascript:deleteControl(${user_Control.id},${user_Control.uid})" class="btn btn-xs btn-outline btn-danger">撤销</a>
																	</td>																
																</tr>
															</c:forEach>
														</tbody>
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

	function deleteAdmin(id, uid) {
		deleteConfirm(0, "${BASE_PATH}/useranchor/deleteadmin", "房管", "撤销", {"id":id,"uid":uid});
	}
	function deleteControl(id, uid) {
		deleteConfirm(0, "${BASE_PATH}/useranchor/deletecontrol", "场控", "撤销", {"id":id,"uid":uid});
	}
</script>