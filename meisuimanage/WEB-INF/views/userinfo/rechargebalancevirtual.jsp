<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>钻石充值</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li class="active"><strong>用户充值</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&uid=${uid}&f_uuid=${f_uuid}&nickname=${nickname}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/rechargebalancevirtual/list"
											autocomplete="off" method="get" id="search">
											<div class="row">
													<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">用户UID</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>										
												<div class="col-sm-1" style="width: 120px">
													<div class="form-group">
														<label class="control-label">用户房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
														<div class="col-sm-2" style="width: 150px">
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
																<th class="text-center footable-first-column">用户UID</th>																
																<th class="text-center">用户房间号</th>													
																<th class="text-center">昵称</th>
																<th class="text-center">钻石余额</th>
																<th class="text-center">操作</th>																
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userList}" var="userList">
																<tr class="text-center">
																	
																	<td>${userList.id}</td>	
																	<td>${userList.f_uuid}</td>																																										
																	<td>${userList.nickname}</td>
																	<td>
																	${userList.balance_virtual}
																	
																	</td>
																	<td>
																	<a
																		href="javascript:balanceVirtualAdd(${userList.id},${userList.balance_virtual})">充值
																		</a>
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
<div id="rewardkey-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">奖励钻石数</h3>
						<form id="reward2"
							action="${BASE_PATH}/rechargebalancevirtual/savediamonds"
							method="post">
							<input type="hidden" name="id"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">现有钻石数：</label>
								<div class="col-sm-9">
									<label class="control-label" id="balance_virtual"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">赠送钻石：</label>
								<div class="col-sm-9">
									<input type="text" name="diamondscount" class="form-control">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">对应金额：</label>
								<div class="col-sm-9">
									<input type="text" name="money" class="form-control">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">充值备注：</label>
								<div class="col-sm-9">
									<input type="text" name="diamondsremark" class="form-control">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">充值类型：</label>
								<div class="col-sm-9">
									<div class="i-checks">
										<label><input type="radio" checked="checked"
											value="zftype1" name="diamondsa"> <i></i> 用户充值 </label>
									</div>
									<div class="i-checks">
										<label> <input type="radio" value="zftype3"
											name="diamondsa"> <i></i>奖励充值
										</label>
									</div>
								</div>
							</div>
							<div class="form-group col-sm-16">
							    <label class="col-sm-16 control-label" style="color:red">跑骚、测试必须通过奖励充值，否则月底无法正常统计数据</label>    
							</div>							
							<div class="form-group col-sm-12" id="zhifu-form">
								<label class="col-sm-3 control-label text-right">充值渠道：</label>
								<div class="col-sm-9">
									<div class="i-checks">
										<label> <input type="radio" value="zhifu1"
											name="diamondsb"> <i></i> 支付宝
										</label> <label> <input type="radio" checked="checked"
											value="zhifu2" name="diamondsb"> <i></i>微信
										</label>
									</div>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script>
function balanceVirtualAdd(uid, balance_virtual) {
	$("#rewardkey-modal-form").modal('show');
	$("#rewardkey-modal-form").find("input[name=id]").val(uid);
	$("#rewardkey-modal-form").find("#balance_virtual").text(balance_virtual);
}
$("#reward2").validate({
	rules : {
		diamondscount : {
			required : true,
			number:true
		}
	},
	messages : {
		diamondscount : {
			required : "钻石数不能为空",
			number : "钻石数只能是整数"
		}
	},
	submitHandler : function() {
		ajaxSubmit($("#reward2"),
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
</script>