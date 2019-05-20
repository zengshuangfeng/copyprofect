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
					<li class="active"><strong>运营列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&begin_time=${begin_time}&end_time=${end_time}&province_center_id=${province_center_id}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/operate/list"
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
											<div class="col-sm-3" style="width:230px">
													<div class="form-group">
														<label class="control-label">选择省代运营中心</label>
														<div class="input-group">
															<select name="province_center_id" class="form-control">
																<option value="0">请选择省代运营中心</option>
																<c:forEach items="${provinceCenterList}" var="provinceCenterList">
																	<option value="${provinceCenterList.id}"<c:if test="${provinceCenterList.id==province_center_id}"> selected="selected"</c:if>>${provinceCenterList.name}</option>
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
												<div class="col-sm-1" style="width:150px">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-primary" href="${BASE_PATH}/operate/add">添加运营中心</a>
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
																<th class="text-center">总邀请人</th>
																<th class="text-center">邀请人总充值</th>
																<th class="text-center">邀请人总送礼流水</th>
															</tr>
														</thead>
														<tbody>
															<tr class="text-center">
																<td>${total_invite}</td>
																<td>${total_recharge}</td>
																<td>${total_give}</td>
															</tr>
														</tbody>
													</table>
											<div class="ibox">
												<div class="ibox-content">
													<table id="cc"
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">运营中心ID</th>
																<th class="text-center">运营中心</th>
																<th class="text-center">所属省代运营中心</th>
																<th class="text-center">分成比例</th>
																<th class="text-center">结算类型</th>
																<th class="text-center">邀请人数</th>
																<th class="text-center">邀请用户总充值</th>
																<th class="text-center">邀请用户总送礼流水</th>
																<th class="text-center">直播累计所得魅力值</th>
																<th class="text-center">推广累计所获魅力值</th>	
																<th class="text-center">充值额度</th>															
																<th class="text-center">入驻时间</th>
																<th class="text-center">备注</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody id="agent_table">
															<c:forEach items="${list}" var="center" varStatus="status">
																<tr class="text-center">
																	<td id="${center.id}">${center.id}</td>
																	<td>${center.name}</td>
																	<td>${center.province_center_name }</td>
																	<td>${center.divide}%</td>
																	<td>${center.settlement_type == 0?'周结':'日结' }</td>
																	<td>${center.publicEntity.invite_Count}</td>
																	<td>${center.publicEntity.invite_Total_Recharge}</td>
																	<td>${center.publicEntity.invite_Total_Give}</td>
																	<td>${center.publicEntity.live_Total_Glamour}</td>
																	<td>${center.publicEntity.spread_Total_Glamour}</td>
																	<td>${center.recharge_quota }</td>																
																	<td><fmt:formatDate value="${center.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																	<td>${center.remark}</td>
																	<td><span class="actionclick" style="cursor:pointer">更多&nbsp;<i class="click-expand glyphicon glyphicon-plus"></i></span>
																	<div class="actiondiv">
																		<a href="${BASE_PATH}/operate/profit?centerId=${center.id}" class="btn btn-xs btn-outline btn-success mt10">运营中心魅力值收益明细</a><br/>																		
																		<a href="${BASE_PATH}/operate/agent?centerId=${center.id}" class="btn btn-xs btn-outline btn-success mt10">查看下属代理</a><br/>
																		<a class="btn btn-xs btn-outline btn-success mt10" href="${BASE_PATH}/operate/edit?centerId=${center.id}">编辑信息</a><br/>
																		<a href="${BASE_PATH}/operate/centerinvites?centerId=${center.id}" class="btn btn-xs btn-outline btn-success mt10">查看全部邀请用户</a><br/>
																		<a href="javascript:updateIsForbid(${center.id},${center.is_forbid==1?0:1})" class="btn btn-xs btn-outline btn-danger mt10">${center.is_forbid==1?'取消禁用':'禁用'}</a><br/>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script type="text/javascript">
	function saveRemark(){
		var begin_time = $("#begin_time").val();
		var end_time = $("#end_time").val();
		var remark = $("#remark").val();
		if(begin_time != '' && end_time != ''){
			$.ajax({
				url:"/operate/saveremark",
				type:"post",
				data:{"begin_time" : begin_time, "end_time" : end_time , "remark" : remark},
				dataType:"json",
				success:function(data){
					if(data == 1){
						swal({ 
							  title: "批量备注！", 
							  text: "保存成功", 
							  type:"success",
							  timer: 2000, 
							  showConfirmButton: false 
							});
						window.location.reload();
					}else{
						swal({ 
							  title: "批量备注！", 
							  text: "保存失败", 
							  type:"error",
							  timer: 2000, 
							  showConfirmButton: false 
							});
					}
					
				}
			})
		}
	}

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
});

function updateIsForbid(id, is_forbid) {
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
					url : "${BASE_PATH}/operate/updateisforbid",
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
	    	window.location.href = "${BASE_PATH}/operate/excel?begin_time=${begin_time}&end_time=${end_time}&province_center_id=${province_center_id}";
	}
	
</script>
