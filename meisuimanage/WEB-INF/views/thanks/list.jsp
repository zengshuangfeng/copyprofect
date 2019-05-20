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
				<h2>感恩节留言列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>感恩节留言列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/thanks/list" autocomplete="off"
											method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
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
																<th class="text-center">UID</th>
																<th class="text-center">房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">等级</th>
																<th class="text-center">内容</th>
																<th class="text-center">总赞数</th>
																<th class="text-center">留言时间</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${list}" var="msg">
																<tr class="text-center">
																	<td>${msg.uid }</td>
																	<td>${msg.fuuid }</td>
																	<td>${msg.nickname }</td>
																	<td>${msg.level }</td>
	        														<td>${msg.content }</td>
																	<td><a onclick="addGreat(${msg.id},${msg.greatcount})">${msg.greatcount }</a></td>
																	<td><fmt:formatDate value="${msg.createtime }" pattern="yyyy-MM-dd  HH:mm:ss" /></td>
																	<td><a class="btn btn-xs btn-outline btn-success mt10" href="javascript:deleteMsg(${msg.id })">删除</a></td>
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


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function deleteMsg(id){
		swal({
			title : "删除留言",
			text : "确定删除这条留言？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#1ab394",
			confirmButtonText : "确认",
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		},function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					type : "POST",
					url : "${BASE_PATH}/thanks/delete",
					data : {
						id : id,
					},
					success : function(data) {
						if (data > 0) {
							window.location.reload();
						}
					}
				});
			}
		});
	}
		
	function addGreat(id,greatcount){
		swal({
					   title : "添加总赞数",
			 			type : 'input',
			showCancelButton : true,
		    showCancelButton : true,
		   showConfirmButton : true,
		   confirmButtonText : "确认",
			cancelButtonText : "取消",
		},//function(isConfirm) {
			function(inputValue){
				if(inputValue == false || inputValue == ""){
					return false;
				}
			$.ajax({
				type : "POST",
				url : "${BASE_PATH}/thanks/addGreatCount",
				data : {
					id : id,
					num: inputValue
				},
				success : function(data) {
					if (data > 0) {
						window.location.reload();
					}
				}
			});
		});
	}
</script>