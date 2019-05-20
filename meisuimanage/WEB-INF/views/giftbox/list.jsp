<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>礼物箱列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物箱管理</a></li>
					<li class="active"><strong>礼物箱列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&gift_id=${gift_id}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/giftbox/list"
											autocomplete="off" method="get" id="search">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
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
															href="${BASE_PATH}/giftbox/operatelog"
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">操作日志</button>
														</a>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/giftbox/add"
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">赠送礼物</button>
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
																<th class="text-center">用户UID</th>
																<th class="text-center">房间号</th>
																<th class="text-center">用户昵称</th>
																<th class="text-center footable-first-column">礼物ID</th>																
																<th class="text-center">礼物名称</th>
																<th class="text-center">数量</th>
																<th class="text-center">来源</th>
																<th class="text-center">获得时间</th>																															
															
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${giftBoxRecordList}" var="giftBox">
																<tr class="text-center">
																	<td>${giftBox.uid}</td>
																	<td>${giftBox.f_uuid}</td>
																	<td>${giftBox.nickname}</td>
																	<td>${giftBox.gift_id}</td>															
																	<td>${giftBox.gift_name}</td>
																	<td>${giftBox.gift_count}</td>
																	<td>
																	<c:if test="${giftBox.source==0}">赠送</c:if>
																	<c:if test="${giftBox.source==1}">轮盘</c:if>
																	
																	</td>		
																	<td>
																	<fmt:formatDate value="${giftBox.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>

