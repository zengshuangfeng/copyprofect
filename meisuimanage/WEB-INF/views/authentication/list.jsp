<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>身份认证审核记录</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>代理管理</a></li>
					<li class="active"><strong>身份认证审核记录</strong></li>
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
												<div class="col-sm-1">
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
																<th class="text-center">所属省代</th>
																<th class="text-center">所属运营中心</th>
																<th class="text-center">所属代理</th>
																<th class="text-center">提交人</th>
																<th class="text-center">实名通过时间</th>
																<th class="text-center">实名情况</th>
																<th class="text-center">结算账户类型</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${getAllauthenticationList}" var="authenticationList">
																<tr class="text-center">
																	 <td>${authenticationList.province_name}</td>
																	 <td>${authenticationList.center_name}</td>
																	 <td>${authenticationList.agent_name}</td>
																	 <td>
																	<c:if test="${authenticationList.stauts==1}">${authenticationList.agent_name} (代理)</c:if>
																	 <c:if test="${authenticationList.stauts==2}">${authenticationList.center_name} (运营中心)</c:if>
																	 <c:if test="${authenticationList.stauts==3}">${authenticationList.province_name} (省代)</c:if>
																	 </td>
																	 <td>																	 
																		<fmt:formatDate value="${authenticationList.checktime}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 																	 
																	 </td>
																	 <td>															
																	  <c:if test="${authenticationList.is_status==0}">初审审核中</c:if>
																	 <c:if test="${authenticationList.is_status==1}">初审通过</c:if>
																	 <c:if test="${authenticationList.is_status==2}">初审失败</c:if>
																	 <c:if test="${authenticationList.is_status==3}">已实名</c:if>
																	 <c:if test="${authenticationList.is_status==4}">复审未通过</c:if>
																	 <c:if test="${authenticationList.is_status==5}">复审审核中</c:if>
																	 <c:if test="${authenticationList.is_status==6}">重新认证</c:if>	
																	 
																	 </td>
																	 <td><c:if test="${authenticationList.is_status==3}">${authenticationList.pay_type}</c:if></td>
																	<td class="text-right footable-last-column">
																	<a class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/authentication/edit?id=${authenticationList.id}">详情</a>
																		<a class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/authentication/recordlist?authentication_id=${authenticationList.id}">历史记录</a><br></td>
																	<%-- <td>${report.key_count}</td> --%>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
</script>