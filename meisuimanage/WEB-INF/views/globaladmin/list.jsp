<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>管理员列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>管理员列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label> <a
														href="#add-modal-form" data-toggle="modal" 
														class="input-group">
														<button type="button" class="btn btn-w-m btn-primary">添加</button>
													</a>
												</div>
											</div>
											<div class="col-sm-8" style="color: red;margin-top: 31px;">
											            功能说明：添加某用户成为管理员后，该管理员可用手机在直播间巡逻中，快速禁言那些违规的用户。	
											</div>
										</div>
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
																<th class="text-center">UID</th>
																<th class="text-center">昵称</th>
																<th class="text-center">头像</th>
																<th class="text-center">操怍</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userAdminList}" var="userAdmin">
																<tr class="text-center">
																	<td>${userAdmin.uid}</td>
																	<td>${userAdmin.nickname}</td>
																	<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty userAdmin.head}">
																				<img class="col-xs-12"
																					src="${fn:startsWith(userAdmin.head,'http')?'':uploadUrl}${userAdmin.head}" />
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																	<td><a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteAdmin(${userAdmin.id})">删除</a></td>
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
						<form id="add" action="${BASE_PATH}/globaladmin/save" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">UID：</label>
								<div class="col-sm-6">
									<input type="text" name="uid" class="form-control"/>
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	function deleteAdmin(id) {
		deleteConfirm(id, "${BASE_PATH}/globaladmin/delete", "该信息");
	}
	$(function(){
		$("#add").validate({
			rules: {
				uid: {required:true,digits:true}
			},
			messages: {
				uid: {required:"uid不能为空",digits:"uid只能是正整数"}
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
</script>