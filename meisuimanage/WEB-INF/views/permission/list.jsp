<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<c:set value="&s=${s}" var="query" />
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>账号列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>权限管理</a></li>
					<li class="active"><strong><a>账号列表</a></strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="ibox-content m-b-sm border-bottom">
				<form action="${BASE_PATH}/permission/list" autocomplete="off"
					method="get">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="status">&nbsp</label>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="搜索..."
										name="s" value="${s}" /> <span class="input-group-btn">
										<button type="submit" class="btn btn-primary">搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-group">
								<label class="control-label" for="status">&nbsp</label> <a
									href="${BASE_PATH}/permission/add" class="input-group">
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
										<th class="text-center">账号类型</th>
										<th class="text-center">账号昵称</th>
										<th class="text-center">账号名称</th>
										<th class="text-center">账号备注</th>
										<th class="text-right footable-last-column">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adminList}" var="admin">
										<tr class="text-center footable-even"
											style="display: table-row;">
											<td>
											<c:if test="${admin.is_read==0}">主账号</c:if>
											<c:if test="${admin.is_read==1}">子账号</c:if>
											</td>
											<td>${admin.nickname}</td>
											<td>${admin.username}</td>
											<td>${admin.remark}</td>
											<td class="text-right footable-last-column"><a
												class="btn btn-xs btn-outline btn-primary"
												href="${BASE_PATH}/permission/edit?id=${admin.id}${query}">编辑</a>
												<a class="btn btn-xs btn-outline btn-danger"
												href="javascript:deleteAdmin(${admin.id})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
	$(function() {
		$("select[name=province]").change(function() {
			$("select[name=city]").val(0);
			$("form").submit();
		});
	});
	function deleteAdmin(id) {
		deleteConfirm(id, "${BASE_PATH}/permission/delete", "账号");
	}
</script>