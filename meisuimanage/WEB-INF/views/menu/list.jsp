<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<c:set value="&s=${s}" var="query" />
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>菜单列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>权限管理</a></li>
					<li class="active"><strong><a>菜单列表</a></strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="ibox-content m-b-sm border-bottom">
				<div class="row">
					<div class="col-sm-2">
						<div class="form-group">
							<label class="control-label" for="status">&nbsp</label> <a
								href="${BASE_PATH}/menu/add" class="input-group">
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
										<th class="text-center footable-first-column">ID</th>
										<th class="text-center">菜单名称</th>
										<th class="text-center">菜单英文名称</th>
										<th class="text-center">上级菜单</th>
										<th class="text-center">URL</th>
										<th class="text-center">是否有子菜单</th>
										<th class="text-center">样式名称</th>
										<th class="text-center">排序</th>
										<th class="text-center">是否显示</th>
										<th class="text-right footable-last-column">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${_menuList}" var="menu">
										<tr class="text-center footable-even"
											style="display: table-row;">
											<td class="footable-first-column">${menu.id}</td>
											<td><c:choose>
													<c:when
														test="${menu.name==null || menu.name.isEmpty() || menu.name==''}">
													-
												</c:when>
													<c:otherwise>
													${menu.name}
												</c:otherwise>
												</c:choose></td>
											<td>${menu.name_en}</td>
											<td>${menu.f_name}</td>
											<td>${menu.url}</td>
											<td>${menu.has_submenu==1?'是':'否'}</td>
											<td>${menu.class_name}</td>
											<td>${menu.sort}</td>
											<td>${menu.isshow==1?'是':"否"}</td>
											<td class="text-right footable-last-column"><a
												class="btn btn-xs btn-outline btn-primary"
												href="${BASE_PATH}/menu/edit?id=${menu.id}">编辑</a></td>
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>