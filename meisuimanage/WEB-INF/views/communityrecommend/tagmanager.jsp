<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>标签管理</h2>
				<ol class="breadcrumb">
					<li>社区</li>
					<li><a>标签管理</a></li>
					<li class="active"><strong>标签列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&name=${name}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/community/tagmanager"
											autocomplete="off" method="get" id="search">
											<div class="row">										
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">标签名称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${name}" name="name">
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
													<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label> 
													<a	data-toggle="modal"  class="input-group">
														<button type="button" class="btn btn-w-m btn-primary" id="addtag">添加</button>
													</a>
												</div>
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
																<th class="text-center">标签ID</th>																
																<th class="text-center">标签名称</th>														
																<th class="text-center">编辑人员</th>															
																<th class="text-center">创建时间</th>
																<th class="text-center">更新时间</th>								
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${taglist}" var="taglist">
																<tr class="text-center">
																	<td>${taglist.id}</td>
																	<td>${taglist.name}</td>																	
																	<td >
																	${taglist.w_name }
                           											</td>	
																	<td>															
																	<fmt:formatDate value="${taglist.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
																	</td>																																													
																	<td><fmt:formatDate value="${taglist.update_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
																	<td class="text-right footable-last-column">																	
																	<a class="btn btn-xs btn-outline btn-primary"
																		href="javascript:editTag(${taglist.id}, '${taglist.name}')">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteComment(${taglist.id})">删除</a><br></td>
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
<div id="change-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<form id="change" action="${BASE_PATH}/community/tagmanager/save" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<input type="hidden" name="id">
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">标签名称：</label>
								<div class="col-sm-6">
							<input type="text" name="tagname" class="form-control"/>
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

	function deleteComment(id) {
		deleteConfirm(id, "${BASE_PATH}/community/tagmanager/delete", "该信息");
	}
	$("#change").validate({
		submitHandler: function(){
	        ajaxSubmit($("#change"), function(json){
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
	
	function editTag(id, name) {
		$("#change-modal-form").modal('show');
		$("input[name=id]").val(id);
		$("input[name=tagname]").val(name);
	}
	$("#addtag").click(function(){
		$("#change-modal-form").modal('show');	
		$("input[name=id]").val("");
		$("input[name=tagname]").val("");
	})

</script>