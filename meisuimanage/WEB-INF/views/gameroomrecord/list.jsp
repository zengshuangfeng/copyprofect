<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>游戏房间列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>游戏调控管理</a></li>
					<li class="active"><strong>游戏房间列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&anchor_state=${anchor_state}&start_time=${start_time}" var="query" />
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
													<label class="control-label">今日押注</label><br/>
													<label class="control-label">${total_bet_count}</label>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label">当前全局资金池</label><br/>
													<label class="control-label">${current_virtual_count}</label>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label">当前比例</label><br/>
													<label class="control-label">${percent}%</label>
												</div>
											</div>
										</div>
									</div>
									<div class="m-b-sm">
										<form action="${BASE_PATH}/gameroomrecord/list"
											autocomplete="off" method="get" id="search">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="anchor_state">直播状态</label> <select
															name="anchor_state" class="form-control"
															onchange="$('#search').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${anchor_state==1}"> selected="selected"</c:if>>直播中</option>
														</select>
													</div>
												</div>	
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
																<th class="text-center">房间</th>
																<th class="text-center">总押注</th>
																<th class="text-center">当前局押注</th>
																<th class="text-center">总押注人数</th>
																<th class="text-center">当前押注人数</th>
																<th class="text-center">最大押注</th>
																<th class="text-center">房间当前比例</th>
																<th class="text-center">当前房间资金池</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${gameroomRecordTotalList}" var="gameroomRecordTotal">
																<tr class="text-center">
																	<td><a href="${BASE_PATH}/gameroomrecord/anchorlist?f_uuid=${gameroomRecordTotal.f_uuid}&start_time=${start_time}">${gameroomRecordTotal.nickname}</a>
																	<c:choose>
																	<c:when test="${gameroomRecordTotal.s_id>0}"><span class="label label-primary">直播中</span></c:when>
																	<c:otherwise><span class="label label-danger">休息中</span></c:otherwise>
																	</c:choose>
																	<c:if test="${gameroomRecordTotal.s_id>0 && gameroomRecordTotal.is_intervene==0}">
																		<a class="btn btn-xs btn-outline btn-danger" style="margin-left:10px" href="javascript:updateIntervene(${gameroomRecordTotal.id})">干预</a>
																	</c:if>
																	</td>
																	<td>${gameroomRecordTotal.total_bet_count}</td>
																	<td>${gameroomRecordTotal.current_bet_count}</td>
																	<td>${gameroomRecordTotal.total_user_count}</td>
																	<td>${gameroomRecordTotal.current_user_count}</td>
																	<td>${gameroomRecordTotal.max_bet_count}</td>
																	<td>${gameroomRecordTotal.current_percent}%</td>
																	<td>${gameroomRecordTotal.current_virtual_count}</td>
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script type="text/javascript">
	function updateIntervene(id) {
		deleteConfirm(id, "${BASE_PATH}/gameroomrecord/updateintervene", "该房间", "干预");
	}
</script>