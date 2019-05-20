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
				<h2>礼物统计</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物管理</a></li>
					<li class="active"><strong>礼物统计</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&start_date=${start_date}&end_date=${end_date}&type=${type}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/giftstatistics/list"
											autocomplete="off" method="get" id="form">
											<div class="row">
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_date}"
																name="start_date"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${end_date}" name="end_date"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
														</div>
													</div>
												</div>
													<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">礼物种类</label> <select
															name="type" class="form-control">	
															<option value="0"<c:if test="${type==0}"> selected="selected"</c:if>>普通礼物</option>														
															<option value="1"<c:if test="${type==1}"> selected="selected"</c:if>>特殊礼物</option>
															
														</select>
													</div>
												</div>	
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<button type="submit" class="btn btn-primary">查询</button>
															</span>
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger" href="${BASE_PATH}/giftstatistics/exportexcel2?start_date=${start_date}&end_date=${end_date}&type=${type}">导出</a>
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
																<th class="text-center">日期</th>
																<th class="text-center">礼物名称</th>
																<th class="text-center">总赠送个数</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${statisticslist}" var="statistics">
																<tr class="text-center">
																	<td>${statistics.spending_date}</td>
																	<td>${statistics.gift_name}</td>
																	<td>${statistics.spending_count}</td>
																</tr>
															</c:forEach>
														</tbody>
														<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
													</table>
												</div>	
												<div class="row show-grid" >
													<div class="col-md-6">累计统计</div>
													<div class="col-md-6">${summaryGiftCount}</div>
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
<script type="text/javascript"
	src="${ctx}/My97DatePicker/WdatePicker.js"></script>