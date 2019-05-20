<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>游戏调控设置</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>游戏调控管理</a></li>
					<li class="active"><strong><a>游戏调控设置</a></strong></li>
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
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">游戏类型</th>
																<th class="text-center">房间池上限</th>
																<th class="text-center">房间池下限</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${gameCapitalList}" var="gameCapital">
																<tr class="text-center">
																	<td><c:choose>
																	<c:when test="${gameCapital.sign==0}">牛牛</c:when>
																	<c:when test="${gameCapital.sign==1}">扎金花</c:when>
																	<c:when test="${gameCapital.sign==2}">猫和老鼠</c:when>
																	<c:when test="${gameCapital.sign==3}">海盗船</c:when>
																	<c:when test="${gameCapital.sign==4}">水果机</c:when>
																	</c:choose></td>
																	<td>${gameCapital.upper_limit}</td>
																	<td>${gameCapital.lower_limit}</td>
																	<td><a class="btn btn-xs btn-outline btn-primary" href="javascript:showEdit(${gameCapital.id},${gameCapital.upper_limit},${gameCapital.lower_limit})">编辑</a></td>
																</tr>
															</c:forEach>
														</tbody>
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
<div id="edit-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">编辑</h3>
						<form id="edit" action="${BASE_PATH}/gamecapital/save" method="post">
							<input type="hidden" name="id" />
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">房间池上线：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="upper_limit">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">房间池下线：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="lower_limit">
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
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
var jumpUrl = "${BASE_PATH}/gamecapital/list";
	$().ready(function() {
		$("#edit").validate({
			rules: {
				upper_limit: {required:true},
				lower_limit: {required:true}
			},
			messages: {
				upper_limit: {required:"房间池下限不能为空"},
				lower_limit: {required:"房间池下限不能为空"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#edit"), function(json){
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
	function showEdit(id, upper_limit, lower_limit)
	{
		$("#edit-modal-form").find("input[name=id]").val(id);
		$("#edit-modal-form").find("input[name=upper_limit]").val(upper_limit);
		$("#edit-modal-form").find("input[name=lower_limit]").val(lower_limit);
		$("#edit-modal-form").modal('show');

	}
</script>
   