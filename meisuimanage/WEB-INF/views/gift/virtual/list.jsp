<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>会员送礼记录</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>会员管理</a></li>
					<li class="active"><strong>会员送礼记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&s_time=${s_time}&e_time=${e_time}&gift_id=${gift_id}&gift_name=${gift_name}&is_online=${is_online}&uid=${uid}&send_uid=${send_uid}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/virtual/list"
											autocomplete="off" method="get" id="form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">收礼方UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>	
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">送礼方UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${send_uid>0?send_uid:''}" name="send_uid">
														</div>
													</div>
												</div>								
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">礼物ID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${gift_id>0?gift_id:''}" name="gift_id">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">礼物名称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${gift_name}" name="gift_name">
														</div>
													</div>
												</div>
														<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">礼物状态</label> <select
															name="is_online" id="is_online" class="form-control"
															onchange="$('#search').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${is_online==1}"> selected="selected"</c:if>>正常</option>
															<option value="0"<c:if test="${is_online==0}"> selected="selected"</c:if>>关闭</option>
														</select>
													</div>
												</div>							
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
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
														<label class="control-label" for="date_modified">结束时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${e_time}" name="e_time"
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
												<c:if test="${can_export==1}">
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
												</c:if>
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
																<th class="text-center">礼物ID</th>
																<th class="text-center">礼物名</th>
																<th class="text-center">礼物单价（钻石）</th>
																<!-- <th class="text-center">直播类型</th> -->
																<th class="text-center">收礼方UID</th>
																<th class="text-center">收礼方房间号</th>
																<th class="text-center">送礼方UID</th>
																<th class="text-center">送礼方房间号</th>
																<!-- <th class="text-center">代理分成</th>
																<th class="text-center">主播分成</th> -->
																<th class="text-center">送礼方等级</th>															
																<th class="text-center">送礼时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${virtualList}" var="virtuallist">
																<tr class="text-center">
																	<td>${virtuallist.gift_id}</td>
																	<td>${virtuallist.gift_name}</td>
																	<td>${virtuallist.gift_virtual}</td>															
																	<td>(${virtuallist.rev_nickname})&nbsp;<a href="${BASE_PATH}/userinfo/detail?id=${virtuallist.uid}">${virtuallist.uid}</a></td>
																	<td>${virtuallist.rev_f_uuid}</td>
																	<td>(${virtuallist.send_nickname})&nbsp;<a href="${BASE_PATH}/userinfo/detail?id=${virtuallist.send_uid}">${virtuallist.send_uid}</a></td>
																    <td>${virtuallist.send_f_uuid}</td>
																   <%--  <td><c:if test="${spending.promoter_divide!=''}">${spending.promoter_divide}%</c:if></td>
																    <td><c:if test="${spending.anchor_divide!=''}">${spending.anchor_divide}%</c:if></td> --%>
																    <td>${virtuallist.send_level}</td>
																    <td>															    
																    <fmt:formatDate value="${virtuallist.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
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
<script type="text/javascript">
	function exportExcel()
	{
		var gift_id = $("input[name=gift_id]").val();
		var uid = $("input[name=uid]").val();
		var send_uid = $("input[name=send_uid]").val();
		var s_time = $("input[name=s_time]").val();
		var e_time = $("input[name=e_time]").val();
		if(typeof(e_time) =='undefined')
			e_time = "";
		location.href = "${BASE_PATH}/virtual/exportexcel?gift_id="+gift_id+"&uid="+uid+"&send_uid="+send_uid+"&s_time="+s_time+"&e_time="+e_time;
	}
</script>