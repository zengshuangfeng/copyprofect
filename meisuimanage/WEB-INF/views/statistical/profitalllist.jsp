<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
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
				<h2>个人收益明细</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li class="active"><strong>个人收益明细</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&operate_center_id=${operate_center_id}&agent_id=${agent_id}&type=${type}&f_uuid=${f_uuid}&nickname=${nickname}&s_time=${s_time}&e_time=${e_time}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/statistical/profitalllist"
											autocomplete="off" method="get" id="search_form">
											<div class="row">
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
												<div class="col-sm-2" style="width: 120px">
													<div class="form-group">
														<label class="control-label">类型</label>
														<div class="input-group">
															<select name="type" class="form-control">
																<option value="-1"<c:if test="${type==-1}"> selected="selected"</c:if>>全部</option>
																<option value="0"<c:if test="${type==0}"> selected="selected"</c:if>>主播</option>
																<option value="1"<c:if test="${type==8}"> selected="selected"</c:if>>推广员</option>																
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">收益房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width: 150px">
													<div class="form-group">
														<label class="control-label">收益昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">选择时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${s_time}" name="s_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="开始时间">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">&nbsp;</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${e_time}" name="e_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text"  placeholder="结束时间">
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
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">收益房间号</th>
																<th class="text-center">收益昵称</th>
																<th class="text-center">直播所得魅力值</th>
																<th class="text-center">推广所得魅力值</th>																
																<th class="text-center">礼物名称</th>
																<th class="text-center">礼物价值（钻）</th>
																<th class="text-center">送礼房间号</th>
																<th class="text-center">送礼昵称</th>
																<th class="text-center">送礼时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${profitList}" var="profit">
																<tr class="text-center">
																	<td>${profit.f_uuid}</td>
																	<td>${profit.nickname}</td>
																	<td>${profit.type==0?profit.gift_virtual:profit.type==9?profit.gift_virtual:0}</td>
																	<td>${profit.type==8?profit.gift_virtual:profit.type==10?profit.gift_virtual:0}</td>															
																	<td>																
																	<c:if test="${profit.is_box==0}">${profit.gift_name}</c:if>
																	<c:if test="${profit.is_box==1}">${profit.gift_name}(宝箱)</c:if>
																	</td>
																	<td>${profit.gift_original_virtual}</td>
																	<td>${profit.send_f_uuid }</td>
																	<td>${profit.send_nickname }</td>
																	<td>${profit.create_time}</td>
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
/* 	function exportprofit(s_time,e_time){
		if(s_time==null || s_time == '' || e_time == null || e_time == ''){
			sweetAlert("选择时间段搜索后再导出！", "","error");
		}else{
			window.location.href="${BASE_PATH}/statistical/exportprofitall?agent_id=${agent_id}&type=${type}&f_uuid=${f_uuid}&nickname=${nickname}&s_time=${s_time}&e_time=${e_time}"
		}
	} */
	$(function(){
		$("select[name=operate_center_id]").change(function(){
			var centerId = $(this).val();
			$.ajax({
				url:"${BASE_PATH}/statistical/agentlist",
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
	    	window.location.href="${BASE_PATH}/statistical/exportprofitall?agent_id=${agent_id}&type=${type}&f_uuid=${f_uuid}&nickname=${nickname}&s_time=${s_time}&e_time=${e_time}";
	}
	
</script>