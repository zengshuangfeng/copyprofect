<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>PK大乱斗</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>PK大乱斗</a></li>
					<li class="active"><strong>参赛主播列表/PK记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value=""
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">					
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">PK时间</th>
																<th class="text-center">PK对象</th>
																<!-- <th class="text-center">道具</th> -->
																<th class="text-center">结果</th>
																<th class="text-center">当前段位</th>
																<th class="text-center">PK获得的活动积分</th>																													
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${pkList}" var="pkList">
																<tr class="text-center">
																	<td>
																	<fmt:formatDate value="${pkList.create_time}"  pattern="yyyy-MM-dd  HH:mm:ss"></fmt:formatDate> 

																	</td>
																	<td>${pkList.nickname}</td>																	
																	<!-- <td>
																	</td> -->
																	<td>
																	<c:if test="${pkList.isuccess==0}">输</c:if>
																	<c:if test="${pkList.isuccess==1}">赢</c:if>
																	</td>
																	<td>
																	<c:if test="${pkList.grading==0}">佳人</c:if>	
																	<c:if test="${pkList.grading==1}">粉黛</c:if>	
																	<c:if test="${pkList.grading==2}">蛾眉</c:if>	
																	<c:if test="${pkList.grading==3}">玉人</c:if>	
																	<c:if test="${pkList.grading==4}">璧人</c:if>	
																	<c:if test="${pkList.grading==5}">佼人</c:if>	
																	<c:if test="${pkList.grading==6}">丽人</c:if>	
																	<c:if test="${pkList.grading==7}">伊人</c:if>	
																	<c:if test="${pkList.grading==8}">玉女</c:if>	
																	<c:if test="${pkList.grading==9}">淑女</c:if>	
																	<c:if test="${pkList.grading==10}">尤物</c:if>	
																	<c:if test="${pkList.grading==11}">娇娃</c:if>	
																	<c:if test="${pkList.grading==12}">西施</c:if>	
																	<c:if test="${pkList.grading==13}">青娥</c:if>	
																	</td>	
																	<td>															
																	${pkList.score}																
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
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script type="text/javascript">
</script>