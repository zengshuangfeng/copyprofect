<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>最强新星</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>最强新星</a></li>
					<li class="active"><strong>参赛主播列表/PK记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&nickname=${nickname}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">					
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">PK时间</th>
																<th class="text-center">PK对象</th>
																<th class="text-center">状态</th>
																<th class="text-center">当前段位</th>
																<th class="text-center">PK获得的活动积分</th>
																<th class="text-center">PK对象获得的活动积分</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${competionList}" var="competionList">
																<tr class="text-center">
																	<td>
																	<fmt:formatDate value="${competionList.start_time}"  pattern="MM月dd HH:mm"></fmt:formatDate> 
																	-
																	<fmt:formatDate value="${competionList.end_time}"  pattern="MM月dd HH:mm"></fmt:formatDate> 
																	</td>
																	<td>${competionList.nickname}</td>																	
																	<td>
																	<c:if test="${competionList.status==0}">未开始</c:if>
																	<c:if test="${competionList.status==1}">进行中</c:if>
																	<c:if test="${competionList.status==2}">已结束</c:if>
																	<c:if test="${competionList.status==3}">已取消</c:if>
																	</td>
																	<td>
																	${competionList.gradingname}
																	</td>
																	<td>${competionList.winscore}</td>	
																	<td>${competionList.pkwinscore}</td>														
																	<td class="text-center footable-last-column">
																	<c:if test="${competionList.status==0}">
																	<a class="btn btn-xs btn-outline btn-primary"
																		href="javascript:cancelone(${competionList.id})">取消本场</a>
																	</c:if>
																	<c:if test="${competionList.status==0}">
																	<a class="btn btn-xs btn-outline btn-primary"
																		href="javascript:edittime(${competionList.id},${competionList.status},'<fmt:formatDate value="${competionList.start_time}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>' ,'<fmt:formatDate value="${competionList.end_time}"  pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>' )">编辑PK时间</a>
																	</c:if>
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
<div id="recharge-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>			
						<h3 class="m-t-none m-b">&nbsp;</h3>			
						<form id="edittime" action="${BASE_PATH}/activitystar/edittime" method="post">
							<input type="hidden" name="id"/>
							<input type="hidden" name="status"/>
						<div class="form-group col-sm-13">
							<label class="col-sm-3 control-label text-right">PK开始时间：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="" name="start_time"
									onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',startDate:'%y-%M-%d 00:00'})">
								</div>																						
						</div>	
						<br/>
						<div class="form-group col-sm-13">
							<label class="col-sm-3 control-label text-right">PK结束时间：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="" name="end_time"
									onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',startDate:'%y-%M-%d 00:00'})">
								</div>																						
						</div>	
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">&nbsp;</label>
								<div class="col-sm-9">
									&nbsp;
								</div>
							</div>		
							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									data-dismiss="modal">取消</button>
							</div>
							<div class="col-sm-2">
								<button class="btn btn-primary pull-right" type="submit">
									<strong>确定</strong>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script type="text/javascript">
var jumpUrl = "${BASE_PATH}/activitystar/starrecord"+window.location.search;
function cancelone(id){
	swal({
		title: "", 
		text : "是否确认取消本场",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#1ab394",
		confirmButtonText : "确认",
		cancelButtonText : "取消",
		closeOnConfirm : true,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			$.ajax({
				type : "POST",
				url : "${BASE_PATH}/activitystar/cancelone",
				data : {
					id : id				
				},
				success : function(data) {
					if (data > 0) {
						window.location.reload();
					}
				}
			});
		}else{
			window.location.reload();
		}
	});
}

function edittime(id,status, start_time,end_time) {
	$("#recharge-modal-form").modal('show');
	$("#recharge-modal-form").find("input[name=id]").val(id);
	$("#recharge-modal-form").find("input[name=status]").val(status);
	$("#recharge-modal-form").find("input[name=start_time]").val(start_time);
	$("#recharge-modal-form").find("input[name=end_time]").val(end_time);
}
$(function() {
	$("#edittime").validate({
		rules : {
			start_time : {
				required : true
			},
			end_time:{required : true}
		},
		messages : {
			start_time : {
				required : "PK开始时间不能为空"
			},
			end_time:{
				required : "PK结束时间不能为空"
			}
		},
		submitHandler : function() {
			ajaxSubmit($("#edittime"),
				function(json) {
					if (json.code == -3) {
						for (var key in json.msg) {
							$("*[name="+ json.msg[key].name + "]").addClass("error");
							$("*[name="+ json.msg[key].name + "]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+ json.msg[key].value+ "</label>");
						}
					} else
						if(json.code==-1){
							show(json, jumpUrl);
						}else{
							window.location.reload();
						}
						
				});
			return false;
		}
	});
});
</script>