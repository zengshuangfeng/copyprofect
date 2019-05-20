<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>周星礼物列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物管理</a></li>
					<li class="active"><strong>周星礼物列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&gift_id=${gift_id}&gift_name=${gift_name}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">								
									<div class="m-b-sm">
										<form action="${BASE_PATH}/weekgift/list"
											autocomplete="off" method="get" id="search_form">
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <span
															class="help-block m-b-none text-danger"
															style="color: red">新的一周必须重新添加4个礼物，请不要删除也不要下架上一周的礼物，如果本周不做活动，可不加礼物！</span>
													</div>
												</div>	
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">礼物ID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${gift_id>0?gift_id:''}" name="gift_id">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">礼物名称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${gift_name}" name="gift_name">
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
															href="${BASE_PATH}/weekgift/add"
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
																<th class="text-center">礼物名称</th>
																<th class="text-center">礼物图片</th>
																<th class="text-center">排序值</th>
																<th class="text-center">状态</th>
																<th class="text-center">上线时间</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">创建时间</th>																
																<th class="text-center footable-last-column" >操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${weekgiftList}" var="weekgiftList">
																<tr class="text-center">																	
																	<td>${weekgiftList.gift_name}</td>
																	<td class="col-xs-1">
                                   			 							<img class="col-xs-12" src="${uploadUrl}${weekgiftList.gift_head}">
                           											</td>
                           											<td>${weekgiftList.sort}</td>
                           											<td><c:if test="${weekgiftList.is_online==0}">
																		<span class="label label-danger">关闭</span>
																	</c:if> <c:if test="${weekgiftList.is_online==1}">
																		<span class="label label-primary">正常</span>
																	</c:if></td>
																	<td>
																	<fmt:formatDate value="${weekgiftList.online_time}"  pattern="yyyy-MM-dd"></fmt:formatDate> 
																	</td>
																	<td>${weekgiftList.w_name}</td>
																	<td>
																	<fmt:formatDate value="${weekgiftList.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
																	</td>
																	
																	<td class="text-center footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/weekgift/edit?id=${weekgiftList.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteWeekGift(${weekgiftList.id})">删除</a></td>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function deleteWeekGift(id) {
		deleteConfirm(id, "${BASE_PATH}/weekgift/delete", "该信息");
	}
</script>