<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>广场首页活动列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>广场首页活动列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&gift_id=${gift_id}&gift_name=${gift_name}&is_online=${is_online}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/activity/list" autocomplete="off" method="get" id="search">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">状态</label> <select
															name="is_online" id="is_online" class="form-control"
															onchange="$('#search').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${is_online==1}"> selected="selected"</c:if>>上线中</option>
															<option value="0"<c:if test="${is_online==0}"> selected="selected"</c:if>>已下线</option>
														</select>
													</div>
												</div>		
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/activity/add"
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加</button>
														</a>
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
																<th class="text-center">活动名称</th>
																<th class="text-center">链接</th>
																<th class="text-center">上线时间</th>
																<th class="text-center">下线时间</th>
																<th class="text-center">平台</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${activityList}" var="activity">
																<tr class="text-center">
																	<td>${activity.name}</td>
																	<td>${activity.url}</td>																	
																	<td>${activity.start_time}</td>
																	<td>${activity.end_time}</td>
																	<td><c:choose>
																			<c:when test="${activity.platform==10}">IOS</c:when>
																			<c:when test="${activity.platform==20}">安卓</c:when>
																			<c:otherwise>IOS,安卓</c:otherwise>
																		</c:choose></td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/activity/edit?id=${activity.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:updateOnline(${activity.id}, ${activity.is_online==1?0:1})">${activity.is_online==1?'下线':'上线'}</a></td>
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
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function updateOnline(id, is_online) {
		swal({
			title : "",
			text : "确定要" + (is_online==1?"上线":"下线") + "活动？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : is_online==1?"上线":"下线",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({type: "POST",url:"${BASE_PATH}/activity/updateonline",data:{id:id,is_online:is_online},success:function(){
						window.location.reload(true);	
				}});

			}
		});
	}
</script>