<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>游戏房间列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>游戏调控管理</a></li>
					<li class="active"><strong>游戏房间列表</strong></li>
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
											<%-- <div class="col-sm-2">
												<div class="form-group">
													<label class="control-label">当前全局资金池</label><br/>
													<label class="control-label">${current_virtual_count}</label>
												</div>
											</div> --%>
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label">全局</label><br/>
													<label class="control-label">${all}</label>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label">庄家赢</label><br/>
													<label class="control-label">${gap}</label>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label">比例</label><br/>
													<label class="control-label">${percent}%</label>
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
																<th class="text-center">游戏类型</th>
																<th class="text-center">全局</th>
																<th class="text-center">庄家赢</th>
																<th class="text-center">比例</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${allGameCapitalList}" var="allGameCapital">
																<tr class="text-center">
																	<td><c:choose>
																	<c:when test="${allGameCapital.type==0}">牛牛</c:when>
																	<c:when test="${allGameCapital.type==1}">扎金花</c:when>
																	<c:when test="${allGameCapital.type==2}">猫和老鼠</c:when>
																	<c:when test="${allGameCapital.type==3}">海盗船</c:when>
																	<c:when test="${allGameCapital.type==4}">水果机</c:when>
																	</c:choose></td>
																	<td>${allGameCapital.user_all}</td>
																	<td>${allGameCapital.banker_win}</td>
																	<td>${allGameCapital.percent}%</td>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>