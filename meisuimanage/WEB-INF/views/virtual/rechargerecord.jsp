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
			<h2>会员管理</h2>
				<ol class="breadcrumb">
					<li><a href="#">会员管理</a></li>
					<li class="active"><strong>会员充值记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&begin_time=${begin_time}&end_time=${end_time}&uid=${uid}&f_uuid=${f_uuid}&operate_centerid=${operate_centerid}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/virtual/virtualrechargerecord"
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
														<label class="control-label">运营中心</label>
														<div class="input-group"> <select
															name="operate_centerid" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="0">请选择运营中心</option>		
																<c:forEach items="${operate}" var="operate">
															<option value="${operate.id}"<c:if test="${operate.id==operate_centerid}"> selected="selected"</c:if>>${operate.name}</option>
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
												<!-- 	<div class="col-sm-1">
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
												</div>	 -->							
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
																<th class="text-center">用户UID</th>
																<th class="text-center">用户房间号</th>																
																<th class="text-center">昵称</th>
																<th class="text-center">充值数额</th>
																<th class="text-center">所属运营中心</th>
																<th class="text-center">充值时间</th>
																<th class="text-center">充值人</th>
															</tr>
														</thead>
														<tbody id="agent_table">
															<c:forEach items="${list}" var="list" varStatus="status">
																<tr class="text-center">
																	<td id="${list.uid}">${list.uid}</td>
																	<td>${list.f_uuid}</td>
																	<td>${list.nickname}</td>
																	<td>${list.virtual_count}</td>
																	<td>${list.operate_name}</td>
																	<td>
																	<fmt:formatDate value="${list.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
																	</td>
																	<td>${list.w_name}</td>
																	<td></td>
																	
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
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
	    	window.location.href = "${BASE_PATH}/virtual/rechargerecordexcel?begin_time=${begin_time}&end_time=${end_time}&uid=${uid}&f_uuid=${f_uuid}&operate_centerid=${operate_centerid}";
	}
</script>
