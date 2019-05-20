<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<style type="text/css">
.actiondiv{display:none;position: absolute;background-color: #fff;z-index: 10;border: 1px solid #e7eaec;padding: 10px 20px 20px 20px;right: 0px;}
</style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>用户统计管理</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>用户统计管理</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&nickName=${nickName}&uid=${uid}&fuuid=${fuuid}&startTime=${startTime}&endTime=${endTime}&level=${level}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/userStatistics/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${fuuid>0?fuuid:''}" name="fuuid">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label" for="level">等级</label> <select
															name="level" id="level" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="" <c:if test="${level eq ''}">selected</c:if>>全部</option>
															<option value="1" <c:if test="${level eq '1'}">selected</c:if>>1</option>
															<option value="1-10" <c:if test="${level eq '1-10'}">selected</c:if>>1-10</option>
															<option value="11-20" <c:if test="${level eq '11-20'}">selected</c:if>>11-20</option>
															<option value="21-30" <c:if test="${level eq '21-30'}">selected</c:if>>21-30</option>
															<option value="31-40" <c:if test="${level eq '31-40'}">selected</c:if>>31-40</option>
															<option value="41-50" <c:if test="${level eq '41-50'}">selected</c:if>>41-50</option>
															<option value="51-60" <c:if test="${level eq '51-60'}">selected</c:if>>51-60</option>
															<option value="61-70" <c:if test="${level eq '61-70'}">selected</c:if>>61-70</option>
															<option value="71-80" <c:if test="${level eq '71-80'}">selected</c:if>>71-80</option>
															<option value="81-90" <c:if test="${level eq '81-90'}">selected</c:if>>81-90</option>
															<option value="91-100" <c:if test="${level eq '91-100'}">selected</c:if>>91-100</option>
														</select>
													</div>
												</div>
												<div class="col-sm-2" style="width: 150px">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickName}" name="nickName">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="startTime">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text" id="startTime"
																class="form-control" value="${startTime}" name="startTime"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="endTime">结束时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="endTime"
																class="form-control" value="${endTime}" name="endTime"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startTime\')}',maxDate:'#F{$dp.$D(\'startTime\',{d:31})}'})"
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
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label>
													<div class="input-group">
														<span class="input-group-btn">
															<a class="btn btn-danger" href="${BASE_PATH}/userStatistics/exportExcel?nickName=${nickName}&uid=${uid}&fuuid=${fuuid}&startTime=${startTime}&endTime=${endTime}&level=${level}">导出</a>
														</span>
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
																<th class="text-center">UID</th>
																<th class="text-center">房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">等级</th>
																<th class="text-center">渠道</th>
																<th class="text-center">注册时间</th>
																<!-- <th class="text-center">押出游戏流水</th> -->
																<th class="text-center">充值金额</th>
																<th class="text-center">消费钻石数</th>
																<th class="text-center">钻石余额</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userInfoList}" var="list">
																<tr class="text-center">
																	<td>${list.uid}</td>
																	<td>${list.f_uuid}</td>
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${list.uid}">${list.nickname}</a></td>
																	<td>${list.level}</td>
																	<td>${list.channelName}</td>
																	<td>																	
																		<fmt:formatDate value="${list.registerTime}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
																	</td>
																<%-- 	<td>${list.totalStake}</td> --%>
																	<td>${list.rmb}</td>
																	<td>${list.sumSpending}</td>
																	<td>${list.balance_virtual}</td>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script>
$("#search_form").validate({
	rules : {
		startTime : "required",
		endTime : "required" 
	},
	messages : {
		startTime : "请选择开始日期",
		endTime : "请选择结束日期" 
	},
	submitHandler : function(form) {
		 form.submit();
	}
});
</script>