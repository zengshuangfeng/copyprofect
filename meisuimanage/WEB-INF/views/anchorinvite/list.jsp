<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>邀请设置</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>邀请设置</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=$uid}&nickname=${nickname}&is_online=${is_online}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/anchorinvite/list"
											autocomplete="off" method="get" id="anchorinvite">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">主播昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">状态</label> <select
															name="is_online" id="is_online" class="form-control"
															onchange="$('#anchorinvite').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${is_online==1}"> selected="selected"</c:if>>开启</option>
															<option value="0"<c:if test="${is_online==0}"> selected="selected"</c:if>>关闭</option>
														</select>
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
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/anchorinvite/add"
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
																<th class="text-center">主播UID</th>
																<th class="text-center">主播昵称</th>
																<th class="text-center">已送出钻石数</th>
																<th class="text-center">随机最低钻石数</th>
																<th class="text-center">随机最高钻石数</th>
																<th class="text-center">活动链接</th>
																<th class="text-center">状态</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">编辑时间</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${anchorInviteConfigList}" var="anchorInviteConfig">
																<tr class="text-center">
																	<td>${anchorInviteConfig.uid}</td>
																	<td>${anchorInviteConfig.nickname}</td>
																	<td>${anchorInviteConfig.reward_count}</td>																	
																	<td>${anchorInviteConfig.min_reward}</td>
																	<td>${anchorInviteConfig.max_reward}</td>
																	<td class="col-lg-2"><a target="_blank" href="http://fx.nanrenbang.in/peipeishare/anchor/invite?f_uuid=${anchorInviteConfig.f_uuid}">http://fx.nanrenbang.in/peipeishare/anchor/invite?f_uuid=${anchorInviteConfig.f_uuid}</a></td>
																	<td><c:if test="${anchorInviteConfig.is_online==0}">
																		<span class="label label-danger">关闭</span>
																	</c:if> <c:if test="${anchorInviteConfig.is_online==1}">
																		<span class="label label-primary">开启</span>
																	</c:if></td>
																	<td>${anchorInviteConfig.w_name}</td>
																	<td>${anchorInviteConfig.update_time}</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/anchorinvite/edit?id=${anchorInviteConfig.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteAnchorInvite(${anchorInviteConfig.id})">删除</a><br></td>
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
<script type="text/javascript">
	function deleteAnchorInvite(id) {
		deleteConfirm(id, "${BASE_PATH}/anchorinvite/delete", "该信息");
	}
</script>