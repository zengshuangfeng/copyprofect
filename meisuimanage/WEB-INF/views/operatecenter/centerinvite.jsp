<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-3">
			<h2>运营中心</h2>
				<ol class="breadcrumb">
					<li><a href="#">运营中心</a></li>
					<li class="active"><strong>全部邀请人列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&uid=${uid }&centerId=${centerId}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/operate/centerinvites"
											autocomplete="off" method="get" id="search_form">
											<input type="hidden" name="centerId" value="${centerId}"/>
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">被邀请人UID</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${uid==0?'':uid}" name="uid">
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
											</div>
										</form>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table id="cc"
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">被邀请人UID</th>
																<th class="text-center">被邀请人房间号</th>
																<th class="text-center">被邀请人昵称</th>
																<th class="text-center">总充值</th>
																<th class="text-center">总送礼</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody id="user_table">
															<c:forEach items="${list}" var="user" varStatus="status">
																<tr class="text-center">
																	<td>${user.id}</td>
																	<td>${user.f_uuid}</td>
																	<td>${user.nickname }</td>
																	<td>${user.sum_recharge}</td>
																	<td>${user.sum_give }</td>
																	<td><a class="btn btn-xs btn-outline btn-primary" href="${BASE_PATH}/recharge/list?uid=${user.id}" class="btn btn-xs btn-outline btn-success mt10">查看充值记录</a></td>
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
<script src="${ctx}/js/plugins/morris/raphael-2.1.0.min.js"></script>
<script src="${ctx}/js/plugins/morris/morris.js"></script>
<script type="text/javascript">
</script>
