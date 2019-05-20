<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<style type="text/css">
.actiondiv{display:none;position: absolute;background-color: #fff;z-index: 10;border: 1px solid #e7eaec;padding: 10px 20px 20px 20px;right: 0px;}
</style>
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
					<li class="active"><strong>参赛主播列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&nickname=${nickname}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/pkgame/list" autocomplete="off" method="get" id="search">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}" name="nickname">
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
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger" href="${BASE_PATH}/pkgame/exportexcel?uid=${uid}&nickname=${nickname}">导出</a>
															</span>
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
																<th class="text-center">主播UID</th>
																<th class="text-center">主播昵称</th>
																<th class="text-center">运营中心</th>
																<th class="text-center">胜场</th>
																<th class="text-center">负场</th>
																<th class="text-center">总场</th>
																<th class="text-center">段位</th>
																<th class="text-center">排行</th>
																<th class="text-center">活动积分</th>
																<th class="text-center footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${pkList}" var="pkList">
																<tr class="text-center">
																	<td>${pkList.uid}</td>
																	<td>${pkList.nickname}</td>																	
																	<td>${pkList.operate_name}</td>
																	<td>${pkList.success_count}</td>
																	<td>${pkList.fail_count}</td>
																	<td>${pkList.all_count}</td>
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
																	<td>${pkList.rank}</td>
																	<td>																
																	${pkList.grading_score}														
																	</td>
																<td class="text-center footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/pkgame/pkrecord?anchor_f_uuid=${pkList.anchor_f_uuid}">PK记录</a>
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
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">

</script>