<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>代理收益明细</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>代理管理</a></li>
					<li class="active"><strong>代理收益明细</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&type=${type}&s_time=${s_time}&e_time=${e_time}&agent_id=${agent_id}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/operate/agentprofit"
											autocomplete="off" method="get" id="search_form">
											<div class="row">
												<input type="hidden" name="agent_id" value="${agent_id}"/>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">选择时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${s_time}" name="s_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="开始时间">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">&nbsp;</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${e_time}" name="e_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text"  placeholder="结束时间">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width: 120px">
													<div class="form-group">
														<label class="control-label">类型</label>
														<div class="input-group">
															<select name="type" class="form-control" onchange="$('#search_form').submit()">
																<option value="0"<c:if test="${type==0}"> selected="selected"</c:if>>主播</option>
																<option value="1"<c:if test="${type==1}"> selected="selected"</c:if>>推广员</option>
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
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<c:if test="${type==0}">
															<tr>
																<th class="text-center">主播房间号</th>
																<th class="text-center">主播昵称</th>
																<th class="text-center">礼物名称</th>
																<th class="text-center">礼物价值（钻）</th>
																<th class="text-center">获得魅力值</th>
																<th class="text-center">送礼时间</th>
															</tr>
															</c:if>
															<c:if test="${type==1}">
															<tr>
																<th class="text-center">推广员房间号</th>
																<th class="text-center">推广员昵称</th>
																<th class="text-center">礼物名称</th>
																<th class="text-center">礼物价值（钻）</th>
																<th class="text-center">推广魅力值</th>
																<th class="text-center">送礼时间</th>
															</tr>
															</c:if>
														</thead>
														<tbody>
															<c:forEach items="${profitList}" var="profit">
																<tr class="text-center">
																	<td>${profit.f_uuid}</td>
																	<td>${profit.nickname}</td>
																	<td>${profit.gift_name}</td>
																	<td>${profit.gift_original_virtual}</td>
																	<td>${profit.gift_virtual}</td>
																	<td>${profit.create_time}</td>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>