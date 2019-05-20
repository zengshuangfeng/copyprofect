<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>充值统计</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石</a></li>
					<li class="active"><strong>充值统计</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
		<c:set value="&start_time=${start_time}&end_time=${end_time}&statistics_type=${statistics_type}&channel_platform=${channel_platform}&recharge_type=${recharge_type}"
				var="query" />		
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">										
										<form action="${BASE_PATH}/rechargestatistics/list"
											autocomplete="off" method="get" id="search_form">
											<div class="row">
												<div class="col-sm-2" style="clear:both;">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_time}"
																name="start_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${end_time}" name="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})"
																type="text">
														</div>
													</div>
												</div>	
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">统计方式</label>
														<div class="input-group"> <select
															name="statistics_type" class="form-control">
															<option value="-1">所有</option>															
															<option value="0"<c:if test="${statistics_type==0}"> selected="selected"</c:if>>按年</option>
															<option value="1"<c:if test="${statistics_type==1}"> selected="selected"</c:if>>按月</option>
														</select>
														</div>
													</div>
												</div>	
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">充值方式</label>
														<div class="input-group"> <select id="recharge_type"
															name="recharge_type" class="form-control"
															onchange="onRechargeTypeChange()">
															<option value="-1">所有</option>															
															<option value="0"<c:if test="${recharge_type==0}"> selected="selected"</c:if>>渠道充值</option>
															<option value="1"<c:if test="${recharge_type==1}"> selected="selected"</c:if>>人工充值</option>
														</select>
														</div>
													</div>
												</div>														
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">渠道</label>
														<div class="input-group"> 
														<select id="channel_id" name="channel_platform" class="form-control" onchange="onChannelChange()">
															        <option value="">所有</option>
															<c:forEach items="${channellist}" var="recharge_channel">
															        <c:set var="t_channel_platform" value="${recharge_channel.channel}_${recharge_channel.platform}"/>
																	<option value="${t_channel_platform}" <c:if test="${channel_platform==t_channel_platform}"> selected="selected"</c:if>>${recharge_channel.name}
																	<c:choose>
																	    <c:when test="${recharge_channel.platform==10}">-IOS</c:when>
																	</c:choose>
																	<c:choose>
																	    <c:when test="${recharge_channel.platform==20}">-安卓</c:when>
																	</c:choose>																	
																	</option>        	
															</c:forEach>																							
														</select>
														</div>
													</div>
												</div>																																																			
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<button type="submit" class="btn btn-primary">确定查询</button>
															</span>
														</div>
													</div>
												</div>
												<div class="col-sm-1">
												    <div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger" href="${BASE_PATH}/rechargestatistics/exportexcel?start_time=${start_time}&end_time=${end_time}&statistics_type=${statistics_type}&channel_platform=${channel_platform}&recharge_type=${recharge_type}">导出</a>
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
																<th class="text-center">充值人数</th>
																<th class="text-center">充值次数</th>
																<th class="text-center">充值金额(元)</th>
																<th class="text-center">支付钻石</th>
																<th class="text-center">ARPU值</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${statisticsList}" var="statistics">
																<tr class="text-center">
																	<td>${statistics.recharge_year}<c:if test="${statistics.recharge_month!=null}">-${statistics.recharge_month}</c:if><c:if test="${statistics.recharge_day!=null}">-${statistics.recharge_day}</c:if></td>
																	<td>${statistics.people_count}</td>
																	<td>${statistics.recharge_count}</td>
																	<td>${statistics.recharge_money}</td>
																	<td>${statistics.virtual_money}</td>
																	<td><fmt:formatNumber type="number" value="${statistics.recharge_money / statistics.people_count}" pattern="0.00" maxFractionDigits="2"/>  </td>
																</tr>
															</c:forEach>
														        <tr class="text-center">
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
														        <tr class="text-center">
																	<td>总计</td>
																	<td>${summary.people_count}</td>
																	<td>${summary.recharge_count}</td>
																	<td>${summary.recharge_money}</td>
																	<td>${summary.virtual_money}</td>
																	<td><c:if test="${summary.people_count!=0}"><fmt:formatNumber type="number" value="${summary.recharge_money / summary.people_count}" pattern="0.00" maxFractionDigits="2"/></c:if></td>
																</tr>																
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
<script>
function onChannelChange(){
	/* if($('#channel_id').get(0).selectedIndex==($('#channel_id').get(0).length-1)){
		$('#recharge_type').get(0).selectedIndex = 2;
		return;
	} */
	$('#recharge_type').get(0).selectedIndex = 1;
	
}
function onRechargeTypeChange(){
	if($('#recharge_type').get(0).selectedIndex==0){
		$('#channel_id').get(0).selectedIndex = 0;
	}
	if($('#recharge_type').get(0).selectedIndex==1){
		$('#channel_id').get(0).selectedIndex = 0;
	}
	if($('#recharge_type').get(0).selectedIndex==2){
		$('#channel_id').get(0).selectedIndex = 0;
	}
}
</script>