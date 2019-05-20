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
				<h2>注册登录查询</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>注册登录查询</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&start_time=${start_time}&end_time=${end_time}&channel_platform=${channel_platform}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/userinfo/statisticslist"
											autocomplete="off" method="get" id="form">
											<div class="row">
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_time}"
																name="start_time"
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
																class="form-control" value="${end_time}" name="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
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
																	<option value="1111_0"<c:if test="${channel_platform=='1111_0'}"> selected="selected"</c:if>>无</option>									
														</select>
														</div>
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
														<label class="control-label" for="status">&nbsp;</label> <label
															class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn"> <a
																class="btn btn-danger"
																href="${BASE_PATH}/userinfo/statisticslist/exportexcel?start_time=${start_time}&end_time=${end_time}&channel_platform=${channel_platform}">导出</a>
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
																<th class="text-center">新增人数</th>
																<th class="text-center">登录人数</th>
																<th class="text-center">登录次数</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${statisticslist}" var="statistics">
																<tr class="text-center">
																	<td>${statistics.statis_date}</td>
																	<td>${statistics.register_count}</td>
																	<td>${statistics.user_count}</td>
																	<td>${statistics.login_count}</td>
																</tr>
															</c:forEach>
														        <tr class="text-center">
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
														        <tr class="text-center">
																	<td>累计统计</td>
																	<td>${summary.register_count}</td>
																	<td>${summary.user_count}</td>
																	<td>${summary.login_count}</td>															
																</tr>																
														</tbody>
														<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
													</table>
												</div>	
												<!--  
												<div class="row show-grid" >
													<div class="col-md-6">累计统计</div>
													<div class="col-md-6">0</div>
												</div>
												-->
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