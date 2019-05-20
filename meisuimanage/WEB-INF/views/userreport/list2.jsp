<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>举报列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>举报列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&nickname=${nickname}&uid=${uid}&start_time=${start_time}&end_time=${end_time}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">
										<form id="reportselect" action="${BASE_PATH}/userreport/list" autocomplete="off"
											method="get" >
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:13%">
													<div class="form-group">
														<label class="control-label">用户昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
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
																<th class="text-center">UID</th>
																<th class="text-center">昵称</th>
																<th class="text-center">头像</th>
																<th class="text-center">等级</th>
																<th class="text-center">魅力值</th>
																<th class="text-center">性别</th>
																<th class="text-center">粉丝数</th>
																<th class="text-center">视频数</th>
																<th class="text-center">钻石数</th>
																<!-- <th class="text-center">钥匙数</th> -->
																<th class="text-center">举报次数</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${reportList}" var="report">
																<tr class="text-center">
																	<td>${report.uid}</td>
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${report.uid}">${report.nickname}</a></td>
																	<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty report.head}">
																				<img class="col-xs-12"
																					src="${fn:startsWith(report.head,'http')?'':uploadUrl}${report.head}" />
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																	<td>${report.level}</td>
																	<td>${report.total_anchor_virtual}</td>
																	<td>${report.sex==0?'男':report.sex==1?'女':'未知'}</td>
																	<td>${report.follower_count}</td>
																	<td>${report.video_count}</td>
																	<td>${report.balance_virtual}</td>
																	<%-- <td>${report.key_count}</td> --%>
																	<td>${report.report_count}</td>
																	<td class="text-center footable-last-column">
																	<a class="btn btn-xs btn-outline btn-success"
																		href="javascript:updateIsBlocked(${report.uid},${report.is_blocked==1?0:1},'${report.nickname}')">${report.is_blocked==1?'取消封号':'封号'}</a>
																	<%-- <a
																		class="btn btn-xs btn-outline btn-success"
																		href="javascript:updateHeadLock(${report.uid},${report.head_lock==1?0:1},'${report.nickname}')">${report.head_lock==1?'解锁头像':'回归头像'}</a>
																		<a class="btn btn-xs btn-outline btn-success"
																		href="javascript:updateNicknameLock(${report.uid},${report.nickname_lock==1?0:1},'${report.nickname}')">${report.nickname_lock==1?'解锁昵称':'回归昵称'}</a> --%></td>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
function updateHeadLock(id, head_lock, nickname) {
	swal({
		title : "",
		text : "确定要" + (head_lock==1?"回归":"解锁") + nickname+ "头像？",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "确定",
		cancelButtonText : "取消",
		closeOnConfirm : true,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			$.ajax({type: "POST",url:"${BASE_PATH}/userreport/updateheadlock",data:{id:id,head_lock:head_lock},success:function(){
					window.location.reload(true);	
			}});

		}
	});
}
function updateNicknameLock(id, nickname_lock, nickname) {
	swal({
		title : "",
		text : "确定要" + (nickname_lock==1?"回归":"解锁") + nickname+ "昵称？",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "确定",
		cancelButtonText : "取消",
		closeOnConfirm : true,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			$.ajax({type: "POST",url:"${BASE_PATH}/userreport/updatenicknamelock",data:{id:id,nickname_lock:nickname_lock},success:function(){
					window.location.reload(true);	
			}});

		}
	});
}
function updateIsBlocked(id, is_blocked, nickname) {
	swal({
		title : (is_blocked==1?"确定将":"解除")+nickname+"封号？",
		text : is_blocked==1?"封号后用户将无法登陆应用":"",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "确定",
		cancelButtonText : "取消",
		closeOnConfirm : true,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			$.ajax({type: "POST",url:"${BASE_PATH}/userreport/updateisblocked",data:{id:id,is_blocked:is_blocked},success:function(){
					window.location.reload(true);	
			}});

		}
	});
}
</script>