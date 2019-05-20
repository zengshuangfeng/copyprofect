<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>门票修改记录</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>门票修改记录</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&nickname=${nickname}&uid=${uid}&start_date=${start_date}&end_date=${end_date}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-12">
												<form action="${BASE_PATH}/useranchor/ticketupdaterecordlist"
													autocomplete="off" method="get" class="form-inline">
													<div class="form-group">
													    <div class="input-group">
													        <input class="form-control" type="text" name="nickname" value="${nickname}" placeholder="主播昵称"/>
													     </div>
													</div>
													<div class="form-group">
													     <div class="input-group">
													          <input class="form-control" type="text" name="uid" value="${uid>0?uid:''}" placeholder="主播ID"/>
													     </div>
													</div>
													<div class="form-group">
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" value="${start_date}"
																name="start_date" placeholder="开始日期。。。" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
													<div class="form-group">
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" value="${end_date}"
																name="end_date" placeholder="结束日期。。。" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<button type="submit" class="btn btn-primary">搜索</button>
															</span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger" href="${BASE_PATH}/useranchor/admissionticketrecord/exportexcel?nickname=${nickname}&uid=${uid}&start_date=${start_date}&end_date=${end_date}">导出</a>
															</span>
														</div>
													</div>
													<br/>	
													<br/>	
												</form>
											</div>
										</div>
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
																<th class="text-center">主播昵称</th>
																<th class="text-center">主播ID</th>
																<th class="text-center">开播时间</th>
																<th class="text-center">票价（钻）</th>
																<th class="text-center">操作人</th>
																<th class="text-center">操作时间</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${recordlist}" var="record">
																<tr class="text-center">
																	<td>${record.nickname}</td>
																	<td>${record.uid}</td>
																	<td><fmt:formatDate value="${record.start_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />${date}</td>
																	<td>${record.fee_count}</td>
																	<td>${record.w_name}</td>
																	<td><fmt:formatDate value="${record.create_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />${date}</td>													
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

</script>