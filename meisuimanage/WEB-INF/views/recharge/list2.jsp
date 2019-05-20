<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>赠送记录</h2>
				<ol class="breadcrumb">
					<li>
						<a href="javascript:void(0);" onclick="window.parent.location.href='/main'">Home</a>
					</li>
					<li>
						<a>钻石</a>
					</li>
					<li class="active"><strong>赠送记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
		<c:set value="&s_time=${s_time}&e_time=${e_time}&diamondsa=${diamondsa}&diamondsb=${diamondsb}&nickname=${nickname}&family=${family}&uid=${uid}&f_uuid=${f_uuid}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/balancevirtual/list" autocomplete="off" method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1" style="width:200px">
													<div class="form-group">
														<label class="control-label" for="date_added">开始时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text" class="form-control" value="${s_time}" name="s_time" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:200px">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束时间</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified" class="form-control" value="${e_time}" name="e_time" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" type="text">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:134px">
													<div class="form-group">
														<label class="control-label">类别</label>
														<div class="input-group">
															<select name="diamondsa" class="form-control" onchange="$('#search_form').submit()">
																 <option value="" <c:if test="${diamondsa==''}"> selected="selected"</c:if>>全部</option>
																<option value="zftype1" <c:if test="${diamondsa=='zftype1'}"> selected="selected"</c:if>>用户充值</option>
																<option value="zftype2" <c:if test="${diamondsa=='zftype2'}"> selected="selected"</c:if>>家族充值</option>
																<option value="zftype3" <c:if test="${diamondsa=='zftype3'}"> selected="selected"</c:if>>奖励充值</option>
																<option value="zftype4" <c:if test="${diamondsa=='zftype4'}"> selected="selected"</c:if>>邀请有礼</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:125px">
													<div class="form-group">
														<label class="control-label">支付方式</label>
														<div class="input-group">
															<select name="diamondsb" class="form-control" onchange="$('#search_form').submit()">
																<option value="-1" <c:if test="${diamondsb==-1}"> selected="selected"</c:if>>全部</option>
																<option value="0" <c:if test="${diamondsb==0}"> selected="selected"</c:if>>支付宝</option>
																<option value="1" <c:if test="${diamondsb==1}"> selected="selected"</c:if>>微信</option>
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
														<div class="input-group"><input type="text" class="form-control" value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:200px">
													<div class="form-group">
														<label class="control-label">用户昵称</label>
														<div class="input-group"><input type="text" class="form-control" value="${nickname}" name="nickname">
														</div>

													</div>
												</div>
											<%-- 		<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">家族</label>
														<div class="input-group">
														<input type="text" class="form-control" value="${family}" name="familyselect">
														</div>

													</div>
												</div> --%>
												 
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
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <label
															class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn"> <a
																class="btn btn-danger"
																href="javascript:exportExcel();">导出</a>
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
																<th class="text-center">订单编号</th>
																<th class="text-center">用户UID</th>
																<th class="text-center">房间号</th>
																<th class="text-center">等级</th>
																<th class="text-center">设备</th>
																<th class="text-center">支付方式</th>
																<th class="text-center">类别</th>
																<th class="text-center">用户昵称</th>
																<th class="text-center">充钻数量</th>
																<th class="text-center">充钻金额</th>
																<th class="text-center">备注</th>
																<th class="text-center">操作人员</th>
																<th class="text-center">时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${balance_virtualrecordListList}" var="balance_virtualrecord">
																<tr class="text-center">
																	<td>${balance_virtualrecord.id}</td>
																	<td>${balance_virtualrecord.uid}</td>	
																	<td>${balance_virtualrecord.f_uuid}</td>	
																	<td>${balance_virtualrecord.level}</td>	
																	<td>${balance_virtualrecord.hasDeviceInfo==1?'有':'无'}</td>																	
																	<td>${balance_virtualrecord.diamondsb==-1?"":balance_virtualrecord.diamondsb==0?"支付宝":"微信"}</td>
																    <td>${balance_virtualrecord.diamondsa=="zftype1"?"用户充值":balance_virtualrecord.diamondsa=="zftype2"?"家族充值":balance_virtualrecord.diamondsa=="zftype3"?"奖励充值":"邀请有礼"}</td>
																	<td>${balance_virtualrecord.nickname}</td>
																	<td>${balance_virtualrecord.balance_virtual}</td>
																	<td>${balance_virtualrecord.balance_money}</td>
																	<td>${balance_virtualrecord.remark}</td>
																	<td>${balance_virtualrecord.diamondsa=="zftype4"?"系统":balance_virtualrecord.w_name}</td>
																	<td>${balance_virtualrecord.create_date.substring(0,19)}</td>
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
<script type="text/javascript">
	function exportExcel()
	{
		var diamondsa = $("select[name=diamondsa]").val();
		var diamondsb = $("select[name=diamondsb]").val();
		var nickname = $("input[name=nickname]").val();
		var family = $("input[name=family]").val();
		var uid = $("input[name=uid]").val();
		var f_uuid = $("input[name=f_uuid]").val();
		var s_time = $("input[name=s_time]").val();
		var e_time = $("input[name=e_time]").val();
		if(typeof(e_time) =='undefined')
			e_time = "";
		location.href = "${BASE_PATH}/balancevirtual/exportexcel2?diamondsa="+diamondsa+"&diamondsb="+diamondsb+"&nickname"+nickname+"&uid="+uid+"&f_uuid="+f_uuid+"&s_time="+s_time+"&e_time="+e_time;
	}
</script>