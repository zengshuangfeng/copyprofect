<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>举报主播列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>举报主播列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&nickname=${nickname}&uid=${uid}&f_uuid=${f_uuid}&o_uid=${o_uid}&o_nickname=${o_nickname}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">
										<form action="${BASE_PATH}/anchorreport/list" autocomplete="off"
											method="get" >
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:13%">
													<div class="form-group">
														<label class="control-label">主播昵称</label>
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
																<th class="text-center">主播UID</th>
																<th class="text-center">主播房间号</th>
																<th class="text-center">主播昵称</th>
																<th class="text-center">举报人UID</th>
																<th class="text-center">举报人</th>
																<th class="text-center">举报时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${reportList}" var="report">
																<tr class="text-center">
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${report.uid}">${report.uid}</a></td>
																	<td>${report.f_uuid}</td>
																	<td>${report.nickname}</td>
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${report.o_uid}">${report.o_uid}</a></td>
																	<td>${report.o_nickname}</td>
																	<td>${report.create_time}</td>
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