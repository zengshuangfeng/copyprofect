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
				<h2>中奖人员列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><a href="${BASE_PATH}/dial/list">转盘抽奖列表</a>
					<li class="active"><strong>中奖人员列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/dial/dialuser" autocomplete="off"
											method="get" id="search">
											<div class="col-sm-1">
												<div class="form-group">
													<label class="control-label">房间号</label>
													<div class="input-group">
														<input type="text" class="form-control"
															value="${f_uuid>0?f_uuid:''}" name="f_uuid">
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

																<th class="text-center">中奖人员房间号</th>
																<th class="text-center">中奖人员昵称</th>
																<th class="text-center">奖品类型</th>
																<th class="text-center">奖品ID</th>
																<th class="text-center">中奖时间</th>

															</tr>
														</thead>
														<tbody>
															<c:forEach items="${dialuserlist}" var="dialuserlist">
																<tr class="text-center">
																	<td>${dialuserlist.f_uuid }</td>
																	<td>${dialuserlist.nickname }</td>
																	<td><c:if test="${dialuserlist.type==0 }">礼物</c:if>
																		<c:if test="${dialuserlist.type==1 }">钻石</c:if> <c:if
																			test="${dialuserlist.type==2 }">积分</c:if></td>
																	<td>${dialuserlist.prize_id}</td>
																	<td><fmt:formatDate value="${dialuserlist.create_time }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
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