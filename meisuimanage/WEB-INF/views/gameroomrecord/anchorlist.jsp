<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>${nickname}</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>游戏调控管理</a></li>
					<li><strong><a href="${BASE_PATH}/gameroomrecord/list">游戏房间列表</a></strong>
					</li>
					<li class="active"><strong><a>${nickname}</a></strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&f_uuid=${f_uuid}&start_time=${start_time}" var="query" />
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
													<label class="control-label">房间总押注</label><br/>
													<label class="control-label">${total_bet_count}</label>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label">房间资金池</label><br/>
													<label class="control-label">${current_virtual_count}</label>
												</div>
											</div>
										</div>
									</div>
									<div class="m-b-sm">
										<form action="${BASE_PATH}/gameroomrecord/anchorlist"
											autocomplete="off" method="get">
											<div class="row">
												<input type="hidden" name="f_uuid" value="${f_uuid}"/>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_time}" name="start_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
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
																<th class="text-center">结束时间</th>
																<th class="text-center">当前局押注</th>
																<th class="text-center">当前押注人数</th>
																<th class="text-center">当前最大押注</th>
																<th class="text-center">房间比例</th>
																<th class="text-center">是否干预</th>
																<th class="text-center">当前资金池</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${gameroomRecordList}" var="gameroomRecord">
																<tr class="text-center">
																	<td>${gameroomRecord.end_time}</td>
																	<td>${gameroomRecord.current_bet_count}</td>
																	<td>${gameroomRecord.current_user_count}</td>
																	<td>${gameroomRecord.max_bet_count}</td>
																	<td>${gameroomRecord.current_percent}%</td>
																	<td>${gameroomRecord.is_intervene==1?'干预':'否'}</td>
																	<td>${gameroomRecord.current_virtual_count}</td>
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