<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>粉丝列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li><strong><a href="${BASE_PATH}/useranchor/list">主播列表</a></strong>
					</li>
					<li class="active"><strong>粉丝列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#">粉丝列表</a></li>
							<li><a href="${BASE_PATH}/useranchor/topguard/list?attention_uid=${attention_uid}&f_uuid=${f_uuid}">守护列表</a></li>
							<li><a href="${BASE_PATH}/useranchor/useradmin/list?attention_uid=${attention_uid}&f_uuid=${f_uuid}">房管列表</a></li>
							<li><a href="${BASE_PATH}/useranchor/userforbid/list?attention_uid=${attention_uid}&f_uuid=${f_uuid}">禁言列表</a></li>							
						</ul>
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
																<th class="text-center">UID</th>
																<th class="text-center">昵称</th>
																<th class="text-center">关注时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${attentionList}" var="attention">
																<tr class="text-center">
																	<td>${attention.uid}</td>
																	<td>${attention.nickname}</td>
																	<td>${attention.create_time}</td>
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