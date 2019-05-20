<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<style type="text/css">
.product-imitation{padding:0}
.row{margin-left:0;}
</style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>回复列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>视频管理</a></li>
					<li class="active"><strong>回复列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&nickname=${nickname}&start_time=${start_time}&end_time=${end_time}&is_blocked=${is_blocked}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/replyvideo/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}"
																name="uid"/>
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:200px">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}"
																name="nickname"/>
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_time}"
																name="start_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${end_time}" name="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:150px">
													<div class="form-group">
														<label class="control-label" >类型</label>
														<div class="input-group">
															<select name="is_blocked" class="form-control" onchange="$('#search_form').submit()">
															<option value="0"<c:if test="${is_blocked==0}"> selected="selected"</c:if>>正常用户</option>
															<option value="1"<c:if test="${is_blocked==1}"> selected="selected"</c:if>>被封号用户</option>
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
											<c:forEach items="${replyVideoList}" var="replyVideo" varStatus="status">
												<c:if test="${status.index==0||status.index==6}">
												<div class="col-md-12">
												</c:if>
												<div class="col-md-2">
													<div class="ibox">
														<div class="ibox-content product-box">
															<div class="product-imitation">
																<a href="javascript:video('${uploadUrl}${replyVideo.video}');"><img style="width: 100%"
																	src="${uploadUrl}${replyVideo.cover}" /></a>
															</div>
															<div class="product-desc"><small class="text-muted">${replyVideo.create_time}</small>
																<small class="text-muted stat-percent">${replyVideo.seconds}“</small>
																<div class="m-t">
																	<a>${replyVideo.s_nickname}</a>&nbsp;&nbsp;&nbsp;${replyVideo.sex}&nbsp;&nbsp;&nbsp;UID：${replyVideo.s_uid}
																</div>
																<div class="m-t">
																	<a>${replyVideo.r_nickname}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UID：${replyVideo.r_uid}
																</div>
																<div class="m-t forum-info">
																	<a href="javascript:updateUserIsBlocked(${replyVideo.s_uid},${replyVideo.user_is_blocked==1?0:1},'${replyVideo.s_nickname}')"
																				class="btn btn-xs btn-outline btn-primary">${replyVideo.user_is_blocked==1?'取消封号':'封号'}</a>
																</div>
															</div>
														</div>
													</div>
												</div>
												<c:if test="${status.index==5||status.index==fn:length(userVideoList)-1}">
												</div>
												</c:if>
											</c:forEach>										
									</div>
									<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function updateUserIsBlocked(id, is_blocked, nickname)
{
	swal({
		title : (is_blocked==1?"确定将":"解除")+nickname+"封号？",
		text : is_blocked==1?"封号后用户将无法登陆应用":"",
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "确定",
		cancelButtonText : "取消",
		closeOnConfirm : true,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			$.ajax({type: "POST",url:"${BASE_PATH}/replyvideo/updateuserisblocked",data:{id:id,is_blocked:is_blocked},success:function(){
					window.location.reload(true);	
			}});

		}
	});
}
function video(src)
{
	$("#video-modal-form").find("video").attr("src",src);
	$("#video-modal-form").modal('show');	
}
</script>