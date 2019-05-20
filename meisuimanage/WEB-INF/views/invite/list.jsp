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
				<h2>邀请有礼列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>邀请有礼列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body"><%-- 
									<div class="row">
										<div class="col-sm-2">
											<div class="form-group">
												<label class="control-label" for="status">&nbsp;</label> <a
													href="${BASE_PATH}/invite/add" class="input-group">
													<button type="button" class="btn btn-w-m btn-primary">添加</button>
												</a>
											</div>
										</div>
									</div> --%>
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">生效时间</th>
																<th class="text-center">更新文案</th>
																<th class="text-center">邀请者获钻石</th>
																<th class="text-center">被邀请者获钻石</th>
																<th class="text-center">状态</th>
																<th class="text-center">编辑人员</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${inviteList}" var="invite">
																<tr class="text-center">
																	<td>${invite.effect_time}</td>
																	<td style="width: 500px">${invite.content}</td>
																	<td>${invite.virtual_count}</td>
																	<td>${invite.to_virtual_count}</td>
																	<td><c:if test="${invite.is_online==0}">
																			<span class="label label-danger">下线</span>
																		</c:if> <c:if test="${invite.is_online==1}">
																			<span class="label label-primary">上线</span>
																		</c:if></td>
																	<td>${invite.w_name}</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/invite/edit?id=${invite.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:updateOnline(${invite.id}, ${invite.is_online==0?1:0})">${invite.is_online==0?'上线':'下线'}</a></td>
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
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
function updateOnline(id, is_online) {
	swal({
		title : "",
		text : "确定要" + (is_online==1?"上线":"下线") + "？",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : is_online==1?"上线":"下线",
		cancelButtonText : "取消",
		closeOnConfirm : true,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			$.ajax({type: "POST",url:"/invite/updateonline",data:{id:id,is_online:is_online},success:function(){
					window.location.reload(true);	
			}});

		}
	});
}
</script>