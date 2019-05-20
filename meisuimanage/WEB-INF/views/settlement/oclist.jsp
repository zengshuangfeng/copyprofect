<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>运营中心已结算</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>结算管理</a></li>
					<li class="active"><strong>运营中心已结算</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&s_time=${s_time}&e_time=${e_time}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/settlement/oclist" autocomplete="off" method="get" id="search_form">
											<div class="row">
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${s_time}" name="s_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${e_time}" name="e_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:150px">
													<div class="form-group">
														<label class="control-label" for="for_type">选中运营中心</label>
															<select class="form-control" name="centerId" onchange="$('#search_form').submit()">
																<option value="0">全部</option>
																<c:forEach var="center" items="${centerList }">
																	<option value="${center.id }" <c:if test="${center.id==centerId }">selected</c:if> >${center.name }</option>
																</c:forEach>
															</select>
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
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a href="${BASE_PATH}/settlement/oclistexcel?&s_time=${s_time}&e_time=${e_time}&centerId=${centerId}" class="btn btn-danger">导出记录</a>
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
																<th class="text-center">运营中心ID</th>
																<th class="text-center">运营中心名称</th>
																<th class="text-center">类型</th>
																<th class="text-center">结算时段</th>
																<th class="text-center">总魅力值</th>
																<th class="text-center">本次结算魅力值</th>
																<th class="text-center">运营中心分成</th>
																<th class="text-center">总收益（元）</th>
																<th class="text-center">结算时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${settlementList}" var="operate_Center_Settlement">
																<tr class="text-center">
																	<td>${operate_Center_Settlement.operate_center_id}</td>
																	<td>${operate_Center_Settlement.name}</td>
																	<td>${operate_Center_Settlement.settlement_type==0?'周结':'日结'}</td>
																	<td><c:if test="${operate_Center_Settlement.settlement_type==0}"><fmt:formatDate value="${operate_Center_Settlement.start_time}"  pattern="MM月dd日"></fmt:formatDate>  ~ <fmt:formatDate value="${operate_Center_Settlement.end_time}"  pattern="MM月dd日"></fmt:formatDate></c:if></td>
																	<td>${operate_Center_Settlement.total_anchor_virtual}</td>
																	<td>${operate_Center_Settlement.virtual_count}</td>
																	<td>${operate_Center_Settlement.divide}%</td>
																	<td><fmt:formatNumber value="${operate_Center_Settlement.money_count}" pattern="0.00" maxFractionDigits="2"/>元</td>
																	<td>${operate_Center_Settlement.create_time}</td>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>