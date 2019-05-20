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
					<li class="active"><strong>代理列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&agentName=${agentName }&agentId=${agentId }&operate_center_id=${operate_center_id}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/operate/allagent"
											autocomplete="off" method="get" id="search_form">
											<%-- <input type="hidden" name="centerId" value="${centerId}"/> --%>
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">代理ID</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${agentId==0?'':agentId}" name="agentId">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">代理名称</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${agentName}" name="agentName">
														</div>
													</div>
												</div>
												
													<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择运营中心</label>
														<div class="input-group">
															<select name="operate_center_id"class="form-control" onchange="getAgentList(this.value)">
																<option value="0">请选择运营中心</option>
																<c:forEach items="${operate_CenterList}" var="operateCenter">
																	<option value="${operateCenter.id}"<c:if test="${operateCenter.id==operate_center_id}"> selected="selected"</c:if>>${operateCenter.name}</option>
																</c:forEach>
															</select>
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
																<th class="text-center">代理ID</th>
																<th class="text-center">代理名称</th>
																<th class="text-center">代理分成</th>
																<th class="text-center">结算类型</th>
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
																	<td>${agent.settlement_type== 0?'周结':'日结'}</td>
																	<td>${agent.totalInvite }</td>
																	<td>${agent.totalRecharge }</td>
																	<td>${agent.totalAnchor }</td>
																	<td>${agent.totalPromoter }</td>
																	<td><fmt:formatDate value="${agent.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																	<td>${agent.remark }</td>
																	<td><span class="actionclick" style="cursor:pointer">更多&nbsp;<i class="click-expand glyphicon glyphicon-plus"></i></span>
																	<div class="actiondiv">
																		<a href="${BASE_PATH}/operate/agentprofit?agent_id=${agent.id}" class="btn btn-xs btn-outline btn-success mt10">代理收益明细</a><br/>
																		<a class="btn btn-xs btn-outline btn-success mt10" href="${BASE_PATH}/operate/agentedit?agentId=${agent.id}&centerId=${agent.operate_center_id}">编辑信息</a><br/>
																		<a href="${BASE_PATH}/operate/promoterlist?centerId=${agent.operate_center_id}&agentId=${agent.id}" class="btn btn-xs btn-outline btn-success mt10">查看下属推广员</a><br/>
																		<a href="${BASE_PATH}/operate/invite?agentId=${agent.id}&agent_promoter_id=${agent_Promoter.id}&centerId=${agent.operate_center_id}" class="btn btn-xs btn-outline btn-success mt10">查看全部邀请用户</a><br/>
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

function updateAgentIsForbid(id, is_forbid) {
		swal({
			title : (is_forbid == 1 ? "确定" : "取消")+"禁用？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					type : "POST",
					url : "${BASE_PATH}/operate/updateagentisforbid",
					data : {
						id : id,
						is_forbid : is_forbid
					},
					success : function() {
						window.location.reload(true);
					}
				});

			}
		});
	}
</script>
