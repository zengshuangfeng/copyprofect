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
				<h2>门票房统计</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>门票房统计</strong></li>
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
												<form action="${BASE_PATH}/useranchor/admissionticketlist"
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
																<a class="btn btn-danger" href="${BASE_PATH}/useranchor/admissionticket/exportexcel?nickname=${nickname}&uid=${uid}&start_date=${start_date}&end_date=${end_date}">导出</a>
															</span>
														</div>
													</div>
													<div class="form-group">
													    <label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-warning" onclick="setfeecountlimit()">设置门票上下限</a>
															</span>
														</div>
														<label class="control-label" for="status">&nbsp;门票上下限：${fee_down_limit} - ${fee_up_limit}</label>
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
																<th class="text-center">开始时间</th>
																<th class="text-center">结束时间</th>
																<th class="text-center">总计播放时长</th>
																<th class="text-center">票价（钻）</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${admissionticketlist}" var="admissionticket">
																<tr class="text-center">
																	<td>${admissionticket.nickname}</td>
																	<td>${admissionticket.uid}</td>
																	<td><fmt:formatDate value="${admissionticket.start_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />${date}</td>
																	<td><fmt:formatDate value="${admissionticket.end_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />${date}</td>
																	<td>${admissionticket.single_total_time}</td>
																	<td>${admissionticket.fee_count}</td>													
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

<div id="setfeecountlimit-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">设置门票上下限</h3>
						<form id="fsetfeecountlimit" action="${BASE_PATH}/useranchor/setfeecountlimit" method="POST">
							<div class="form-group">
							    <div class="input-group">
							        <input class="form-control" type="text" name="fee_count_min" placeholder="门票下限"/>
							    </div>
							</div>
							<div class="form-group">
							到
							</div>
							<div class="form-group">
							    <div class="input-group">
							        <input class="form-control" type="text" name="fee_count_max" placeholder="门票上限"/>
							    </div>
							</div>
							<div class="col-sm-2">
								<button class="btn btn-primary pull-right" type="submit">
									<strong>确定</strong>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

  $(function(){
	 
		$("#fsetfeecountlimit").validate({
			rules:{				
				fee_count_min:{
				required : true,
				number:true,
				range:[0,10000]
			    },
				fee_count_max:{
					required : true,
					number:true,
					range:[0,10000]
				    }			    
			},
			messages:{
				fee_count_min : {
					required : "下限不能为空",
					number : "只能是整数",
					range : "只能介于0到10000"
				},
				fee_count_max : {
					required : "上限不能为空",
					number : "只能是整数",
					range : "只能介于0到10000"
				}				
			},
			submitHandler : function() {
				ajaxSubmit($("#fsetfeecountlimit"),
					function(json) {
						if (json.code == -3) {
							for (var key in json.msg) {
								$("*[name="+ json.msg[key].name + "]").addClass("error");
								$("*[name="+ json.msg[key].name + "]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+ json.msg[key].value+ "</label>");
							}
						} else
							window.location.reload();
					});
				return false;
			}
			
		});
  });
  function setfeecountlimit(){
		$('#setfeecountlimit-modal-form').modal('show');
  }
</script>