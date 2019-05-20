<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<style type="text/css">
.actiondiv {
	display: none;
	position: absolute;
	background-color: #fff;
	z-index: 10;
	border: 1px solid #e7eaec;
	padding: 10px 20px 20px 20px;
	right: 0px;
}
</style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>社区</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>社区</a></li>
					<li class="active"><strong>视频管理</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&f_uuid=${f_uuid}&start_time=${start_time}&end_time=${end_time}&title=${title}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/community/videomanager"
											autocomplete="off" method="get" id="select">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">选择时间</label>
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
														<label class="control-label" for="date_modified">&nbsp;</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${end_time}" name="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label">标题</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${title}"
																name="title">
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
															href="${BASE_PATH}/community/videomanager/add"
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
																<th class="text-center">ID</th>
																<th class="text-center">视频封面</th>
																<th class="text-center">绑定主播</th>
																<th class="text-center">主播房间号</th>
																<th class="text-center">标题</th>
																<th class="text-center">状态</th>
																<th class="text-center">访问数</th>
																<th class="text-center">评论数</th>
																<th class="text-center">分享</th>
																<th class="text-center">赞</th>
																<th class="text-center">创建时间</th>
																<th class="text-center">最后更新时间</th>
																<th class="text-center">是否置顶</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${postList}" var="postList">
																<tr class="text-center">
																	<td>${postList.id}</td>
																	<td class="col-xs-1"><img class="col-xs-12"
																		src="${uploadUrl}${postList.video}?vframe/jpg/offset/5"
																		onclick="showImg('${uploadUrl}${postList.video}?vframe/jpg/offset/5','${postList.video}')">
																	</td>
																	<td>${postList.nickname}</td>
																	<td>${postList.f_uuid}</td>
																	<td class="col-xs-2"
																		<c:if test="${postList.title.length() >15}">style="text-align:left"</c:if>>${postList.title }</td>
																	<td><c:if
																			test="${postList.is_online==0 && postList.is_del==0}">
																			<span class="label label-danger">下线</span>
																		</c:if> <c:if
																			test="${postList.is_online==1 && postList.is_del==0}">
																			<span class="label label-primary">上线</span>
																		</c:if> <c:if test="${postList.is_del==1}">
																			<span class="label label-del">删除</span>
																		</c:if></td>
                           											<td>${postList.view_count}</td>
                           											<td>${postList.comment_count}</td>
																	<td>${postList.share_count}</td>
																	<td>${postList.zan_count}</td>
																	<td><fmt:formatDate
																			value="${postList.create_time}"
																			pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																	<td><fmt:formatDate
																			value="${postList.update_time}"
																			pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																	<td><c:if test="${postList.is_top==0}">
																			<span class="label label-danger">否</span>
																		</c:if> <c:if test="${postList.is_top==1 }">
																			<span class="label label-primary">是</span>
																		</c:if></td>
																	<td><span class="actionclick"
																		style="cursor: pointer;">更多&nbsp;<i
																			class="click-expand glyphicon glyphicon-plus"></i></span>
																		<div class="actiondiv">
																			<a class="btn btn-xs btn-outline btn-success"
																				href="${BASE_PATH}/community/videomanager/edit?id=${postList.id}">编辑</a><br />
																			<a
																				href="${BASE_PATH}/community/videomanager/comment?post_id=${postList.id}"
																				class="btn btn-xs btn-outline btn-success mt10">评论</a><br />
																			<a href="javascript:Online(${postList.id})"
																				class="btn btn-xs btn-outline btn-success mt10">上线</a><br />
																			<a href="javascript:Downline(${postList.id})"
																				class="btn btn-xs btn-outline btn-success mt10">下线</a><br />
																			<a class="btn btn-xs btn-outline btn-success mt10"
																				href="javascript:TopPost(${postList.id},${postList.is_top})">
																				<c:if test="${postList.is_top==1}">
																					<font color="red">取消置顶</font>
																				</c:if> <c:if test="${postList.is_top==0}">置顶</c:if>
																			</a><br /> <a
																				class="btn btn-xs btn-outline btn-danger mt10"
																				href="javascript:deletePost(${postList.id})">删除</a>
																		</div></td>
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
<div id="img-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog" style="width: 400px">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b col-sm-6">视频预览</h3>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<div class="col-sm-12">
							<div id="showVideo"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<link
	href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript"
	src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<script src="${ctx}/ckplayer/ckplayer.js" type="text/javascript"></script>
