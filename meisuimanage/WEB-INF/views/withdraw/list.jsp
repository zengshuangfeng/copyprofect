<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>提现申请列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>提现申请列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&is_pay=${is_pay}&uid=${uid}&nickname=${nickname}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/withdraw/list" autocomplete="off"
											method="get" id="select">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="jumpstyle">是否打款</label>
														<select name="is_pay" class="form-control"
															onchange="$('#select').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${is_pay==1}"> selected="selected"</c:if>>已打款</option>
															<option value="0"<c:if test="${is_pay==0}"> selected="selected"</c:if>>未打款</option>
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
																<th class="text-center">主播UID</th>
																<th class="text-center">主播昵称</th>
																<th class="text-center">扣除收益</th>
																<th class="text-center">提现金额（元）</th>
																<th class="text-center">提现至</th>
																<th class="text-center">备注</th>
																<th class="text-center">申请时间</th>
																<th class="text-center">状态</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${withdrawList}" var="withdraw">
																<tr class="text-center">
																	<td>${withdraw.uid}</td>
																	<td>${withdraw.nickname}</td>
                           											<td>${withdraw.withdraw_virtual}</td>
                           											<td>${withdraw.withdraw_rmb}</td>
                           											<td>${withdraw.withdraw_type==0?"支付宝":"微信"}:(账号:${withdraw.withdraw_pass})(用户名:${withdraw.name})</td>
                           											<td>${withdraw.remark}</td>
                           											<td><fmt:formatDate value="${withdraw.create_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />${date}</td>
                           											<td>
                           												<c:choose>
                           													<c:when test="${withdraw.is_pay==1}"><span class="label label-primary">已打款</span></c:when>
                           													<c:when test="${withdraw.is_pay==0}"><span class="label label-danger">未打款</span></c:when>
                           												</c:choose>
                           											</td>
																	<td>
																	<c:if test="${withdraw.is_pay==0}">
																	<a class="btn btn-xs btn-outline btn-primary"
																		href="javascript:editWithdraw(${withdraw.id}, '${withdraw.nickname}', ${withdraw.withdraw_rmb})">确认打款</a>
																	</c:if>	
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
<div id="withdraw-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">确认打款</h3>
						<form id="withdraw" action="${BASE_PATH}/withdraw/save" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<input type="hidden" name="id" />
							<input type="hidden" name="is_pay" value="1"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label text-right">&nbsp;</label>
								<div class="col-sm-10">
									<label class="control-label" id="tip"></label>
								</div>
							</div>
							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									data-dismiss="modal">取消</button>
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	function editWithdraw(id, nickname, withdraw_rmb) {
		$("#withdraw-modal-form").modal('show');
		$("input[name=id]").val(id);
		$("#tip").text("已确认给主播"+nickname+"打款"+withdraw_rmb+"元？");
	}
	$(function(){
		$("#withdraw").validate({
			submitHandler: function(){
		        ajaxSubmit($("#withdraw"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
		        		window.location.reload();
		        });
	        	return false;
	    	}
		});
	});
</script>