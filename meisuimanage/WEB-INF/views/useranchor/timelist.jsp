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
				<h2>主播时长列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li><strong><a href="${BASE_PATH}/useranchor/list">主播列表</a></strong>
					</li>
					<li class="active"><strong>主播时长列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&uid=${uid}&date=${date}&end_date=${end_date}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-8">
												<form action="${BASE_PATH}/${activeUrl}/timelist"
													autocomplete="off" method="get" class="form-inline">
													<div class="form-group">
														<input type="hidden" name="uid" value="${uid}"/>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" value="${date}"
																name="date" placeholder="开始日期。。。" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
													<div class="form-group">
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" value="${end_date}"
																name="end_date" placeholder="结束日期。。。" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<button type="submit" class="btn btn-primary">搜索</button>
															</span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															class="input-group" href="javascript:showTotal(${uid})">
															<button type="button" class="btn btn-w-m btn-primary">统计</button>
														</a>
													</div>
												</form>
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
																<th class="text-center">日期</th>
																<th class="text-center">开播时间</th>
																<th class="text-center">结束时间</th>
																<th class="text-center">当次播出时长</th>
																<th class="text-center">当次获得魅力值</th>
																<!-- <th class="text-center">当次游戏流水</th> -->
																<th class="text-center">当日播出时长</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${anchorTimeTotalList}" var="anchorTimeTotal">
																<c:forEach items="${anchorTimeTotal.anchor_TimeList}" var="anchorTime"  varStatus="status">
																<tr class="text-center">
																	<c:if test="${status.index==0}"><td style="vertical-align: middle;" rowspan="${fn:length(anchorTimeTotal.anchor_TimeList)}">${anchorTimeTotal.date}</td></c:if>
																	<td><fmt:formatDate value="${anchorTime.start_time}" var="date" pattern="HH:mm:ss" />${date}</td>
																	<td><fmt:formatDate value="${anchorTime.end_time}" var="date" pattern="HH:mm:ss" />${date}</td>
																	<td>${anchorTime.single_total_time}</td>
																	<td>${anchorTime.total_virtual}</td>
																<%-- 	<td>${anchorTime.total_stake}</td> --%>
																	<c:if test="${status.index==0}"><td style="vertical-align: middle;" rowspan="${fn:length(anchorTimeTotal.anchor_TimeList)}">${anchorTimeTotal.total}</td></c:if>
																</tr>
																</c:forEach>
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
<div id="total-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b" id="total_h3">统计</h3>
						<form class="form-horizontal">
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">出勤天数：</label>
								<div class="col-sm-6">
									<label class="control-label" id="total_day"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">有效播出天数：</label>
								<div class="col-sm-6">
									<label class="control-label" id="realy_total_day"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">总播出时长：</label>
								<div class="col-sm-6">
									<label class="control-label"id="total"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">总收益：</label>
								<div class="col-sm-6">
									<label class="control-label" id="total_virtual"></label>
								</div>
							</div>
							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									data-dismiss="modal">取消</button>
							</div>
							<div class="col-sm-2">
								<button class="btn btn-primary pull-right" type="button" data-dismiss="modal">
									<strong>确定</strong>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function showTotal(uid)
	{
		var date = $("input[name=date]").val();
		var end_date = $("input[name=end_date]").val();
		$.get("${BASE_PATH}/useranchor/gettimetotal",{uid:uid,date:date,end_date:end_date},function(json){
			$("#total-modal-form").modal('show');
			$("#realy_total_day").text(json.realy_total_day);
			$("#total_day").text(json.total_day);
			$("#total").text(json.total);
			$("#total_virtual").text(json.total_virtual);
			$("#total_h3").text("（"+date+"至"+end_date+"）统计")
		});	
	}
</script>