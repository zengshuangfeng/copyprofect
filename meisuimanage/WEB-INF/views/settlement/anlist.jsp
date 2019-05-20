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
				<h2>代理未结算</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>结算管理</a></li>
					<li class="active"><strong>代理未结算</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&agent_id=${agent_id}&type=${type}&operate_center_id=${operate_center_id}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/settlement/anlist" autocomplete="off" method="get" id="search_form">
											<div class="row">
											<div class="col-sm-1" style="width:130px">
													<div class="form-group">
														<label class="control-label">结算类型</label>
														<div class="input-group">
															<select name="type"class="form-control" onchange="$('#search_form').submit()">
																<option value="0" <c:if test="${type==0}">selected="selected"</c:if>>周结</option>
																<option value="1" <c:if test="${type==1}">selected="selected"</c:if>>日结</option>
															</select>
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
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">选择代理</label>
														<div class="input-group">
															<select name="agent_id"class="form-control" onchange="$('#search_form').submit()" id="agentlist">
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
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">代理ID</th>
																<th class="text-center">代理名称</th>
																<th class="text-center">所属运营中心</th>
																<th class="text-center">类型</th>															
																<th class="text-center">总魅力值</th>
																<th class="text-center">已兑换魅力值</th>
																<th class="text-center">本次结算魅力值</th>
																<th class="text-center">代理分成</th>
																<th class="text-center">总收益（元）</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${list}" var="settlement">
																<c:if test="${settlement.virtual_count>0}">
																	<tr class="text-center">
																		<td>${settlement.id}</td>
																		<td>${settlement.name}</td>
																		<td>${settlement.operate_center_name}</td>
																		<td>${settlement.settlement_type==0?'周结':'日结'}</td>																	
																		<td>${settlement.total_anchor_virtual}</td>
																		<td>${settlement.total_exchange_virtual}</td>
																		<td>${settlement.virtual_count-total_exchange_virtual}</td>
																		<td>${settlement.divide}%</td>
																		<td><fmt:formatNumber value="${settlement.money_count}" pattern="0.00" maxFractionDigits="2"/>元</td>
																	</tr>
																</c:if>
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	function clearAgent(id) {
		deleteConfirm(id, "${BASE_PATH}/settlement/clearagent", "代理魅力值", "清除");
	}
	
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