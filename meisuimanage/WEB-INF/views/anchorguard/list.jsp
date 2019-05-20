<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>守护列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>守护列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&anchor_f_uuid=${anchor_f_uuid}&uid=${uid}&type=${type}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/anchorguard/list"
											autocomplete="off" method="get" id="search">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播房间号</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${anchor_f_uuid}" name="anchor_f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">守护者UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">类型</label> <select
															name="type" class="form-control"
															onchange="$('#search').submit()">	
															<option value="-1">请选择类型</option>												
															<option value="0"<c:if test="${type==0}"> selected="selected"</c:if>>包月守护</option>
															<option value="1"<c:if test="${type==1}"> selected="selected"</c:if>>包季守护</option>
															<option value="2"<c:if test="${type==2}"> selected="selected"</c:if>>包年守护</option>															
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
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/anchorguard/add"
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
																<th class="text-center">主播房间号</th>
																<th class="text-center">主播昵称</th>
																<th class="text-center">守护者UID</th>
																<th class="text-center">守护者昵称</th>
																<th class="text-center">开始时间</th>															
																<th class="text-center">结束时间</th>
																<th class="text-center">类型</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${Anchor_GuardList}" var="Anchor_GuardList">
																<tr class="text-center">																	
																	<td>${Anchor_GuardList.anchor_f_uuid}</td>
																	<td>${Anchor_GuardList.anchor_nickname}</td>
																	<td>
																	${Anchor_GuardList.uid}
                           											</td>	
                           											<td>${Anchor_GuardList.nickname}</td>
																	<td>																
																	<fmt:formatDate value="${Anchor_GuardList.start_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
																	</td>
																	<td>
																	<fmt:formatDate value="${Anchor_GuardList.end_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
																	</td>
																	<td>
																	<c:if test="${Anchor_GuardList.type==0}">包月守护</c:if>
																	<c:if test="${Anchor_GuardList.type==1}">包季守护</c:if>
																	<c:if test="${Anchor_GuardList.type==2}">包年守护</c:if>
																	</td>															
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
<script type="text/javascript">

</script>