<script type="text/javascript">
	function showImg(src, video) {
		$("#img-modal-form").modal('show');
		$("#img-modal-form").find("img").attr("src", src);

		var url = video;
		$("#showVideo").on("click", function() {
			url = $("#imageHidden2").val();
		})

		var pmHeight = $(window).height();
		var videoObject = {
			container : '#showVideo',//“#”代表容器的ID，“.”或“”代表容器的class
			variable : 'player',//该属性必需设置，值等于下面的new chplayer()的对象
			poster : src,//封面图片
			autoplay : false,//自动播放
			mobileCkControls : true,//是否在移动端（包括ios）环境中显示控制栏
			video : '${uploadUrl}' + url + ''//视频地址
		};
		var player = new ckplayer(videoObject);
	}

	function deletePost(id) {
		deleteConfirm(id, "${BASE_PATH}/community/videomanager/postdelete",
				"该信息");
	}
	function Online(id) {
		swal({
			title : "",
			text : "确认上线?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "green",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : false,
			closeOnCancel : false
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					type : "POST",
					url : "${BASE_PATH}/community/videomanager/postonline",
					data : {
						id : id,
					},
					success : function(data) {
						if (data > 0) {
							window.location.reload();
						}
					}
				});
			} else {
				window.location.reload();
			}
		});
	}
	function Downline(id) {
		swal({
			title : "",
			text : "确认下线?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "red",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : false,
			closeOnCancel : false
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					type : "POST",
					url : "${BASE_PATH}/community/videomanager/postdownline",
					data : {
						id : id,
					},
					success : function(data) {
						if (data > 0) {
							window.location.reload();
						}
					}
				});
			} else {
				window.location.reload();
			}
		});
	}

	$(function() {
		$("#apply")
				.validate(
						{
							submitHandler : function() {
								ajaxSubmit(
										$("#apply"),
										function(json) {
											if (json.code == -3) {
												for ( var key in json.msg) {
													$(
															"*[name="
																	+ json.msg[key].name
																	+ "]")
															.addClass("error");
													$(
															"*[name="
																	+ json.msg[key].name
																	+ "]")
															.after(
																	"<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"
																			+ json.msg[key].value
																			+ "</label>");
												}
											} else
												window.location.reload();
										});
								return false;
							}
						});
	});
	$(document).on("click", ".actionclick", function() {
		var i_action = $(this).children("i");
		$(".actionclick").next("div").hide();
		if (i_action.hasClass("click-expand")) {
			i_action.removeClass("click-expand");
			i_action.addClass("click-collapse");
			i_action.removeClass("glyphicon-plus");
			i_action.addClass("glyphicon-minus");
			$(this).next("div").show();
		} else {
			i_action.removeClass("click-collapse");
			i_action.addClass("click-expand");
			i_action.removeClass("glyphicon-minus");
			i_action.addClass("glyphicon-plus");
			$(this).next("div").hide();
		}
	});
	$(document).bind(
			"click",
			function(e) {
				var target = $(e.target);
				if (target.closest(".actiondiv").length == 0
						&& target.closest(".actionclick").length == 0) {
					$(".actionclick").children("i").removeClass(
							"click-collapse");
					$(".actionclick").children("i").addClass("click-expand");
					$(".actionclick").children("i").removeClass(
							"glyphicon-minus");
					$(".actionclick").children("i").addClass("glyphicon-plus");
					$(".actiondiv").hide();
				}
			});
	
	function TopPost(id,is_top) {
		swal({ 
			  title: "", 
			  text: "是否"+ (is_top == 0 ? "置顶" : "取消置顶") +"该帖子?", 
			  type: "warning",
			  showCancelButton: true, 
			  confirmButtonColor: "green",
			  confirmButtonText: "确定", 
			  cancelButtonText: "取消",
			  closeOnConfirm: false, 
			  closeOnCancel: false	
			},
			function(isConfirm){ 
				if(isConfirm){
				$.ajax({
					type : "POST",
					url : "${BASE_PATH}/community/toppost",
					data : {
						id : id,
						is_top:is_top
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
</script>