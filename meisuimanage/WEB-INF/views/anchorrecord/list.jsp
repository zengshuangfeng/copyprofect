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
				<h2>直播记录列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>直播记录列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&operate_center_id=${operate_center_id}&agent_id=${agent_id}&nickname=${nickname}&uid=${uid}&f_uuid=${f_uuid}&union_id=${union_id}&is_trial=${is_trial}&start_time=${start_time}&end_time=${end_time}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-12">
												<form action="${BASE_PATH}/anchorrecord/list"
													autocomplete="off" method="get" id="search_form">		
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择运营中心</label>
														<div class="input-group">
															<select name="operate_center_id"class="form-control" onchange="getAgentList(this.value)">
																<option value="0">请选择运营中心</option>
																<c:forEach items="${operate_CenterList}" var="operateCenter">
																	<option value="${operateCenter.id}"<c:if test="${operateCenter.id==operate_center_id}"> selected="selected"</c:if>>${operateCenter.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>	
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择代理</label>
														<div class="input-group">
															<select name="agent_id"class="form-control">
																<option value="0">请选择代理</option>
																<c:forEach items="${agentList}" var="agent">
																	<option value="${agent.id}"<c:if test="${agent.id==agent_id}"> selected="selected"</c:if>>${agent.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>											
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">UID</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${uid>0?uid:''}"
																name="uid">
														</div>
													</div>
												</div>	
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">房间号</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${f_uuid>0?f_uuid:''}"
																name="f_uuid">
														</div>
													</div>
												</div>													
												<div class="col-sm-2" style="width:200px">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group">
															<input class="form-control" value="${nickname}" name="nickname"
																type="text">
														</div>
													</div>
												</div>													
												<div class="col-sm-1" style="width:110px">
													<div class="form-group">														
														<label class="control-label">是否是试播</label>
														<div class="input-group">
															<select name="is_trial" class="form-control"
																onchange="$('#search_form').submit()">
																<option value="-1"<c:if test="${is_trial==-1}"> selected="selected"</c:if>>全部</option>
																<option value="1"<c:if test="${is_trial==1}"> selected="selected"</c:if>>是</option>
																<option value="0"<c:if test="${is_trial==0}"> selected="selected"</c:if>>否</option>
															</select>
														</div>
													</div>
												</div>			
												<br/>
												<div class="col-sm-2" style="clear:both">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_time}" name="start_time"
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
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">&nbsp;</label>
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
																<a <c:if test="${empty start_time or empty end_time}">disabled="disabled"</c:if> href="javascript:exportTime('${start_time}','${end_time}')" class="btn btn-danger">导出记录</a>
															</span>
														</div>
													</div>
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
																<th class="text-center">UID</th>
																<th class="text-center">房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">周魅力值</th>
																<th class="text-center">出勤天数</th>
																<th class="text-center">有效天数</th>
																<th class="text-center">有效直播时长</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${anchorRecordTotalList}" var="anchorRecordTotal">
																<tr class="text-center">
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${anchorRecordTotal.uid}">${anchorRecordTotal.uid}</a></td>
																	<td>${anchorRecordTotal.f_uuid}</td>
																	<td>${anchorRecordTotal.nickname}</td>
																	<td>${anchorRecordTotal.virtual_count}</td>
																	<td>${anchorRecordTotal.attend_days}</td>
																	<td>${anchorRecordTotal.effective_days}</td>
																	<td>${anchorRecordTotal.effective_time}</td>
																	<td class="text-right footable-last-column">
																	<c:if test="${show_info==1}">
																	<a
																		href="${BASE_PATH}/anchorrecord/getinfo?uid=${anchorRecordTotal.uid}" class="btn btn-xs btn-outline btn-success">主播信息</a>
																	</c:if><a href="${BASE_PATH}/anchorrecord/timelist?uid=${anchorRecordTotal.uid}" class="btn btn-xs btn-outline btn-success">直播记录</a>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function exportTime(s_time,e_time){
		if(s_time==null || s_time == '' || e_time == null || e_time == ''){
			sweetAlert("选择时间段搜索后再导出！", "","error");
		}else{
			window.location.href="${BASE_PATH}/anchorrecord/exporttime?operate_center_id=${operate_center_id}&agent_id=${agent_id}&nickname=${nickname}&uid=${uid}&f_uuid=${f_uuid}&union_id=${union_id}&is_trial=${is_trial}&start_time=${start_time}&end_time=${end_time}"
		}
	}
	$(function(){
		$("select[name=operate_center_id]").change(function(){
			var centerId = $(this).val();
			$.ajax({
				url:"${BASE_PATH}/anchorrecord/agentlist",
				data:{centerId:centerId},
				success:function(data){
					var agentId = ${agent_id};
					var optionStr = '<option value="0">请选择代理</option>';
					for(var key in data.list){
						optionStr += '<option value="'+data.list[key].id+'">'+data.list[key].name+'</option>';
					}
					$("select[name=agent_id]").html(optionStr);
				}
			})
		});
	});
</script>