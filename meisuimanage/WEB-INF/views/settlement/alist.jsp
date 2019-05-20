<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>代理已结算</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>结算管理</a></li>
					<li class="active"><strong>代理已结算</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&s_time=${s_time}&e_time=${e_time}&agent_id=${agent_id}&type=${type }&operate_center_id=${operate_center_id}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/settlement/alist" autocomplete="off" method="get" id="search_form">
											<div class="row">
											<div class="col-sm-1" style="width:130px">
													<div class="form-group" >
														<label class="control-label">类型</label>
														<div class="input-group">
															<select name="type"class="form-control">
																<option value="0"<c:if test="${type==0}"> selected="selected"</c:if>>周结</option>
																<option value="1"<c:if test="${type==1}"> selected="selected"</c:if>>日结</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
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
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${e_time}" name="e_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
														</div>
													</div>
												</div>	
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">选择运营中心</label>
														<div class="input-group">
															<select name="operate_center_id"class="form-control" onchange="getAgentList(this.value)">
																<option value="0">请选择运营中心</option>
																<c:forEach items="${operateCenterList}" var="operateCenter">
																	<option value="${operateCenter.id}"<c:if test="${operateCenter.id==operate_center_id}"> selected="selected"</c:if>>${operateCenter.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>											
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">选择代理</label>
														<div class="input-group">
															<select name="agent_id"class="form-control" id="agentlist">
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
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a href="${BASE_PATH}/settlement/exportexcel?s_time=${s_time}&e_time=${e_time}&agent_id=${agent_id}&operate_center_id=${operate_center_id}&type=${type}" class="btn btn-danger">导出</a>
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
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">代理ID</th>
																<th class="text-center">代理名称</th>
																<th class="text-center">所属运营中心</th>
																<th class="text-center">类型</th>
																<c:if test="${type==0}"><th class="text-center">结算时段</th></c:if>
																<th class="text-center">总魅力值</th>
																<th class="text-center">本次结算魅力值</th>
																<th class="text-center">代理分成</th>
																<th class="text-center">总收益（元）</th>
																<th class="text-center">结算时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${settlementList}" var="settlement">
																<tr class="text-center">
																	<td>${settlement.agent_id}</td>
																	<td>${settlement.name}</td>
																	<td>${settlement.operate_center_name}</td>
																	<td>${settlement.settlement_type==0?'周结':'日结'}</td>
																	<c:if test="${settlement.settlement_type==0}"><td><fmt:formatDate value="${settlement.start_time}"  pattern="MM月dd日"></fmt:formatDate>  ~ <fmt:formatDate value="${settlement.end_time}"  pattern="MM月dd日"></fmt:formatDate></td></c:if>
																	<td>${settlement.total_anchor_virtual}</td>
																	<td>${settlement.virtual_count}</td>
																	<td>${settlement.divide}%</td>
																	<td><fmt:formatNumber value="${settlement.money_count}" pattern="0.00" maxFractionDigits="2"/>元</td>
																	<td>${settlement.create_time}</td>
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
<script>
function getAgentList(centerId){
	$.ajax({
		url:"${BASE_PATH}/settlement/agentlist",
		data:{centerId:centerId},
		success:function(data){
			var agentId = ${agent_id};
			var optionStr = '<option value="0">请选择代理</option>';
			for(var key in data.list){
				if(agentId == data.list[key].id){
					optionStr += '<option value="'+data.list[key].id+'" selected="selected">'+data.list[key].name+'</option>';
				}else{
					optionStr += '<option value="'+data.list[key].id+'">'+data.list[key].name+'</option>';
				}
			}
			$("#agentlist").html(optionStr);
		}
	})
}

$(function(){
	getAgentList('${operate_center_id}');
})
</script>