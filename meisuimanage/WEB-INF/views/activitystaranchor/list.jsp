<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<style type="text/css">
.actiondiv{display:none;position: absolute;background-color: #fff;z-index: 10;border: 1px solid #e7eaec;padding: 10px 20px 20px 20px;right: 0px;}
</style>
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
					<li class="active"><strong>参赛主播列表</strong></li>
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
									<div class="m-b-sm">
										<form action="${BASE_PATH}/activitystar/list" autocomplete="off" method="get" id="search">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}" name="nickname">
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
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger" href="${BASE_PATH}/activitystar/exportexcel?uid=${uid}&nickname=${nickname}">导出</a>
															</span>
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
																<th class="text-center">主播UID</th>
																<th class="text-center">主播昵称</th>
																<th class="text-center">运营中心</th>
																<th class="text-center">胜场</th>
																<th class="text-center">负场</th>
																<th class="text-center">总场</th>
																<th class="text-center">段位</th>
																<th class="text-center">排行</th>
																<th class="text-center">活动积分</th>
																<th class="text-center footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${activityList}" var="activityList">
																<tr class="text-center">
																	<td>${activityList.uid}</td>
																	<td>${activityList.nickname}</td>																	
																	<td>${activityList.operatename}</td>
																	<td>${activityList.win}</td>
																	<td>${activityList.lose}</td>
																	<td>${activityList.total}</td>
																	<td>
																	${activityList.gradingname}																
																	</td>
																	<td>${activityList.rank}</td>
																	<td>																
																	<c:if test="${activityList.count >0}">
																	<a href="javascript:editscore2()">${activityList.score}</a>	
																	</c:if>
																	<c:if test="${activityList.count==0}">
																		<a href="javascript:editscore(${activityList.id},${activityList.uid},${activityList.score},${activityList.count})">${activityList.score}</a>	
																	</c:if>															
																	</td>
																	<td>
																	<span class="actionclick"
																		style="cursor: pointer;">更多&nbsp;<i
																			class="click-expand glyphicon glyphicon-plus"></i></span>
																	<div class="actiondiv">
																	<a class="btn btn-xs btn-outline btn-success mt10" href="${BASE_PATH}/activitystar/starrecord?uid=${activityList.uid}&id=${activityList.id}">PK记录</a><br />
																		<c:if test="${activityList.count ==0}">
																			<a class="btn btn-xs btn-outline btn-success mt10" href="javascript:cancel(${activityList.id},${activityList.count})">取消参赛资格</a><br />
																		</c:if>
																		<c:if test="${activityList.count >0}">																			
																			<a class="btn btn-xs btn-outline btn-success mt10" href="javascript:editscore2()">取消参赛资格</a><br />
																		</c:if>
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
						<form id="editscore" action="${BASE_PATH}/activitystar/editscore" method="post">
							<input type="hidden" name="id"/>
							<input type="hidden" name="uid"/>
							<input type="hidden" name="count"/>
							<div class="form-group col-sm-13">
								<label class="col-sm-3 control-label text-right">现有活动积分：</label>
								<div class="col-sm-9">
									<label class="control-label" id="score"></label>
								</div>
							</div>
							<div class="form-group col-sm-13">
								<label class="col-sm-3 control-label text-right">编辑活动积分：</label>
								<div class="col-sm-9">
									<input type="text" name="addscore" class="form-control">
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
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
var jumpUrl = "${BASE_PATH}/activitystar/list"+window.location.search;
function editscore(id,uid, score,count) {
	$("#recharge-modal-form").modal('show');
	$("#recharge-modal-form").find("input[name=id]").val(id);
	$("#recharge-modal-form").find("input[name=uid]").val(uid);
	$("#recharge-modal-form").find("#score").text(score);
	$("#recharge-modal-form").find("input[name=count]").val(count);
}
function editscore2() {
	swal({ 
		  title: "PK中不可编辑", 
		  text: "请PK过后再进行编辑", 
		  type:"success",
		  timer: 1500, 
		  showConfirmButton: false 
		});
}


$(function() {
	$("#editscore").validate({
		rules : {
			addscore : {
				required : true,
				number:true
			}
		},
		messages : {
			addscore : {
				required : "活动积分不能为空",
				number : "活动积分只能是整数"
			}
		},
		submitHandler : function() {
			ajaxSubmit($("#editscore"),
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

function cancel(id,count){
	swal({
		title: "是否确认取消参赛资格", 
		text : "取消后活动积分清空，主播可重新申请",
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
				url : "${BASE_PATH}/activitystar/cancel",
				data : {
					id : id	,
					count:count
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
$(function(){	
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });	
});
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
</script>