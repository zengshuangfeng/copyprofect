<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>礼物列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物管理</a></li>
					<li class="active"><strong>礼物列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&gift_id=${gift_id}&gift_name=${gift_name}&is_online=${is_online}&is_private=${is_private}&type=${type}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/gift/list"
											autocomplete="off" method="get" id="search">
											<div class="row">
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
														<label class="control-label" for="status">礼物状态</label> <select
															name="is_online" id="is_online" class="form-control"
															onchange="$('#search').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${is_online==1}"> selected="selected"</c:if>>正常</option>
															<option value="0"<c:if test="${is_online==0}"> selected="selected"</c:if>>关闭</option>
														</select>
													</div>
												</div>	
													<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">礼物种类</label> <select
															name="type" class="form-control">	
															<option value="0"<c:if test="${type==0}"> selected="selected"</c:if>>普通礼物</option>														
															<option value="1"<c:if test="${type==1}"> selected="selected"</c:if>>特殊礼物</option>
															
														</select>
													</div>
												</div>	
									<%-- 			<div class="col-sm-1" style="width:150px">
													<div class="form-group">
														<label class="control-label" for="status">类型</label> <select
															name="is_private" id="is_private" class="form-control"
															onchange="$('#search').submit()">
															<option value="0"<c:if test="${is_private==0}"> selected="selected"</c:if>>普通直播</option>
															<option value="1"<c:if test="${is_private==1}"> selected="selected"</c:if>>一对一直播</option>
														</select>
													</div>
												</div>	 --%>											
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
															href="${BASE_PATH}/gift/add"
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
																<th class="text-center footable-first-column">礼物ID</th>	
																<th class="text-center">礼物种类</th>															
																<th class="text-center">礼物名称</th>															
																<th class="text-center">礼物图片</th>
																<th class="text-center">礼物文案</th>															
																<th class="text-center">礼物单价（钻石）</th>
																<th class="text-center">排序值</th>
																<th class="text-center">主播分成占比</th>
																<th class="text-center">推广分成占比</th>
																<th class="text-center">礼物状态</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${giftInfoList}" var="giftInfo">
																<tr class="text-center">
																	<td class="footable-first-column">${giftInfo.id}</td>
																	<td><c:if test="${giftInfo.type==0}">普通礼物</c:if>
																	<c:if test="${giftInfo.type==1}">特殊礼物</c:if>
																	</td>
																	<td>${giftInfo.gift_name}</td>																
																	<td class="col-xs-1">
																		<c:choose><c:when test="${not empty giftInfo.gift_head}">
                                   			 							<img class="col-xs-12" src="${uploadUrl}${giftInfo.gift_head}">
                                   			 							</c:when>
                                   			 							<c:otherwise><img class="col-xs-12" src="${ctx}/img/default.jpg"  /></c:otherwise>
                                   			 							</c:choose>
                           											</td>	
																	<td>${giftInfo.gift_description}</td>
																	<td>${giftInfo.gift_virtual}</td>
																	<td>${giftInfo.sort}</td>
																	<td>${giftInfo.anchor_divide}%</td>
																	<td>${giftInfo.promoter_divide}%</td>																	
																	<td><c:if test="${giftInfo.is_online==0}">
																		<span class="label label-danger">关闭</span>
																	</c:if> <c:if test="${giftInfo.is_online==1}">
																		<span class="label label-primary">正常</span>
																	</c:if></td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/gift/edit?id=${giftInfo.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteGiftInfo(${giftInfo.id})">删除</a><br></td>
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
<script type="text/javascript">
	function deleteGiftInfo(id) {
		deleteConfirm(id, "${BASE_PATH}/gift/delete", "该信息");
	}
</script>