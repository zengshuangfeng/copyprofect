<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<style type="text/css">
	.actiondiv{display:none;position: absolute;background-color: #fff;z-index: 10;border: 1px solid #e7eaec;padding: 10px 20px 20px 20px;right: 0px;}
</style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-3">
			<h2>运营中心</h2>
				<ol class="breadcrumb">
					<li><a href="#">运营中心</a></li>
					<li class="active"><strong>下属代理列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&agentName=${agentName }&agentId=${agentId }&centerId=${centerId}&begin_time=${begin_time}&end_time=${end_time}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/operate/agent"
											autocomplete="off" method="get" id="search_form">
											<input type="hidden" name="centerId" value="${centerId}"/>
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">代理ID</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${agentId==0?'':agentId}" name="agentId">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">代理名称</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${agentName}" name="agentName">
														</div>
													</div>
												</div>
												
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control"  value="${begin_time}"
																name="begin_time" id="begin_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input class="form-control" value="${end_time}"  name="end_time" id="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})"
																type="text">
														</div>
													</div>
												</div>
												
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-primary" href="javascript:search();">搜索</a>
															</span>
														</div>
													</div>
												</div>
												
													<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a href="javascript:exportValid();" class="btn btn-danger">导出记录</a>
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
																<th class="text-center">代理ID</th>
																<th class="text-center">代理名称</th>
																<th class="text-center">代理分成</th>
																<th class="text-center">邀请人数</th>
																<th class="text-center">邀请用户总充值</th>
																<th class="text-center">直播累计所得魅力值</th>
																<th class="text-center">推广累计所获魅力值</th>
																<th class="text-center">入驻时间</th>
																<th class="text-center">备注</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody id="agent_table">
															<c:forEach items="${list}" var="agent" varStatus="status">
																<tr class="text-center">
																	<td>${agent.id }</td>
																	<td>${agent.name}</td>
																	<td>${agent.divide }%</td>
																	<td>${agent.totalInvite }</td>
																	<td>${agent.totalRecharge }</td>
																	<td>${agent.totalAnchor }</td>
																	<td>${agent.totalPromoter }</td>
																	<td><fmt:formatDate value="${agent.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																	<td>${agent.remark }</td>
																	<td><span class="actionclick" style="cursor:pointer">更多&nbsp;<i class="click-expand glyphicon glyphicon-plus"></i></span>
																	<div class="actiondiv">
																		<a href="${BASE_PATH}/operate/agentprofit?agent_id=${agent.id}" class="btn btn-xs btn-outline btn-success mt10">代理收益明细</a><br/>
																		<a class="btn btn-xs btn-outline btn-success mt10" href="${BASE_PATH}/operate/agentedit?agentId=${agent.id}&centerId=${centerId}">编辑信息</a><br/>
																		<a href="${BASE_PATH}/operate/promoterlist?centerId=${centerId}&agentId=${agent.id}" class="btn btn-xs btn-outline btn-success mt10">查看下属推广员</a><br/>
																		<a href="${BASE_PATH}/operate/invite?agentId=${agent.id}&agent_promoter_id=${agent_Promoter.id}&centerId=${centerId}" class="btn btn-xs btn-outline btn-success mt10">查看全部邀请用户</a><br/>
																		<a href="javascript:updateAgentIsForbid(${agent.id},${agent.is_forbid==1?0:1})" class="btn btn-xs btn-outline btn-danger mt10">${agent.is_forbid==1?'取消禁用':'禁用'}</a><br/>
																	</div>
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
<script src="${ctx}/js/plugins/morris/raphael-2.1.0.min.js"></script>
<script src="${ctx}/js/plugins/morris/morris.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
$().ready(function() {
	$(".actiondiv").hide();
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
})


	function getDays()
	{
		var sDate1 = $("input[name=begin_time]").val();
		var sDate2 = $("input[name=end_time]").val();
		var iDays = -1;
		if(sDate1!=''&&sDate2!='')
		{
			var aDate, oDate1, oDate2;
		    aDate = sDate1.split("-");
		    oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]); 
		    aDate = sDate2.split("-");
		    oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
		    iDays = parseInt(Math.abs(oDate1 - oDate2)/1000/60/60/24); 
		}
		return iDays;
	}
	function search()
	{
		var iDays = getDays();
	    if(iDays>6)
    	{
	    	swal({ 
				  title: "", 
				  text: "时间跨度不能超多7天", 
				  type:"success",
				  timer: 1500, 
				  showConfirmButton: false 
				});
    	}
	    else
	    	$("#search_form").submit();
	}
	function exportValid()
	{
		var iDays = getDays();
	    if(iDays>6)
    	{
	    	swal({ 
				  title: "", 
				  text: "时间跨度不能超多7天", 
				  type:"success",
				  timer: 1500, 
				  showConfirmButton: false 
				});
    	}
	    else if(iDays==-1)
    	{
	    	swal({ 
				  title: "", 
				  text: "请选择时间", 
				  type:"success",
				  timer: 1500, 
				  showConfirmButton: false 
				});
    	}
	    else
	    	window.location.href = "${BASE_PATH}/operate/agentexcel?&centerId=${centerId}&agentName=${agentName }&agentId=${agentId }&begin_time=${begin_time}&end_time=${end_time}";
	}
</script>
