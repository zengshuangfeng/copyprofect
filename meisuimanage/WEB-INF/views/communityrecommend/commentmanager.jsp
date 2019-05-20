<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>图片管理</h2>
				<ol class="breadcrumb">
					<li>社区</li>
					<li><a>图片管理</a></li>
					<li class="active"><strong>评论</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&nickname=${nickname}&uid=${uid}&comment=${comment}&start_time=${start_time}&end_time=${end_time}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/community/commentmanager"
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
																<th class="text-center">评论人昵称</th>																
																<th class="text-center">评论人ID</th>														
																<th class="text-center" style="width:600px">评论内容</th>															
																<th class="text-center">评论时间</th>
																<th class="text-center">收到的赞</th>								
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${commentlist}" var="commentlist">
																<tr class="text-center">
																	<td>${commentlist.id}</td>
																	<td>${commentlist.nickname}</td>
																	<td>${commentlist.uid}</td>																	
																	<td >
																	${commentlist.comment }
                           											</td>	
																	<td>
																	
																	<fmt:formatDate value="${commentlist.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
																	</td>
																																															
																	<td>${commentlist.zan_count }</td>
																	<td class="text-right footable-last-column">
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
		deleteConfirm(id, "${BASE_PATH}/community/picmanager/commentdelete", "该信息");
	}
	
</script>