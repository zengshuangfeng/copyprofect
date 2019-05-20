<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>会员送礼记录</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>会员管理</a></li>
					<li class="active"><strong>会员送礼记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&s_time=${s_time}&e_time=${e_time}&gift_id=${gift_id}&gift_name=${gift_name}&is_online=${is_online}&uid=${uid}&send_uid=${send_uid}&re_operate_center_id=${re_operate_center_id }&send_operate_center_id=${send_operate_center_id}&re_agent_id=${re_agent_id }&send_agent_id=${send_agent_id}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/virtual/giftrecord"
											autocomplete="off" method="get" id="form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">收礼方UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>	
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">送礼方UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${send_uid>0?send_uid:''}" name="send_uid">
														</div>
													</div>
												</div>								
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">礼物ID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${gift_id>0?gift_id:''}" name="gift_id">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">礼物名称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${gift_name}" name="gift_name">
														</div>
													</div>
												</div>
															
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
													<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">收礼方运营中心</label>
														<div class="input-group">
															<select name="re_operate_center_id"class="form-control">
																<option value="0">请选择运营中心</option>
																<c:forEach items="${operateCenterList}" var="operateCenter">
																	<option value="${operateCenter.id}"<c:if test="${operateCenter.id==re_operate_center_id}"> selected="selected"</c:if>>${operateCenter.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>	
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">收礼所属方代理</label>
														<div class="input-group">
															<select name="re_agent_id"class="form-control">
																<option value="0">请选择代理</option>
																<c:forEach items="${ReagentList}" var="agent">
																	<option value="${agent.id}"<c:if test="${agent.id==re_agent_id}"> selected="selected"</c:if>>${agent.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												
															<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">送礼方运营中心</label>
														<div class="input-group">
															<select name="send_operate_center_id"class="form-control">
																<option value="0">请选择运营中心</option>
																<c:forEach items="${operateCenterList}" var="operateCenter">
																	<option value="${operateCenter.id}"<c:if test="${operateCenter.id==send_operate_center_id}"> selected="selected"</c:if>>${operateCenter.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>	
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label">送礼方所属代理</label>
														<div class="input-group">
															<select name="send_agent_id"class="form-control">
																<option value="0">请选择代理</option>
																<c:forEach items="${SendagentList}" var="agent">
																	<option value="${agent.id}"<c:if test="${agent.id==send_agent_id}"> selected="selected"</c:if>>${agent.name}</option>
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
										 	
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <label
															class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn"> <a
																class="btn btn-danger"
																href="javascript:exportExcel();">导出</a>
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
																<th class="text-center">礼物ID</th>
																<th class="text-center">礼物名</th>
																<th class="text-center">礼物单价（钻石）</th>	
																<th class="text-center">收礼方所属运营中心</th>	
																<th class="text-center">收礼方所属代理</th>											
																<th class="text-center">收礼方UID</th>
																<th class="text-center">收礼方房间号</th>
																<th class="text-center">送礼方所属运营中心</th>	
																<th class="text-center">送礼方所属代理</th>
																<th class="text-center">送礼方UID</th>
																<th class="text-center">送礼方房间号</th>														
																<th class="text-center">送礼方等级</th>															
																<th class="text-center">送礼时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${virtualList}" var="virtuallist">
																<tr class="text-center">
																	<td>${virtuallist.gift_id}</td>
																	<td>
																	<c:if test="${virtuallist.is_box==0}">
																	<c:if test="${virtuallist.is_guard==0}">
																	${virtuallist.gift_name}
																	</c:if>
																	<c:if test="${virtuallist.is_guard==1}">
																	${virtuallist.gift_name}(守护)
																	</c:if>																	
																	</c:if>
																	<c:if test="${virtuallist.is_box==1}">${virtuallist.gift_name}(宝箱)</c:if>
																	</td>
																	<td>${virtuallist.gift_virtual}</td>
																	<td>${virtuallist.re_operate_name}</td>
																	<td>${virtuallist.re_agent_name}</td>															
																	<td>(${virtuallist.rev_nickname})&nbsp;<a href="${BASE_PATH}/userinfo/detail?id=${virtuallist.uid}">${virtuallist.uid}</a></td>
																	<td>${virtuallist.rev_f_uuid}</td>
																	<td>${virtuallist.send_operate_name}</td>
																	<td>${virtuallist.send_agent_name}</td>
																	<td>(${virtuallist.send_nickname})&nbsp;<a href="${BASE_PATH}/userinfo/detail?id=${virtuallist.send_uid}">${virtuallist.send_uid}</a></td>
																    <td>${virtuallist.send_f_uuid}</td>														
																    <td>${virtuallist.send_level}</td>
																    <td>															    
																    <fmt:formatDate value="${virtuallist.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
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
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">

	function getDays()
	{
		var sDate1 = $("input[name=s_time]").val();
		var sDate2 = $("input[name=e_time]").val();
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
	
	function exportExcel()
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
	    	window.location.href = "${BASE_PATH}/virtual/exportexcel?&s_time=${s_time}&e_time=${e_time}&gift_id=${gift_id}&gift_name=${gift_name}&is_online=${is_online}&uid=${uid}&send_uid=${send_uid}&re_operate_center_id=${re_operate_center_id }&send_operate_center_id=${send_operate_center_id}&re_agent_id=${re_agent_id }&send_agent_id=${send_agent_id}";
	}
	
	$(function(){
		$("select[name=send_operate_center_id]").change(function(){
			var centerId = $(this).val();
			$.ajax({
				url:"${BASE_PATH}/virtual/agentlist",
				data:{centerId:centerId},
				success:function(data){
					var agentId = ${send_agent_id};
					var optionStr = '<option value="0">请选择代理</option>';
					for(var key in data.list){
						optionStr += '<option value="'+data.list[key].id+'">'+data.list[key].name+'</option>';
					}
					$("select[name=send_agent_id]").html(optionStr);
				}
			})
		});
	});
	
	$(function(){
		$("select[name=re_operate_center_id]").change(function(){
			var centerId = $(this).val();
			$.ajax({
				url:"${BASE_PATH}/virtual/agentlist",
				data:{centerId:centerId},
				success:function(data){
					var agentId = ${re_agent_id};
					var optionStr = '<option value="0">请选择代理</option>';
					for(var key in data.list){
						optionStr += '<option value="'+data.list[key].id+'">'+data.list[key].name+'</option>';
					}
					$("select[name=re_agent_id]").html(optionStr);
				}
			})
		});
	});
</script>