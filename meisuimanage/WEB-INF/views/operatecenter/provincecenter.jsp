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
			<h2>代理管理</h2>
				<ol class="breadcrumb">
					<li><a href="#">省代管理</a></li>
					<li class="active"><strong>省代列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&provice_center_name=${provice_center_name }&provice_center_id=${provice_center_id}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/provincecenter/list"
											autocomplete="off" method="get" id="search_form">
											<%-- <input type="hidden" name="centerId" value="${centerId}"/> --%>
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">省代ID</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${province_center_id==0?'':province_center_id}" name="province_center_id">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">省代名称</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${province_center_name}" name="province_center_name">
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
													<div class="col-sm-1" style="width:150px">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-primary" href="${BASE_PATH}/provincecenter/add">添加省代运营中心</a>
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
																<th class="text-center">省代运营ID</th>
																<th class="text-center">省代运营名称</th>
																<th class="text-center">状态</th>
																<th class="text-center">入驻时间</th>
																<th class="text-center">备注</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody id="agent_table">
															<c:forEach items="${provincelist}" var="provincelist">
																<tr class="text-center">
																	<td>${provincelist.id }</td>
																	<td>${provincelist.name}</td>														
																	<td>
																	<c:if test="${provincelist.is_forbid==1}">
																		<span class="label label-danger">禁用</span>
																	</c:if> 
																	<c:if test="${provincelist.is_forbid==0}">
																		<span class="label label-primary">正常</span>
																	</c:if>
																	</td>
																	<td>
																	<fmt:formatDate value="${provincelist.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
																	</td>
																	<td>${provincelist.remark }</td>																
																	<td><span class="actionclick" style="cursor:pointer">更多&nbsp;<i class="click-expand glyphicon glyphicon-plus"></i></span>
																	<div class="actiondiv">																		
																		<a class="btn btn-xs btn-outline btn-success mt10" href="${BASE_PATH}/provincecenter/edit?province_center_id=${provincelist.id}">编辑信息</a><br/>
																		<a href="${BASE_PATH}/operate/list?province_center_id=${provincelist.id}" class="btn btn-xs btn-outline btn-success mt10">查看下属运营中心</a><br/>
																		<a href="javascript:updateProviceIsonline(${provincelist.id},${provincelist.is_forbid==1?0:1})" class="btn btn-xs btn-outline btn-danger mt10">${provincelist.is_forbid==1?'取消禁用':'禁用'}</a><br/>
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

function updateProviceIsonline(id, is_forbid) {
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
					url : "${BASE_PATH}/provincecenter/updateprovinceisonline",
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
