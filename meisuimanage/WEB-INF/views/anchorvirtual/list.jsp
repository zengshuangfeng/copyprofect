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
				<h2>主播统计管理</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>主播统计管理</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&f_uuid=${f_uuid}&nickname=${nickname}&start_time=${start_time}&end_time=${end_time}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/anchorvirtual/list"
											autocomplete="off" method="get" id="select">
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
												<div class="col-sm-2" style="width: 200px">
													<div class="form-group">
														<label class="control-label">主播昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
						
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
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
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${end_time}" name="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
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
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <label
															class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn"> <a
																class="btn btn-danger"
																href="javascript:exportExcel();">导出</a>
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
																<!-- <th class="text-center">工会</th> -->
																<th class="text-center">魅力值</th>
																<!-- <th class="text-center">收到游戏流水</th> -->
																<th class="text-center">1级用户魅力值</th>
																<th class="text-center">1级用户数量</th>
																<th class="text-center">2级用户魅力值</th>
																<th class="text-center">2级用户数量</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${anchorVirtualTotalList}"
																var="anchorVirtualTotal">
																<tr class="text-center">
																	<td>${anchorVirtualTotal.uid}</td>
																	<td>${anchorVirtualTotal.f_uuid}</td>
																	<td>${anchorVirtualTotal.nickname}</td>
																	<%-- <td>${anchorVirtualTotal.union_name}</td> --%>
																	<td>${anchorVirtualTotal.total_anchor_virtual}</td>
																	<%-- <td>${anchorVirtualTotal.game_profit}</td> --%>
																	<td>${anchorVirtualTotal.level_one_virtual}</td>
																	<td>${anchorVirtualTotal.level_one_num}</td>
																	<td>${anchorVirtualTotal.level_two_virtual}</td>
																	<td>${anchorVirtualTotal.level_two_num}</td>
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function exportExcel()
	{
		var uid = $("input[name=uid]").val();
		var f_uuid = $("input[name=f_uuid]").val();
		var nickname = $("input[name=nickname]").val();
		var start_time = $("input[name=start_time]").val();
		var end_time = $("input[name=end_time]").val();
		if(typeof(end_time) =='undefined')
			end_time = "";
		location.href = "${BASE_PATH}/anchorvirtual/exportexcel?uid="+uid+"&f_uuid="+f_uuid+"&nickname="+nickname+"&start_time="+start_time+"&end_time="+end_time;
	}
</script>