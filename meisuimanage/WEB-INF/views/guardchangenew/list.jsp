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
				<h2>守护配置</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石管理</a></li>
					<li class="active"><strong>守护配置</strong></li>
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
													<label class="control-label" for="status">&nbsp</label> <a
														href="${BASE_PATH}/guardchangenew/add" class="input-group">
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
																<th class="text-center">守护类型</th>
																<th class="text-center">守护名称</th>
																<th class="text-center">守护价格(钻)</th>
																<th class="text-center">专属头像装饰</th>
																<th class="text-center">专属入场特效</th>
																<th class="text-center">尊贵特权</th>
																<th class="text-center">专属礼物</th>
																<th class="text-center">专属头像装饰大图</th>
																<th class="text-center">专属入场特效大图</th>
																<th class="text-center">尊贵特权大图</th>
																<th class="text-center">专属礼物大图</th>
																<th class="text-center">套餐状态</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">操作时间</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${guardchangeList}" var="change">
																<tr class="text-center">
																<td>
																<c:if test="${change.type==0}">包月守护</c:if>
																<c:if test="${change.type==1}">包季守护</c:if>
																<c:if test="${change.type==2}">包年守护</c:if>
																</td>
																	<td>${change.name}</td>
																	<td>${change.change_virtual}</td>
																	<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty change.guard_head}">
																				<img class="col-xs-12"
																					src="${uploadUrl}${change.guard_head}">
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																	<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty change.entrance_pic}">
																				<img class="col-xs-12"
																					src="${uploadUrl}${change.entrance_pic}">
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																		<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty change.vehicle_pic}">
																				<img class="col-xs-12"
																					src="${uploadUrl}${change.vehicle_pic}">
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																		<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty change.exclusive_pic}">
																				<img class="col-xs-12"
																					src="${uploadUrl}${change.exclusive_pic}">
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																		<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty change.guard_head_big}">
																				<img class="col-xs-12"
																					src="${uploadUrl}${change.guard_head_big}">
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																	<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty change.entrance_pic_big}">
																				<img class="col-xs-12"
																					src="${uploadUrl}${change.entrance_pic_big}">
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																		<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty change.vehicle_pic_big}">
																				<img class="col-xs-12"
																					src="${uploadUrl}${change.vehicle_pic_big}">
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																		<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty change.exclusive_pic_big}">
																				<img class="col-xs-12"
																					src="${uploadUrl}${change.exclusive_pic_big}">
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																	<td><c:choose>
																			<c:when test="${change.is_online==0}">
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" class="onoffswitch-checkbox"
																						id="example${change.id}" value="${change.id}">
																					<label class="onoffswitch-label"
																						for="example${change.id}"> <span
																						class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>

																			</c:when>
																			<c:otherwise>
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" checked
																						class="onoffswitch-checkbox"
																						id="example${change.id}" value="${change.id}">
																					<label class="onoffswitch-label"
																						for="example${change.id}"> <span
																						class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose></td>
																	<td>${change.w_name}</td>
																	<td><fmt:formatDate value="${change.update_time}"
																			pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																	<td>
																	<a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/guardchangenew/edit?id=${change.id}">编辑</a>    
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".onoffswitch-checkbox").click(function() {
			var checked = $(this).prop("checked");
			var id = $(this).val();
			swal({
				title : "设置套餐状态",
				text : checked ? "是否开启该套餐？" : "是否关闭该套餐？",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#1ab394",
				confirmButtonText : "确认",
				cancelButtonText : "取消",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						type : "POST",
						url : "${BASE_PATH}/guardchangenew/updateisonline",
						data : {
							id : id,
							is_online : checked ? 1 : 0
						},
						success : function(data) {
							if (data > 0) {
								window.location.reload();
							}
						}
					});
				}else{
					window.location.reload();
				}
			});
		});

	});

</script>