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
				<h2>马甲列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>马甲列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&nickname=${nickname}&uid=${uid}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/uservest/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1" style="width:120px">
													<div class="form-group">
														<label class="control-label">UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:200px">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
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
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/uservest/add"
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
																<th class="text-center">UID</th>
																<th class="text-center">昵称</th>
																<th class="text-center">头像</th>
																<th class="text-center">魅力值</th>
																<th class="text-center">性别</th>
																<th class="text-center">粉丝数</th>
																<th class="text-center">视频数</th>
																<th class="text-center">回复数</th>
																<th class="text-center">最后发布视频时间</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userList}" var="user">
																<tr class="text-center">
																	<td>${user.id}</td>
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${user.id}">${user.nickname}</a></td>
																	<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty user.head}">
																				<img class="col-xs-12"
																					src="${fn:startsWith(user.head,'http')?'':uploadUrl}${user.head}" />
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																	<td>${user.total_anchor_virtual}</td>
																	<td>${user.sex==0?'男':user.sex==1?'女':'未知'}</td>
																	<td>${user.follower_count}</td>
																	<td>${user.video_count}</td>
																	<td>${user.reply_count}</td>
																	<td>${user.last_video_time}</td>
																	<td class="text-right footable-last-column">
																	<a class="btn btn-xs btn-outline btn-success" href="${BASE_PATH}/uservest/edit?id=${user.id}">编辑马甲</a>
																	<a class="btn btn-xs btn-outline btn-success" href="${BASE_PATH}/uservest/addvideo?uid=${user.id}&f_uuid=${user.f_uuid}">添加视频</a>
																	<a class="btn btn-xs btn-outline btn-danger" href="javascript:deleteUserVest(${user.id})">删除</a>																	
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
<script type="text/javascript">
	function deleteUserVest(id) {
		deleteConfirm(id, "${BASE_PATH}/uservest/delete", "该马甲");
	}
</script>