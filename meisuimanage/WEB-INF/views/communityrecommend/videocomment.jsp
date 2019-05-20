<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>视频管理</h2>
				<ol class="breadcrumb">
					<li>社区</li>
					<li><a>视频管理</a></li>
					<li class="active"><strong>评论</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&post_id=${post_id}&nickname=${nickname}&uid=${uid}&comment=${comment}&start_time=${start_time}&end_time=${end_time}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/community/videomanager/comment"
											autocomplete="off" method="get" id="search">
											<div class="row">
											<input type="hidden" value="${post_id}" name="post_id">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">评论人昵称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">评论人ID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
													<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">评论内容</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${comment}" name="comment">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_time}" name="start_time"
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
															href="javascript:addComment(${post_id})"
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加评论</button>
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
																<th class="text-center">评论人昵称</th>																
																<th class="text-center">评论人ID</th>														
																<th class="text-center">评论内容</th>															
																<th class="text-center">评论时间</th>
																<th class="text-center">收到的赞</th>								
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${commentlist}" var="commentlist">
																<tr class="text-center">
																	<td>${commentlist.nickname}</td>
																	<td>${commentlist.uid}</td>																	
																	<td >
																${commentlist.comment }
                           											</td>	
																	<td>
																	
																	<fmt:formatDate value="${commentlist.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
																	</td>
																																															
																	<td>${commentlist.zan_count }</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="javascript:TopComment(${commentlist.id},${commentlist.is_top})">
																		<c:if test="${commentlist.is_top==1}"><font color="red">取消置顶</font></c:if>
																		<c:if test="${commentlist.is_top==0}">神评置顶</c:if>
																	
																		</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteComment(${commentlist.id})">删除</a><br></td>
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
<div id="apply-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">添加评论</h3>
						<form id="comment" action="${BASE_PATH}/community/picmanager/addcomment" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<input type="hidden" name="post_id" value="${post_id}"/>
								<div class="form-group col-sm-12">
									<label class="col-sm-4 control-label text-right">绑定马甲：</label>
										<div class="col-sm-5">
										<select name="uid"class="form-control" >
											<option value="">请选择</option>
												<c:forEach items="${userlist}" var="userlist">
												<option value="${userlist.id}">${userlist.nickname}</option>
												</c:forEach>
										</select>
												</div>
											</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">赞：</label>
								<div class="col-sm-5">
									<input type="text" name="zan_count" class="form-control" placeholder="单行输入">
								</div>
							</div>
							<c:if test="${topstatus==0}">
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">是否置顶：</label>
										<div class="col-sm-5">
										<select name="is_top" class="form-control">
											<option value="0">不置顶</option>
											<option value="1">置顶</option>								
										</select>
								</div>
							</div>
							</c:if>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">评论内容：</label>
								<div class="col-sm-6">
									<textarea rows="6" class="form-control" name="comment" placeholder="多行输入"></textarea>
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
$().ready(function() {
	$("#comment").validate({
		rules: {
			uid: {required:true},
			zan_count:{required:true,digits:true},
			comment:{required:true}		
		},
		messages: {
			uid: {required:"请绑定一个马甲号"},
			zan_count:{required:"点赞数不能为空", digits:"点赞数为整数"},
			comment:{required:"评论内容不能为空"} 
			
		},
		submitHandler: function(){
	        ajaxSubmit($("#comment"), function(json){
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
$(function(){	
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
});

	function deleteComment(id) {
		deleteConfirm(id, "${BASE_PATH}/community/videomanager/commentdelete", "该信息");
	}
	function TopComment(id,is_top) {
		if(${topstatus}==1 && is_top==0){
			swal({ 
				  title: "", 
				  text: "只能置顶一个，若需置顶，请将置顶评论取消", 
				  type: "warning",
				  showCancelButton: false, 
				  confirmButtonColor: "red",
				  confirmButtonText: "确定", 
				  closeOnConfirm: false, 
				  closeOnCancel: false	
				},
				function(isConfirm){ 
					if(isConfirm){
						window.location.reload();			
					}
				});	
		}else{
			swal({ 
				  title: "", 
				  text: "是否"+ (is_top == 0 ? "置顶" : "取消置顶") +"该评论?", 
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
						url : "${BASE_PATH}/community/videomanager/topcomment",
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
		
	}
	
	function addComment(id) {
		$("#apply-modal-form").modal('show');
	}
	
	
</script>