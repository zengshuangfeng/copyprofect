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
				<h2>版本更新列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>版本更新列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
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
													<label class="control-label" for="status">&nbsp;</label> <a
														href="${BASE_PATH}/versionupdate/add" class="input-group">
														<button type="button" class="btn btn-w-m btn-primary">添加</button>
													</a>
												</div>
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
																<th class="text-center">版本号</th>
																<th class="text-center">更新时间</th>
																<th class="text-center">平台</th>
																<th class="text-center">更新文案</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${versionUpdateList}" var="versionUpdate">
																<tr class="text-center">
																	<td>${versionUpdate.version}</td>
																	<td>开始：${versionUpdate.effect_time}</td>
																	<td><c:choose>
																			<c:when test="${versionUpdate.platform==10}">IOS</c:when>
																			<c:when test="${versionUpdate.platform==20}">安卓</c:when>
																			<c:otherwise>IOS,安卓</c:otherwise>
																		</c:choose></td>
																	<td>${versionUpdate.content}</td>
																	<td>${versionUpdate.w_name}</td>
																	<td><c:choose>
																			<c:when test="${versionUpdate.is_online==1}">
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" id="onlineCheck${versionUpdate.id}" checked class="onoffswitch-checkbox" onclick="checkConfirm(this, ${versionUpdate.id})"> <label
																						class="onoffswitch-label" for="onlineCheck${versionUpdate.id}">
																						<span class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>

																			</c:when>
																			<c:otherwise>
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox"
																						class="onoffswitch-checkbox" id="onlineCheck${versionUpdate.id}"  onclick="checkConfirm(this, ${versionUpdate.id})">
																					<label class="onoffswitch-label"for="onlineCheck${versionUpdate.id}">
																						<span class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose>
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script src="${ctx}/js/common.js"></script>
<script type="text/javascript">
function checkConfirm(target, id)
{
		var checked = $(target).prop("checked");
		swal({
			title : checked?"开启更新提示":"开启关闭提示",
			text : checked?"是否开启更新提示":"是否关闭更新提示",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#1ab394",
			confirmButtonText : "确认",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({type: "POST",url:"${BASE_PATH}/versionupdate/updateonline",data: {id:id,is_online:checked?1:0},success:function(data){
					if(data > 0)
					{
						window.location.reload();
					}	
				}});
			}
		});	
}
</script>