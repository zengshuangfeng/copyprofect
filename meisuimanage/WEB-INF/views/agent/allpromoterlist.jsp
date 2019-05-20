<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>推广员列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>推广员管理</a></li>
					<li class="active"><strong>推广员列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&begin_time=${begin_time}&end_time=${end_time}&f_uuid=${f_uuid}&nickname=${nickname}&operate_center_id=${operate_center_id}&agent_id=${agent_id}&invite_code=${invite_code}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
											<form action="${BASE_PATH}/operate/allpromoterlist"
											autocomplete="off" method="get" id="search_form">
											<div class="row">								
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
														<label class="control-label">推广员房间号</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
													<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">推广员昵称</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
													<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">推广员邀请码</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${invite_code}" name="invite_code">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择运营中心</label>
														<div class="input-group">
															<select name="operate_center_id"class="form-control" >
																<option value="0">请选择运营中心</option>
																<c:forEach items="${operate_CenterList}" var="operateCenter">
																	<option value="${operateCenter.id}"<c:if test="${operateCenter.id==operate_center_id}"> selected="selected"</c:if>>${operateCenter.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>	
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择代理</label>
														<div class="input-group">
															<select name="agent_id"class="form-control">
																<option value="0">请选择代理</option>
																<c:forEach items="${agentList}" var="agent">
																	<option value="${agent.id}"<c:if test="${agent.id==agent_id}"> selected="selected"</c:if>>${agent.name}</option>
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
										
											<table class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">邀请人总人数</th>
																<th class="text-center">邀请人总充值</th>
																<th class="text-center">邀请人累计消费钻石</th>
																<th class="text-center">总推广累计所得魅力值</th>
															</tr>
														</thead>
														<tbody>
																<tr class="text-center">
																	
																	<td>${total_invite}</td>
																	<td>${total_recharge}</td>
																	<td>${total_give}</td>
																	<td>${spread_Total_Glamour}</td>
																</tr>
														</tbody>
													</table>
										
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">推广员房间号</th>
																<th class="text-center">推广员昵称</th>
																<th class="text-center">推广员邀请码</th>
																<th class="text-center">所属运营中心</th>
																<th class="text-center">所属代理</th>
																<th class="text-center">邀请人数</th>
																<th class="text-center">邀请用户总充值</th>
																<th class="text-center">邀请人用户总送礼流水</th>
																<th class="text-center">入驻时间</th>
																<th class="text-center">备注</th>
																<!-- <th class="text-center">是否开启为虚拟账号</th> -->	
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${agent_PromoterList}" var="agent_Promoter">
																<tr class="text-center">
																	<td>${agent_Promoter.f_uuid}</td>
																	<td>${agent_Promoter.nickname}</td>
																	<td>${agent_Promoter.invite_code}</td>
																	<td>${agent_Promoter.operate_center_name }</td>
																	<td>${agent_Promoter.agent_name }</td>
																	<td>${agent_Promoter.invite_count}</td>
																	<td>${agent_Promoter.invite_recharge_sum}</td>
																	<td>${agent_Promoter.invite_spending_sum}</td>
																	<td><fmt:formatDate value="${agent_Promoter.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																	<td>${agent_Promoter.remark}</td>																
																	<td><a href="${BASE_PATH}/operate/invite?agentId=${agent_Promoter.agent_id}&centerId=${agent_Promoter.operate_center_id}&agent_promoter_id=${agent_Promoter.id}" class="btn btn-xs btn-outline btn-success">查看下属用户</a></td>
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
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">  
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
    	window.location.href = "${BASE_PATH}/operate/promoterexcel?&begin_time=${begin_time}&end_time=${end_time}";
}

$(function(){
	$("select[name=operate_center_id]").change(function(){
		var centerId = $(this).val();
		$.ajax({
			url:"${BASE_PATH}/operate/agentlist",
			data:{centerId:centerId},
			success:function(data){
				var agentId = ${agent_id};
				var optionStr = '<option value="0">请选择代理</option>';
				for(var key in data.list){
					optionStr += '<option value="'+data.list[key].id+'">'+data.list[key].name+'</option>';
				}
				$("select[name=agent_id]").html(optionStr);
			}
		})
	});
});
</script>