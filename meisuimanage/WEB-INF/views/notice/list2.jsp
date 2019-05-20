<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>公告列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>公告管理</a></li>
					<li class="active"><strong>公告列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&begin_time=${begin_time}&end_time=${end_time}&type=${type}&state=${state}&platform=${platform}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">
									<div class="col-sm-1">
										<div class="form-group">
											<label class="control-label" for="status">&nbsp;</label>
											<div class="input-group">
												<span class="input-group-btn">
													<a href="${BASE_PATH}/notice/add" class="btn btn-primary">添加</a>
												</span>
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
																<th class="text-center">公告ID</th>
																<th class="text-center">公告内容</th>
																<th class="text-center">上线时间</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${list}" var="notice">
																<tr class="text-center">
																	<td>${notice.id }</td>
																	<td>${notice.content }</td>
																	<td><fmt:formatDate value="${notice.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																	<td>
																		<a class="btn btn-xs btn-outline btn-danger" href="javascript:del(${notice.id})">删除</a>
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script>
function del(id) {
	deleteConfirm(id, "${BASE_PATH}/notice/delete", "该信息");
}
</script>