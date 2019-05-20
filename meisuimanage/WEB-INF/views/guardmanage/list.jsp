<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>守护赠送记录</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石管理</a></li>
					<li class="active"><strong>守护赠送记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&f_uuid=${f_uuid}&anchor_f_uuid=${anchor_f_uuid}&nickname=${nickname}&type=${type}&start_time=${start_time}&end_time=${end_time}&operate_center_id=${operate_center_id}&agent_id=${agent_id}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">										
										<form action="${BASE_PATH}/guardmanage/list"
											autocomplete="off" method="get" id="search_form">
											<div class="row">
											
												<div class="col-sm-1" style="width:11%">
													<div class="form-group">
														<label class="control-label">守护主播房间号</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${anchor_f_uuid>0?anchor_f_uuid:''}" name="anchor_f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户房间号</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">守护类型</label>
														<div class="input-group"> <select
															name="type" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="-1" >所有</option>															
															<option value="0" <c:if test="${type==0}"> selected="selected"</c:if>>包月守护</option>
															<option value="1" <c:if test="${type==1}"> selected="selected"</c:if>>包季守护</option>
															<option value="2" <c:if test="${type==2}"> selected="selected"</c:if>>包年守护</option>
														</select>
														</div>
													</div>
												</div>													
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择运营中心</label>
														<div class="input-group">
															<select name="operate_center_id"class="form-control">
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
												<br/>
												<div class="col-sm-2" style="clear:both;">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_time}"
																name="start_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${end_time}" name="end_time"
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
																<button type="submit" class="btn btn-primary">搜索</button>
															</span>
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a href="javascript:exportValid();" class="btn btn-danger">导出</a>
															</span>
														</div>
													</div>
												</div>
													<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/guardmanage/add"
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加守护</button>
														</a>
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
																<th class="text-center">用户房间号</th>
																<th class="text-center">用户</th>
																<th class="text-center">守护时间</th>
																<th class="text-center">守护的主播</th>
																<th class="text-center">守护类型</th>															
																<th class="text-center">所属运营中心</th>
																<th class="text-center">所属代理平台</th>
																<th class="text-center">所属推广员</th>
																<th class="text-center">赠送时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${manageList}" var="managelist">
																<tr class="text-center">
																	<td>${managelist.f_uuid}</td>
																	<td>${managelist.nickname}</td>
																	<td>开始时间：<fmt:formatDate value="${managelist.start_time}" pattern="yyyy-MM-dd"/><br/>
																	结束时间：<fmt:formatDate value="${managelist.end_time}" pattern="yyyy-MM-dd"/></td>
																	<td>房间号：${managelist.anchor_f_uuid}<br/>昵称：${managelist.anchor_nickname}</td>
																	<td>
																	<c:if test="${managelist.type==0}">包月守护</c:if>
																	<c:if test="${managelist.type==1}">包季守护</c:if>
																	<c:if test="${managelist.type==2}">包年守护</c:if>
																	</td>
																	<td>${managelist.operate_name}</td>
																	<td>${managelist.agentname }</td>
																	<td>${managelist.promotername }</td>
																	<td><fmt:formatDate value="${managelist.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
function exportValid()
{
	var sDate1 = $("input[name=start_time]").val();
	var sDate2 = $("input[name=end_time]").val();
	if(sDate1==''||sDate2=='')
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
    	window.location.href = "${BASE_PATH}/guardmanage/exportexcel?&uid=${uid}&f_uuid=${f_uuid}&anchor_f_uuid=${anchor_f_uuid}&pay_type=${pay_type}&type=${type}&nickname=${nickname}&start_time=${start_time}&end_time=${end_time}&operate_center_id=${operate_center_id}&agent_id=${agent_id}";
}

$(function(){
	$("select[name=operate_center_id]").change(function(){
		var centerId = $(this).val();
		$.ajax({
			url:"${BASE_PATH}/guardmanage/agentlist",
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