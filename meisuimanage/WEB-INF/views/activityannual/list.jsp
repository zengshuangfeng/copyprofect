<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<link
	href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
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
				<h2>年度盛典</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>年度盛典</a></li>									
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="wrapper wrapper-content animated fadeInRight ecommerce">
				<c:set value="&type=${type}"
					var="query" />
				<div class="row">
					<div class="col-lg-12">
						<div class="tabs-container">
							<ul class="nav nav-tabs orderTab">
								<li <c:if test="${type==0}"> class="active"</c:if> data-ref="0"><a href="${BASE_PATH}/activityannual/list?type=0">金钱树</a></li>
								<li <c:if test="${type==1}"> class="active"</c:if> data-ref="1"><a href="${BASE_PATH}/activityannual/list?type=1">老用户回归</a></li>						
							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<div class="panel-body">							
										<div class="row">
											<div class="col-lg-12">
												<div class="ibox">
													<div class="ibox-content">
														<div style="clear: both;"></div>
														<c:if test="${type==0}">
								<div class="form-group">
										<label class="control-label" for="status">&nbsp;</label>
										<div class="input-group">
										<span class="input-group-btn">
											<a class="btn btn-danger" href="${BASE_PATH}/activityannual/exportexcel">导出</a>
										</span>
									</div>
									</div>
																<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">活动时间</th>
																		<th class="text-center">总充值金额</th>
																		<th class="text-center">支出钻石金额</th>																	
																		<th class="text-center">支出小金猪个数</th>
																		<th class="text-center">支出守护个数</th>
																		<th class="text-center">支出旅游券个数</th>																	
																		<th class="text-center">支出现金券个数</th>
																		<th class="text-center">操作</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${activityuserlist}" var="activityuserlist">
																		<tr>
																			<td class="text-center">${activityuserlist.activitytime }</td>
																			<td class="text-center">${activityuserlist.allrecharge }</td>
																			<td class="text-center">${activityuserlist.allbalance_virtual }</td>
																			<td class="text-center">${activityuserlist.pigcount}</td>
																			<td class="text-center">${activityuserlist.guardcount}</td>
																			<td class="text-center">${activityuserlist.travelcount}</td>
																			<td class="text-center">${activityuserlist.moneycount}</td>
																			<td class="text-center">
																			<span class="actionclick"
																		style="cursor: pointer;">查看明细&nbsp;<i
																			class="click-expand glyphicon glyphicon-plus"></i></span>
																		<div class="actiondiv">
																		<c:forEach items="${activityuserlist.activity_annual}" var="activity_annual" varStatus="j">
																			<a class="btn btn-xs btn-outline btn-success"
																				href="${BASE_PATH}/activityannual/detail?wheel=${activity_annual.wheel}&activity_id=${activity_annual.id}&count=${j.count}">第${j.count}轮</a><br />																		
																		</c:forEach>		
																		</div>
																		</td>
																			
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==1}">
															<div class="m-b-sm">
										<form action="${BASE_PATH}/activityannual/list" autocomplete="off" method="get" id="search">
											<div class="row">
											<input type="hidden" value="1" name="type">
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
											<a class="btn btn-danger" href="${BASE_PATH}/activityannual/exportexcel2?s_time=${s_time}&e_time=${e_time}">导出</a>
										</span>
									</div>
									</div>	
											</div>
										</form>
									</div>
												
																	<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">用户UID</th>																	
																		<th class="text-center">用户昵称</th>
																		<th class="text-center">获得折扣</th>
																		<th class="text-center">是否使用了折扣</th>
																		<th class="text-center">折后充值金额</th>
																		<th class="text-center">回归时间</th>	
																		<th class="text-center">使用折扣充值时间</th>																
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${activityList}" var="activityList">
																		<tr>
																			<td class="text-center">${activityList.uid}</td>
																			<td class="text-center">${activityList.nickname}</td>
																			<td class="text-center">${activityList.annualdiscount.discount}</td>
																			<td class="text-center">
																			<c:if test="${activityList.annualdiscount.is_use==0}">否</c:if>
																			<c:if test="${activityList.annualdiscount.is_use==1}">是</c:if>
																			</td>
																			<td class="text-center">${activityList.annualdiscount.recharge_rmb}</td>
																			<td class="text-center"><fmt:formatDate value="${activityList.login_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
																			<td class="text-center">
																			<c:if test="${activityList.annualdiscount.recharge_time !=null}"><fmt:formatDate value="${activityList.annualdiscount.recharge_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </c:if>
																			<c:if test="${activityList.annualdiscount.recharge_time ==null}">-- </c:if>
																			</td>
																
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>											
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
<script>
$(document).on("click",".actionclick",function(){
	var i_action = $(this).children("i");
	$(".actionclick").next("div").hide();
	if(i_action.hasClass("click-expand"))
	{
		i_action.removeClass("click-expand");
		i_action.addClass("click-collapse");
		i_action.removeClass("glyphicon-plus");
		i_action.addClass("glyphicon-minus");
		$(this).next("div").show();
	}
	else
	{
		i_action.removeClass("click-collapse");
		i_action.addClass("click-expand");
		i_action.removeClass("glyphicon-minus");
		i_action.addClass("glyphicon-plus");
		$(this).next("div").hide();
	}
});
$(document).bind("click",function(e){ 
	var target = $(e.target); 
	if(target.closest(".actiondiv").length == 0&&target.closest(".actionclick").length==0){ 
		$(".actionclick").children("i").removeClass("click-collapse");
		$(".actionclick").children("i").addClass("click-expand");
		$(".actionclick").children("i").removeClass("glyphicon-minus");
		$(".actionclick").children("i").addClass("glyphicon-plus");
		$(".actiondiv").hide();
	} 
});
</script>