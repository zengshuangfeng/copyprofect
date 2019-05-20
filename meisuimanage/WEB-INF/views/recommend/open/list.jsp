<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>${styleName}</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>推荐位管理</a></li>
					<li class="active"><strong>${styleName}</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&s=${s}&s_time=${s_time}&e_time=${e_time}&url=${url}&status=${status}&platform=${platform}&style=${style}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/recommend${name}/list"
											autocomplete="off" method="get" id="form">
											<div class="row">
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
														<label class="control-label" for="jumpstyle">类型</label> <select
															name="jumpstyle" id="jumpstyle" class="form-control"
															onchange="$('form').submit()">
															<option value="">请选择</option>
															<c:forEach items="${jumpMapList}" var="map">
																<option value="${map.key}">${map.value}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">状态</label> <select
															name="status" id="status" class="form-control"
															onchange="$('form').submit()">
															<option value="-1">全部</option>
															<option value="0">未开始</option>
															<option value="1">进行中</option>
															<option value="2">已结束</option>
														</select>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">平台</label> <select
															name="platform" id="platform" class="form-control"
															onchange="$('form').submit()">
															<option value="">请选择</option>
															<option value="00">全部</option>
															<option value="10">IOS</option>
															<option value="20">安卓</option>
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
															href="${BASE_PATH}/recommend${name}/add?r=1${query}"
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
																<th class="text-center footable-first-column">ID</th>
																<th class="text-center">banner图</th>
																<th class="text-center">跳转类型</th>
																<th class="text-center">跳转链接</th>
																<th class="text-center">排序值</th>
																<th class="text-center">状态</th>
																<th class="text-center">编辑状态</th>
																<th class="text-center">上线时间</th>
																<th class="text-center">下线时间</th>
																<th class="text-center">平台</th>
																<th class="text-center">版本</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">编辑时间</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${recommendList}" var="recommend">
																<tr class="text-center">
																	<td class="footable-first-column">${recommend.id}</td>
																	<td class="col-xs-1">
                                   			 							<img class="col-xs-12<c:if test="${empty recommend.pic}"> hide</c:if>" src="${empty recommend.pic?'':uploadUrl}${recommend.pic}">
                           											</td>
																	<td><c:choose>
																			<c:when test="${recommend.style2==0}">不跳转</c:when>
																			<c:when test="${recommend.style2==1}">内嵌网页</c:when>
																			<c:when test="${recommend.style2==2}">外链</c:when>
																			<c:otherwise>
																				<c:forEach items="${jumpMapList}" var="map">
																					<c:if test="${map.key==recommend.url}">
																	${map.value}
																	</c:if>
																				</c:forEach>
																			</c:otherwise>
																		</c:choose></td>
																	<td class="col-xs-2">${empty recommend.url?'':'链接：'}${recommend.url}${empty recommend.href?' ':' 参数：'}${recommend.href}</td>
																	<td><input type="number" id="${recommend.id}"
																			value="${recommend.position}"
																			class="dial store-b-sorts input-with-num" /></td>
																	<td><c:if
																			test="${null!=recommend.status_name&&recommend.status_name=='未开始'}">
																			<span class="label label-success">未开始</span>
																		</c:if> <c:if
																			test="${null!=recommend.status_name&&recommend.status_name=='已结束'}">
																			<span class="label label-danger">已结束</span>
																		</c:if> <c:if
																			test="${null==recommend.status_name||recommend.status_name=='进行中'}">
																			<span class="label label-primary">进行中</span>
																		</c:if></td>
																	<td><c:if test="${recommend.is_online==0}">
																			<span class="label label-danger">下线</span>
																		</c:if> <c:if test="${recommend.is_online==1}">
																			<span class="label label-primary">正常</span>
																		</c:if></td>
																	<td>${recommend.s_time}</td>
																	<td>${recommend.e_time}</td>
																	<td><c:choose>
																			<c:when test="${recommend.platform==10}">IOS</c:when>
																			<c:when test="${recommend.platform==20}">安卓</c:when>
																			<c:otherwise>IOS,安卓</c:otherwise>
																		</c:choose></td>
																	<td>${recommend.version}</td>
																	<td>${recommend.w_name}</td>
																	<td>${recommend.update_time}</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/recommendopen/edit?id=${recommend.id}${query}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteRecommend(${recommend.id})">删除</a></td>
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
<script type="text/javascript">
	$(function() {
		$("select[name=jumpstyle]").find("option[value='${jumpstyle}']").attr("selected", true);
		$("select[name=status]").val("${status}");
		$("select[name=platform]").val("${platform}");
		$(".input-with-num").blur(function() {
			var target = $(this);
			$.post("${BASE_PATH}/recommend/updateposition", {
				id : target.attr("id"),
				position : target.val()
			}, function(data) {
				if (data > 0) {
					window.location.reload();
				}
			});
		});
	});
	function deleteRecommend(id) {
		deleteConfirm(id, "${BASE_PATH}/recommend${name}/delete", "该信息");
	}
</script>