<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>转盘抽奖列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>转盘抽奖列表</strong></li>
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
										<div class="row">
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label> <a
														href="${BASE_PATH}/dial/add" class="input-group">
														<button type="button" class="btn btn-w-m btn-primary">新增奖品</button>
													</a>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label> <a
														href="${BASE_PATH}/dial/dialuser" class="input-group">
														<button type="button" class="btn btn-w-m btn-primary">中奖人员列表</button>
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
																<th class="text-center footable-first-column">奖品ID</th>
																<th class="text-centern">奖品名称</th>
																<th class="text-center">奖品类型</th>
																<th class="text-center">奖品数量</th>
																<th class="text-center">总数</th>
																<th class="text-center">单人抽中概率</th>
																<th class="text-center">上线时间</th>
																<th class="text-center">下线时间</th>
																<th class="text-center">上下架状态</th>
																<th class="text-center footable-last-column">编辑</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${dialList}" var="dialList">
																<tr class="text-center">																	
																	<td>${dialList.id}</td>
																	<td class="col-xs-2"><img class="col-xs-4"
																		src="${uploadUrl}${dialList.pic}" />
																		${dialList.prize_name} <c:if
																			test="${dialList.type==1}">钻石</c:if> <c:if
																			test="${dialList.type==2}">积分</c:if></td>
																	<td class="col-xs-1"><c:if
																			test="${dialList.type==0}">礼物</c:if> <c:if
																			test="${dialList.type==1}">钻石</c:if> <c:if
																			test="${dialList.type==2}">积分</c:if></td>
																	<td>${dialList.prize_count}</td>
																	<td>${dialList.inventory}</td>
																	<td><fmt:formatNumber value="${dialList.probability}" pattern="#.########"/></td>
																	<td><fmt:formatDate value="${dialList.start_time}"
																			pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																	<td><fmt:formatDate value="${dialList.end_time}"
																			pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																	<td><c:if test="${dialList.state==0}">
																			<span class="label label-danger">下架</span>
																		</c:if> <c:if test="${dialList.state==1}">
																			<span class="label label-primary">上架</span>
																		</c:if></td>

																	<td class="text-center footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/dial/edit?id=${dialList.id}">编辑</a>
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