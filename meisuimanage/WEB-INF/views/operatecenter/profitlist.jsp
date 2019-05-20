<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-3">
			<h2>运营中心</h2>
				<ol class="breadcrumb">
					<li><a href="#">运营中心</a></li>
					<li class="active"><strong>运营收益明细</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&begin_time=${begin_time}&end_time=${end_time}&type=${type}&centerId=${centerId }"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/operate/profit"
											autocomplete="off" method="get" id="search_form">
											<input type="hidden" name="centerId" value="${centerId}"/>
											<div class="row">
												<div class="col-sm-1" style="width:130px">
													<div class="form-group">
														<label class="control-label" for="for_type">类型</label>
															<select class="form-control" name="type" onchange="$('#search_form').submit()">
																<option value="0" <c:if test="${type==0 }">selected</c:if>>主播</option>
																<option value="1" <c:if test="${type==1 }">selected</c:if>>推广员</option>
															</select>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control"  value="${begin_time}"
																name="begin_time" id="begin_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input class="form-control" value="${end_time}"  name="end_time" id="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})"
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
													<table id="cc"
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
															<c:if test="${empty type or type==0 }">
																<th class="text-center">主播UID</th>
																<th class="text-center">主播房间号</th>
																<th class="text-center">主播昵称</th>
															</c:if>
															<c:if test="${type == 1 }">
																<th class="text-center">推广员UID</th>
																<th class="text-center">推广员房间号</th>
																<th class="text-center">推广员昵称</th>
															</c:if>
																<th class="text-center">所属代理</th>
																<th class="text-center">礼物名称</th>
																<th class="text-center">礼物价值（钻）</th>
															<c:if test="${empty type or type==0 }">
																<th class="text-center">直播魅力值</th>
															</c:if>
															<c:if test="${type == 1 }">
																<th class="text-center">推广魅力值</th>
															</c:if>
															<th class="text-center">送礼时间</th>
															</tr>
														</thead>
														<tbody id="agent_table">
															<c:forEach items="${list}" var="profit" varStatus="status">
																<tr class="text-center">
																	<td>${profit.uid }</td>
																	<td>${profit.f_uuid }</td>
																	<td>${profit.nickname }</td>
																	<td>${profit.agentname }</td>
																	<td>${profit.gift_name }</td>
																	<td>${profit.virtual }</td>
																	<td>${profit.gift_virtual }</td>
																	<td>${profit.create_time }</td>
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
<script src="${ctx}/js/plugins/morris/raphael-2.1.0.min.js"></script>
<script src="${ctx}/js/plugins/morris/morris.js"></script>
<script type="text/javascript">
	
</script>
