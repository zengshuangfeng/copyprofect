<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>工会列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>工会列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&name=${name}&remark=${remark}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/anchorunion/list"
											autocomplete="off" method="get" id="form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">工会名称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${name}" name="name">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">备注</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${remark}" name="remark">
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
															href="${BASE_PATH}/anchorunion/add"
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
																<th class="text-center footable-first-column">工会ID</th>
																<th class="text-center">工会名称</th>
																<th class="text-center">分成比例</th>
																<th class="text-center">一对一分成比例</th>
																<th class="text-center">结算类型</th>
																<th class="text-center">入驻时间</th>
																<th class="text-center">备注</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${anchorUnionList}" var="anchorUnion">
																<tr class="text-center">
																	<td class="footable-first-column">${anchorUnion.id}</td>
																	<td>${anchorUnion.name}</td>
																	<td>${anchorUnion.divide_proportion}</td>
																	<td>${anchorUnion.one_divide_proportion}</td>
																	<td>
																	    <c:choose>
																	      <c:when test="${anchorUnion.type==0}">周结</c:when>
																	      <c:when test="${anchorUnion.type==1}">日结</c:when>
																	    </c:choose>
																	</td>
																	<td>${anchorUnion.create_time}</td>
																	<td>${anchorUnion.remark}</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/anchorunion/edit?id=${anchorUnion.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteUnion(${anchorUnion.id})">删除</a>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	function deleteUnion(id) {
		deleteConfirm(id, "${BASE_PATH}/anchorunion/delete", "该工会");
	}
</script>