<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>座驾列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>座驾列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&id=${id}&name=${name}&is_online=${is_online}&level=${level}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/vehicle/list"
											autocomplete="off" method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">座驾ID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${id>0?id:''}" name="id">
														</div>
													</div>
												</div>										
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">座驾名称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${name}" name="name">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">座驾状态</label> <select
															name="is_online" id="is_online" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${is_online==1}"> selected="selected"</c:if>>上架</option>
															<option value="0"<c:if test="${is_online==0}"> selected="selected"</c:if>>下架</option>
														</select>
													</div>
												</div>	
													<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">座驾类型</label> <select
															name="level" id="level" class="form-control"
															onchange="$('#search_form').submit()">
															<option value="-1">全部</option>
															<option value="3"<c:if test="${level==3}"> selected="selected"</c:if>>黄金座驾</option>
															<option value="2"<c:if test="${level==2}"> selected="selected"</c:if>>白银座驾</option>										
															<option value="1"<c:if test="${level==1}"> selected="selected"</c:if>>青铜座驾</option>	
															<option value="0"<c:if test="${level==0}"> selected="selected"</c:if>>普通座驾</option>														
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
															href="${BASE_PATH}/vehicle/add"
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
																<th class="text-center footable-first-column">座驾ID</th>
																<th class="text-center">排序值</th>
																<th class="text-center">座驾类型</th>
																<th class="text-center">座驾车型</th>
																<th class="text-center">座驾名称</th>
																<th class="text-center">座驾图片</th>
																<th class="text-center">座驾静态图片</th>
																<th class="text-center">座驾动态特效图片</th>
																<th class="text-center">座驾单价(钻)</th>	
																<th class="text-center">座驾状态</th>														
																<th class="text-center footable-last-column" >操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${vehicleList}" var="vehicleList">
																<tr class="text-center">
																	<td class="footable-first-column">${vehicleList.id}</td>
																	<td class="col-xs-1">${vehicleList.sort}</td>
                           											<td>
                           											<c:if test="${vehicleList.level==0}">普通座驾</c:if>
                           											<c:if test="${vehicleList.level==1}">青铜座驾</c:if>
                           											<c:if test="${vehicleList.level==2}">白银座驾</c:if>
                           											<c:if test="${vehicleList.level==3}">黄金座驾</c:if>
                           											</td>
                           											<td>
                           											<c:if test="${vehicleList.type==0}">普通车型</c:if>
                           											<c:if test="${vehicleList.type==1}">神秘车型</c:if>
                           											</td>
                           											<td>${vehicleList.name}</td>
																	<td class="col-xs-1">
																	<img class="col-xs-12" src="${uploadUrl}${vehicleList.pic}">
																	</td>
																	<td class="col-xs-1">
																	<img class="col-xs-12" src="${uploadUrl}${vehicleList.static_pic}">
																	</td>
																	<td class="col-xs-1">
																	<img class="col-xs-12" src="${uploadUrl}${vehicleList.special_pic}">
																	</td>
																	<td>${vehicleList.price}</td>
																	<td>
																	<c:if test="${vehicleList.is_online==1}">
																	<span class="label label-primary">上线</span>
																	</c:if>
																	<c:if test="${vehicleList.is_online==0}">
																	<span class="label label-danger">下线</span>
																	</c:if>
																	</td>
																	
																	<td class="text-center footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/vehicle/edit?id=${vehicleList.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteVehicle(${vehicleList.id})">删除</a></td>
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
	function deleteVehicle(id) {
		deleteConfirm(id, "${BASE_PATH}/vehicle/delete", "该信息");
	}
</script>