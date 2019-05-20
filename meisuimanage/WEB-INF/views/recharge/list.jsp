<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>充值记录</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石</a></li>
					<li class="active"><strong>充值记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&f_uuid=${f_uuid}&o_id=${o_id}&nickname=${nickname}&type=${type}&pay_type=${pay_type}&platform_channel=${platform_channel}&is_pay=${is_pay}&start_time=${start_time}&end_time=${end_time}&operate_center_id=${operate_center_id}&agent_id=${agent_id}&pay_virtual=${pay_virtual}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">										
										<form action="${BASE_PATH}/recharge/list"
											autocomplete="off" method="get" id="search_form">
											<div class="row">
												<div class="col-sm-2" style="width:13%">
													<div class="form-group">
														<label class="control-label">订单编号</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${o_id}" name="o_id">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">房间号</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">支付方式</label>
														<div class="input-group"> <select
															name="pay_type" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="-1">所有</option>															
															<option value="0"<c:if test="${pay_type==0}"> selected="selected"</c:if>>支付宝</option>
															<option value="1"<c:if test="${pay_type==1}"> selected="selected"</c:if>>微信</option>
															<option value="2"<c:if test="${pay_type==2}"> selected="selected"</c:if>>苹果支付</option>
															<option value="3"<c:if test="${pay_type==3}"> selected="selected"</c:if>>扫码支付</option>
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
												
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">类型</label>
														<div class="input-group"> <select
															name="is_pay" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="1"<c:if test="${is_pay==1}"> selected="selected"</c:if>>已支付</option>															
															<option value="0"<c:if test="${is_pay==0}"> selected="selected"</c:if>>未支付或支付失败</option>
														</select>
														</div>
													</div>
												</div>
													<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">身份筛选</label>
														<div class="input-group">
															<select name="pay_virtual"class="form-control">
																<option value="-1">请选择身份</option>																
															<option value="1"<c:if test="${pay_virtual==1}"> selected="selected"</c:if>>会员用户</option>						
															<option value="0"<c:if test="${pay_virtual==0}"> selected="selected"</c:if>>普通用户</option>	
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
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
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
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})"
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
																<th class="text-center">订单编号</th>
																<th class="text-center">用户UID</th>
																<th class="text-center">用户房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">支付金额（元）</th>
																<th class="text-center">钻石</th>
																<th class="text-center">第三方交易单号</th>
																<th class="text-center">支付方式</th>
																<!-- <th class="text-center">渠道</th> -->
																<th class="text-center">所属运营中心</th>
																<th class="text-center">所属代理平台</th>
																<th class="text-center">所属推广员</th>
																<th class="text-center">支付时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${rechargeList}" var="recharge">
																<tr class="text-center">
																	<td>${recharge.o_id}</td>
																	<td><%-- <a href="${BASE_PATH}/userinfo/detail?id=${recharge.uid}">${recharge.uid}</a> --%>
																	${recharge.uid}
																	</td>
																	<td>${recharge.f_uuid}</td>
																	<td>${recharge.nickname}</td>
																	<td>${recharge.recharge_rmb}</td>
																	<td>${recharge.change_virtual}</td>
																	<td>${recharge.pay_trade_no}</td>
																	<td><c:if test="${recharge.is_pay==1}">${recharge.pay_type==0?"支付宝":recharge.pay_type==1?"微信":recharge.pay_type==2?"苹果支付":"扫码支付"}</c:if></td>
																	<!-- <td>
																		天香直播
																	</td> -->
																	<td>${recharge.operateName }</td>
																	<td>${recharge.agentName }</td>
																	<td>${recharge.proName }</td>
																	<td>${recharge.create_time}</td>
																</tr>
															</c:forEach>
																	        <tr class="text-center">
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
														        <tr class="text-center">
																	<td>总计:</td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td>${sumrecharge}</td>
																	<td>${sumvirtual}</td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
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
    	window.location.href = "${BASE_PATH}/recharge/exportexcel?&uid=${uid}&f_uuid=${f_uuid}&pay_type=${pay_type}&type=${type}&nickname=${nickname}&o_id=${o_id}&platform_channel=${platform_channel}&is_pay=${is_pay}&start_time=${start_time}&end_time=${end_time}&operate_centerid=${operate_center_id}&agent_id=${agent_id}";
}

$(function(){
	$("select[name=operate_center_id]").change(function(){
		var centerId = $(this).val();
		$.ajax({
			url:"${BASE_PATH}/recharge/agentlist",
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