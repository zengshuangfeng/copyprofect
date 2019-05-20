<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>权限管理<</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>视频管理</a></li>
					<li class="active"><strong>权限管理</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&nickname=${nickname}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/videoadmin/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">
												<div class="col-sm-2" style="width:200px">
													<div class="form-group">
														<label class="control-label">审核员</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname" placeholder="搜索审核员">
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
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="javascript:add();" 
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加</button>
														</a>
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
																<th class="text-center">审核员编号</th>
																<th class="text-center">审核员</th>
																<th class="text-center">状态</th>
																<th class="text-center">历史审核数量</th>
																<th class="text-center">操作</th>
																<th class="text-center">操作人</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${videoAdminList}" var="videoAdmin">
																<tr class="text-center">
																	<td>${videoAdmin.id}</td>
																	<td>${videoAdmin.nickname}</td>
																	<td>${videoAdmin.is_close==0?'正常':'已关闭'}</td>
																	<td>${videoAdmin.video_count}</td>
																	<td><a class="btn btn-xs btn-outline btn-success" href="javascript:close(${videoAdmin.id},${videoAdmin.is_close==0?1:0})">${videoAdmin.is_close==0?'关闭权限':'开启权限'}</a>
																	<a class="btn btn-xs btn-outline btn-primary" href="javascript:edit(${videoAdmin.id},'${videoAdmin.nickname}', '${videoAdmin.username}')">编辑</a></td>
																	<td>${videoAdmin.w_name}</td>																												
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
<div id="add-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">添加审核员</h3>
						<form id="add" action="${BASE_PATH}/videoadmin/save" method="post">		
							<input name="id" type="hidden" value="0"/>					
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">姓名：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="nickname">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">账号：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="username">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">密码：</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="password">
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#add").validate({
			rules: {
				nickname: {required:true,maxlength:30},
				username: {required:true,maxlength:30},
				password: {minlength:6,maxlength:30}
			},
			messages: {
				nickname: {required:"姓名不能为空",maxlength:"姓名长度不能大于30个字"},
				username: {required:"账号不能为空",maxlength:"账号长度不能大于30个字"},
				password: {minlength:"账号长度不能小于6个字",maxlength:"账号长度不能大于30个字"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#add"), function(json){
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
	function close(id, is_close)
	{
		swal({
			title : "",
			text : "确定要"+(is_close==0?"开启权限？":"关闭权限？"),
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : false,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({type: "POST",url:"${BASE_PATH}/videoadmin/close",data:{id:id,is_close:is_close},success:function(data){
					window.location.reload(true);
				}});

			}
		});
	}
	function add()
	{
		$("#add-modal-form").modal('show');
		$("#add-modal-form").find("h3").text("添加审核员");
		$("#add-modal-form").find("input[name=id]").val(0);
		$("#add-modal-form").find("input[name=nickname]").val('');
		$("#add-modal-form").find("input[name=username]").val('');
		$("#add-modal-form").find("input[name=password]").attr("placeholder","");
	}
	function edit(id, nickname, username) {
		$("#add-modal-form").modal('show');
		$("#add-modal-form").find("h3").text("编辑审核员");
		$("#add-modal-form").find("input[name=id]").val(id);
		$("#add-modal-form").find("input[name=nickname]").val(nickname);
		$("#add-modal-form").find("input[name=username]").val(username);
		$("#add-modal-form").find("input[name=password]").attr("placeholder","不修改请留空");
	}
</script>