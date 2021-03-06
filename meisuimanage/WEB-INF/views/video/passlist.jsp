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
				<h2>通过列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>视频管理</a></li>
					<li class="active"><strong>通过列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&video_id=${video_id}&nickname=${nickname}&admin_id=${admin_id}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/passvideo/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">视频编号</label>
														<div class="input-group">
														<input type="text"
																class="form-control" value="${video_id>0?video_id:''}"
																name="video_id">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">发布者昵称</label>
														<div class="input-group"><input 
																class="form-control" value="${nickname}" name="nickname" 
																type="text">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="admin_id">审核人员帅选</label>
														 <select
															name="admin_id" id="admin_id" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="0">全部</option>
															<c:forEach items="${adminList}" var="admin">															
															<option value="${admin.id}"<c:if test="${admin.id==admin_id}"> selected="selected"</c:if>>${admin.nickname}</option>
															</c:forEach>
														</select>
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
																<th class="text-center">视频编号</th>
																<th class="text-center">发布者</th>
																<th class="text-center">头像</th>
																<th class="text-center">视频</th>
																<th class="text-center">截帧</th>
																<th class="text-center">操作</th>
																<th class="text-center">操作人</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userVideoList}" var="userVideo">
																<tr class="text-center">
																	<td>${userVideo.id}</td>
																	<td>${userVideo.nickname}</td>
																	<td class="col-xs-1"><c:choose>
																			<c:when test="${not empty userVideo.head}">
																				<img class="col-xs-12"
																					src="${fn:startsWith(userVideo.head,'http')?'':uploadUrl}${userVideo.head}" />
																			</c:when>
																			<c:otherwise>
																				<img class="col-xs-12" src="${ctx}/img/default.jpg" />
																			</c:otherwise>
																		</c:choose></td>
																	<td class="col-xs-1"><a href="javascript:video('${uploadUrl}${userVideo.video}');"><img class="col-xs-2" style="width: 100%"
																	src="${uploadUrl}${userVideo.cover}/imageView2/2/format/webp/w/350" /></a></td>
																	<td  class="col-xs-4">
																		<c:forEach items="${userVideo.picList}" var="pic">
																			<img class="col-xs-2" src="${uploadUrl}${pic}/imageView2/2/format/webp/w/350"/>
																		</c:forEach>
																	</td>
																	<td>
																	<a class="btn btn-xs btn-outline btn-primary" href="javascript:refuse(${userVideo.id})">不通过</a></td>
																	<td>${userVideo.w_name}</td>																												
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
<div id="video-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<div class="form-group col-sm-12">
							<video src="" controls="controls" autoplay="autoplay"></video>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="refuse-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">不通过理由</h3>
						<form id="refuse" action="${BASE_PATH}/passvideo/audit" method="post">		
							<input name="id" type="hidden" value="0"/>	
							<input name="status" type="hidden" value="2"/>					
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">&nbsp;</label>
								<div class="col-sm-9">
									 <select name="remark" class="form-control">
									 	<option value="视频违规">视频违规</option>
									 	<option value="昵称违规">昵称违规</option>
									 	<option value="头像违规">头像违规</option>
									 </select>
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
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#refuse").validate({
		submitHandler: function(){
	        ajaxSubmit($("#refuse"), function(json){
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
function refuse(id)
{
	$("#refuse-modal-form").find("input[name=id]").val(id);
	$("#refuse-modal-form").modal('show');	
}
function video(src)
{
	$("#video-modal-form").find("video").attr("src",src);
	$("#video-modal-form").modal('show');	
}
</script>