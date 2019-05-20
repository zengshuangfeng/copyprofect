<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
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
				<h2>用户列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>用户列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&nickname=${nickname}&f_uuid=${f_uuid}&s_time=${s_time}&e_time=${e_time}&tel=${tel}&uid=${uid }"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/userinfo/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">											
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>										
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">用户房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="level">等级</label> <select
															name="level" id="level" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="">全部</option>
															<option value="1">1</option>
															<option value="1-10">1-10</option>
															<option value="11-20">11-20</option>
															<option value="21-30">21-30</option>
															<option value="31-40">31-40</option>
															<option value="41-50">41-50</option>
															<option value="51-60">51-60</option>
															<option value="61-70">61-70</option>
															<option value="71-80">71-80</option>
															<option value="81-90">81-90</option>
															<option value="91-100">91-100</option>
														</select>
													</div>
												</div>
													<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="sort">排序</label> <select
															name="sort" id="sort" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="0">请选择</option>
															<option value="1"<c:if test="${sort==1}"> selected="selected"</c:if>>钻石余额从高到低</option>
														</select>
													</div>
												</div>
												<div class="col-sm-2" style="width: 150px">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">备注</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${remark}"
																name="remark">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width: 150px">
													<div class="form-group">
														<label class="control-label">手机号码</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${tel}" name="tel">
														</div>
													</div>
												</div>
									
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">注册开始时间</label>
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
														<label class="control-label" for="date_modified">注册结束时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${e_time}" name="e_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
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
												<br/>
												<br/>
												<div class="col-sm-1" style="width:200px;clear:both">
													<div class="form-group">
														<div class="input-group">
																<input type="text" class="form-control" name="phone" placeholder="输入手机号">
														</div>
													</div>
												</div>												
												<div class="col-sm-2">
													<div class="form-group">
														<div class="input-group">
														 <a
															href="javascript:insertValid();"
															class="input-group">
															&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-w-m btn-primary">生成验证码</button>
														 </a>
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
																<!-- <th class="text-center">UID</th> -->
																<th class="text-center">用户UID</th>
																<th class="text-center">用户房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">真实姓名</th>
																<th class="text-center">所属运营中心</th>
																<th class="text-center">手机号码</th>																
																<th class="text-center">钻石余额</th>
																<th class="text-center">累计消费钻石数</th>
																<th class="text-center">等级</th>
																<th class="text-center">注册时间</th>
																<th class="text-center">是否开启为测试账号</th>																													
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userList}" var="user">
																<tr class="text-center">
																	<td>${user.id}</td>																	
																	<td>${user.f_uuid}</td>
																	<td><a
																		href="${BASE_PATH}/userinfo/detail?id=${user.id}">${user.nickname}</a></td>
																	
																	<td>${user.realname}</td>
																	<td>${user.operateName }</td>
																	<td>${user.tel }</td>
																	<td>${user.balance_virtual}</td>
																	<td>${user.total_spending}</td>
																	<td>${user.level}</td>
																	<td>${user.register_time}</td>
																	<td id="testtd"><c:choose>
																			<c:when test="${user.istest==0}">
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" class="onoffswitch-checkbox"
																						id="example${user.id}" value="${user.id}">
																					<label class="onoffswitch-label"
																						for="example${user.id}"> <span
																						class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>

																			</c:when>
																			<c:otherwise>
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" checked
																						class="onoffswitch-checkbox" 
																						id="example${user.id}" value="${user.id}">
																					<label class="onoffswitch-label"
																						for="example${user.id}"> <span
																						class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose></td>
																	<td>
																	<span class="actionclick" style="cursor:pointer">更多&nbsp;<i class="click-expand glyphicon glyphicon-plus"></i></span>
																	<div class="actiondiv">
																	<a
																		class="btn btn-xs btn-outline btn-success"
																		href="javascript:updateIsBlocked(${user.id},${user.is_blocked==1?0:1},'${user.nickname}')">${user.is_blocked==1?'取消封号':'封号'}</a><br/>
																		<a class="btn btn-xs btn-outline btn-success mt10"
																		href="javascript:updateHeadLock(${user.id},${user.head_lock==1?0:1},'${user.nickname}')">${user.head_lock==1?'解锁头像':'回归头像'}</a><br/>
																		<a class="btn btn-xs btn-outline btn-success mt10"
																		href="javascript:updateNicknameLock(${user.id},${user.nickname_lock==1?0:1},'${user.nickname}')">${user.nickname_lock==1?'解锁昵称':'回归昵称'}</a><br/>
																		
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

