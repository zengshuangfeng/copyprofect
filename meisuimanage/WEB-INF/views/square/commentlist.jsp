<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>评论监控</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>监控管理</a></li>
					<li class="active"><strong>评论监控</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&second=${second}&uid=${uid}&f_uuid=${f_uuid}&comment=${comment}&date=${date}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">										
										<form action="${BASE_PATH}/comment/list" autocomplete="off" method="get" id="square_form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">刷新时间</label>
														<div class="input-group">
															<select name="second" class="form-control"
																onchange="$('#square_form').submit()">
																<option value="0">不刷新</option> 
																<option value="5"<c:if test="${second==5}"> selected="selected"</c:if>>5S</option>
																<option value="10"<c:if test="${second==10}"> selected="selected"</c:if>>10S</option>
																<option value="20"<c:if test="${second==20}"> selected="selected"</c:if>>20S</option>
																<option value="30"<c:if test="${second==30}"> selected="selected"</c:if>>30S</option>
																<option value="60"<c:if test="${second==60}"> selected="selected"</c:if>>60S</option>
															</select>
														</div>
													</div>
												</div>	
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid!=null?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${f_uuid!=null?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>	
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">评论内容</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${comment}" name="comment">
														</div>
													</div>
												</div>	
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">评论日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${date}" name="date"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
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
																<th class="text-center">用户ID</th>
																<th class="text-center">用户昵称</th>
																<th class="text-center">所在房间号</th>
																<th class="text-center">所在房间</th>
																<th class="text-center">评论内容</th>
																<th class="text-center">评论时间</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${chatList}" var="chat">
																<tr class="text-center">
																	<td>${chat.uid}</td>
																	<td>${chat.nickname}</td>
																	<td>${chat.anchor_f_uuid}</td>
																	<td>${chat.anchor_name}
																	<c:choose>
																	<c:when test="${chat.sleep==true}"><span class="label label-success">休息</span></c:when>
																	<c:otherwise><span class="label label-primary">直播中</span></c:otherwise>
																	</c:choose></td>
																	<td>${chat.msg}</td>
																	<td>${chat.time}</td>
																	<td>
																	<c:choose>
																	<c:when test="${chat.is_forbid==true}">
																	<a class="btn btn-xs btn-outline btn-primary" href="javascript:cancelForbid(${chat.uid},'${chat.nickname}')">解禁</a>
																	</c:when>
																	<c:otherwise><a class="btn btn-xs btn-outline btn-danger" href="javascript:forbid(${chat.uid},'${chat.nickname}')">禁言</a></c:otherwise>
																	</c:choose>
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
<div id="forbid-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<form id="forbid" action="${BASE_PATH}/square2/saveforbid" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<input type="hidden" name="uid"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">用户昵称：</label>
								<div class="col-sm-6">
									<label id="forbid_nickname"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">禁言类型：</label>
								<div class="col-sm-8">
									<div class="radio radio-info radio-inline">
										<input type="radio" value="1" name="hour"
											checked="checked" /> <label for="inlineRadio1">&nbsp;禁言1小时</label>
									</div>
									<div class="radio radio-inline">
										<input type="radio" value="24" class="ml15" name="hour" />
										<label for="inlineRadio2">&nbsp;禁言24小时</label>
									</div>
									<div class="radio radio-inline">
										<input type="radio" value="0" class="ml15" name="hour" />
										<label for="inlineRadio2">&nbsp;永久禁言</label>
									</div>
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		var time=parseInt($("select[name=second]").val());
		if(time>0){
			setTimeout(function(){
	  			location.reload();
	  		},time*1000);
		}
		$("#forbid").validate({
			submitHandler: function(){
		        ajaxSubmit($("#forbid"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
		        		window.location.reload();
		        });
	        	return false;
	    	}
		});
	});
	function cancelForbid(uid, nickname)
	{
		swal({
			title : "取消禁言",
			text : "确认取消对用户"+nickname+"的禁言限制？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#1ab394",
			confirmButtonText : "确认",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({type: "POST",url:"${BASE_PATH}/square2/cancelforbid",data: {uid:uid},success:function(data){
					window.location.reload();
				}});
			}
		});	
	}
	function forbid(uid, nickname)
	{
		$("#forbid-modal-form").find("input[name=uid]").val(uid);
		$("#forbid-modal-form").find("#forbid_nickname").text(nickname);
		$("#forbid-modal-form").modal('show');
	}
</script>