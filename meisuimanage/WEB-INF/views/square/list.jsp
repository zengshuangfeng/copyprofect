<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>直播间管理</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>直播间管理</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&uid=${uid}&nickname=${nickname}&type=${type}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">										
										<form action="${BASE_PATH}/square/list" autocomplete="off" method="get" id="square_form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">主播昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">类型</label>
														<div class="input-group"> <select
															name="type" class="form-control"
															onchange="$('#square_form').submit()">
															<option value="-1">所有</option>		
															<option value="0"<c:if test="${type==0}"> selected="selected"</c:if>>秀场</option>
															<option value="1"<c:if test="${type==1}"> selected="selected"</c:if>>游戏</option>													
															<option value="2"<c:if test="${type==2}"> selected="selected"</c:if>>私密播</option>
														</select>
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
																<th class="text-center">位置</th>
																<th class="text-center">主播昵称</th>
																<th class="text-center">直播间名称</th>
																<th class="text-center">类型</th>
																<th class="text-center">当前热度</th>
																<th class="text-center">虚拟热度</th>
																<th class="text-center">虚拟热度持续至</th>
																<th class="text-center">开播时间</th>
																<th class="text-center">操作人员</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${squareList}" var="square"  varStatus="status">
																<tr class="text-center">
																	<td>${(showPage.currentPage-1)*20+status.index+1}</td>
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${square.uid}">${square.nickname}（${square.uid}）</a></td>
																	<td>${square.anchor_notice}</td>
																	<td>
																		<c:if test="${square.type==0}">秀场</c:if>
																		<c:if test="${square.type==1}">游戏</c:if>
																		<c:if test="${square.type==2}">私密播</c:if>
																	</td>
																	<td>${square.hots}</td>
																	<td>${square.virtual_add_hots}</td>
																	<td>${square.virtual_add_hots>0?square.virtual_time:''}</td>
																	<td>${square.create_time}</td>
																	<td>${square.w_name}</td>
																	<td><a href="javascript:updateVirtualHots(${square.id},${square.hots},${square.virtual_add_hots},'${square.virtual_time}')" class="btn btn-xs btn-outline btn-success">修改热度</a><a style="margin-left:5px" class="btn btn-xs btn-outline btn-danger"
																		href="javascript:closeAnchor('${square.f_uuid}')">踢出直播</a></td>
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
<div id="virtual-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">修改热度</h3>
						<form id="virtual" action="${BASE_PATH}/square/updatevirtualhots" method="post">
							<input type="hidden" name="id" value="0"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">主播当前热度：</label>
								<div class="col-sm-6">
									<label class="control-label" id="hots"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">主播实际热度：</label>
								<div class="col-sm-6">
									<label class="control-label" id="really_hots"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">增加虚拟热度：</label>
								<div class="col-sm-6">
									<input type="text" name="virtual_add_hots" class="form-control"/>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">热度持续时间至：</label>
								<div class="col-sm-6">
									<input type="text" name="virtual_time" class="form-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
function updateVirtualHots(id, hots, virtual_add_hots, virtual_time)
{
	$("#virtual-modal-form").find("input[name=id]").val(id);
	$("#virtual-modal-form").find("#hots").text(hots);
	$("#virtual-modal-form").find("#really_hots").text(parseInt(hots)-parseInt(virtual_add_hots));
	$("#virtual-modal-form").find("input[name=virtual_add_hots]").val(virtual_add_hots);
	$("#virtual-modal-form").find("input[name=virtual_time]").val(virtual_time);
	$("#virtual-modal-form").modal('show');
}
$(function(){
	$("#virtual").validate({
		rules: {
			virtual_add_hots: {required:true},
			virtual_time: {required:true}
		},
		messages: {
			virtual_add_hots: {required:"增加虚拟热度不能为空"},
			virtual_time: {required:"热度持续时间至不能为空"}
		},
		submitHandler: function(){
	        ajaxSubmit($("#virtual"), function(data){
	        	if(data>0)
	        		window.location.reload();
	        });
        	return false;
    	}
	});
	 setInterval("window.location.reload()",60000);
});
function closeAnchor(f_uuid) {
	deleteConfirm(f_uuid, "${BASE_PATH}/square/close", "直播","踢出");
}
</script>