<div id="forbid-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<form id="forbid" action="${BASE_PATH}/userinfo/forbid" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<input type="hidden" class="form-control" name="uid">
							<input type="hidden" class="form-control" name="is_forbid" value="1">
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$('.i-checks').iCheck({
			checkboxClass : 'icheckbox_square-green',
			radioClass : 'iradio_square-green',
		});
		$("select[name=level]").find("option[value='${level}']").attr("selected", true);
		$("input").on('ifChecked', function(event) {
			if (event.target.defaultValue == "zftype1") {
				$("#zhifu-form").css('display', 'block');
				$("#jiazu-form").css('display', 'none');
			}
			if (event.target.defaultValue == "zftype2") {
				$("#jiazu-form").css('display', 'block');
				$("#zhifu-form").css('display', 'none');
			}
			if (event.target.defaultValue == "zftype3") {
				$("#jiazu-form").css('display', 'none');
				$("#zhifu-form").css('display', 'none');
			}
		});
		 $("#testtd .onoffswitch-checkbox").click(function() {
			var checked = $(this).prop("checked");
			var id = $(this).val();
		
				swal({
					title : "设置测试账号",
					text : checked ? "是否设为测试账号？" : "是否关闭测试账号？",
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
							url : "${BASE_PATH}/userinfo/updateistest",
							data : {
								id : id,
								istest : checked ? 1 : 0
							},
							success : function(data) {
								if (data > 0) {
									window.location.reload();
								}
							}
						});
					}
				});
		}); 		
	
		
		$("select[name=level]").find("option[value='${level}']").attr("selected", true);
		$("select[name=sort]").find("option[value='${sort}']").attr("selected", true);
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
		$("#open_form").validate({
			rules: {
				open_uid: {required:true}
			},
			messages: {
				open_uid: {required:"用户UID不能为空"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#open_form"), function(json){
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
	function updateIsBlocked(id, is_blocked, nickname) {
		swal({
			title : (is_blocked == 1 ? "确定将" : "解除") + nickname + "封号？",
			text : is_blocked == 1 ? "封号后用户将无法登陆应用" : "",
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
					url : "${BASE_PATH}/userinfo/updateisblocked",
					data : {
						id : id,
						is_blocked : is_blocked
					},
					success : function() {
						window.location.reload(true);
					}
				});

			}
		});
	}
	
	function forbid(uid) {
		$("#forbid-modal-form").modal('show');
		$("#forbid-modal-form").find("input[name=uid]").val(uid);
	}
	function openUser()
	{
		$("#open-modal-form").modal('show');
	}

	function cancelForbid(uid, nickname)
	{
		swal({
			title : "取消禁言",
			text :  "确认取消对用户"+nickname+"的禁言限制？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#1ab394",
			confirmButtonText : "确认",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({type: "POST",url:"${BASE_PATH}/userinfo/forbid",data: {uid:uid,is_forbid:0},success:function(data){
					window.location.reload();
				}});
			}
		});	
	}
	function cancelSmsLimit(uid, nickname)
	{
		swal({
			title : "重置短信限制",
			text :  "确认对用户"+nickname+"重置短信限制？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#1ab394",
			confirmButtonText : "确认",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({type: "POST",url:"${BASE_PATH}/userinfo/cancelsmslimit",data: {uid:uid},success:function(data){
					window.location.reload();
				}});
			}
		});	
	}
	function insertValid()
	{
		var phone = $("input[name=phone]").val();
		$.ajax({type: "POST",url:"${BASE_PATH}/userinfo/insertvalid",data: {phone:phone},success:function(data){
			alert("验证码："+data);
		}});
	}
	
	function updateHeadLock(id, head_lock, nickname) {
		swal({
			title : "",
			text : "确定要" + (head_lock == 1 ? "回归" : "解锁") + nickname + "头像？",
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
					url : "${BASE_PATH}/userinfo/updateheadlock",
					data : {
						id : id,
						head_lock : head_lock
					},
					success : function() {
						window.location.reload(true);
					}
				});

			}
		});
	}
	
	function updateNicknameLock(id, nickname_lock, nickname) {
		swal({
			title : "",
			text : "确定要" + (nickname_lock == 1 ? "回归" : "解锁") + nickname
					+ "昵称？",
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
					url : "${BASE_PATH}/userinfo/updatenicknamelock",
					data : {
						id : id,
						nickname_lock : nickname_lock
					},
					success : function() {
						window.location.reload(true);
					}
				});

			}
		});
	}
</script>