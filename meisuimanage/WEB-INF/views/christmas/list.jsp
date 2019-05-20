<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>圣诞节抽奖明细</h2>
				<ol class="breadcrumb">
					<li>
						<a href="javascript:void(0);" onclick="window.parent.location.href='/main'">Home</a>
					</li>
					<li>
						<a>运营管理</a>
					</li>
					<li class="active"><strong>圣诞节抽奖明细</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
		<c:set value="&start_time=${start_time}&end_time=${end_time}&f_uuid=${f_uuid}&uid=${uid}&type=${type}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/christmas/list" autocomplete="off" method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1" style="width:200px">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text" class="form-control" value="${start_time}" name="start_time" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:200px">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified" class="form-control" value="${end_time}" name="end_time" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" type="text">
														</div>
													</div>
												</div>
										
												<div class="col-sm-1" style="width:125px">
													<div class="form-group">
														<label class="control-label">类型</label>
														<div class="input-group">
															<select name="type" class="form-control" onchange="$('#search_form').submit()">
																<option value="-1" >请选择</option>
																<option value="0" <c:if test="${type==0}"> selected="selected"</c:if>>礼物</option>
																<option value="1" <c:if test="${type==1}"> selected="selected"</c:if>>钻石</option>
																<option value="2" <c:if test="${type==2}"> selected="selected"</c:if>>积分</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group"><input type="text" class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">用户房间号</label>
														<div class="input-group"><input type="text" class="form-control" value="${f_uuid}" name="f_uuid">
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
													<table class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default" data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">用户房间号</th>
																<th class="text-center">用户UID</th>
																<th class="text-center">用户昵称</th>
																<th class="text-center">礼物名称</th>
																<th class="text-center">奖品数量</th>
																<th class="text-center">礼物图片</th>
																<th class="text-center">类型</th>																
																<th class="text-center">时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${christmasList}" var="christmasList">
																<tr class="text-center">
																	<td>${christmasList.f_uuid}</td>
																	<td>${christmasList.uid}</td>	
																	<td>${christmasList.nickname}</td>	
																	<td>
																	<c:if test="${christmasList.christmas_prize.type==0}">${christmasList.gift_name}</c:if>
																	<c:if test="${christmasList.christmas_prize.type==1}">钻石</c:if>
																	<c:if test="${christmasList.christmas_prize.type==2}">积分</c:if>
																	</td>	
																	<td>${christmasList.christmas_prize.prize_count}</td>																	
																	
																	<td class="col-xs-1">
																		<c:choose><c:when test="${not empty christmasList.christmas_prize.pic}">
                                   			 							<img class="col-xs-12" src="${uploadUrl}${christmasList.christmas_prize.pic}">
                                   			 							</c:when>
                                   			 							<c:otherwise><img class="col-xs-12" src="${ctx}/img/default.jpg"  /></c:otherwise>
                                   			 							</c:choose>
                           											</td>
																    <td>
																    <c:if test="${christmasList.christmas_prize.type==0}">礼物</c:if>
																     <c:if test="${christmasList.christmas_prize.type==1}">钻石</c:if>
																      <c:if test="${christmasList.christmas_prize.type==2}">积分</c:if>
																    </td>
																	<td>																
																	<fmt:formatDate value="${christmasList.create_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> 
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
