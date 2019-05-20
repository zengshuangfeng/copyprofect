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
		<c:set value="&uid=${uid}&date=${date}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-8">
												<form class="form-inline">
													<div class="form-group" style="padding-left:15px">
														<div class="input-group">
															<label class="control-label">主播昵称：</label>
															<label class="control-label">${nickname}</label>
														</div>
													</div>
													<br/>
													<div class="form-group mt10 col-sm-2">
														<a>
														<i class="fa fa-btc" style="font-size:40px"></i>
														<label class="control-label" style="vertical-align: top;">${userInfo.total_anchor_virtual}<br/>累计获得获益</label>
														</a>
													</div>
													<div class="form-group mt10 col-sm-2">
														<a>
														<i class="fa fa-btc" style="font-size:40px"></i>
														<label class="control-label" style="vertical-align: top;">${userInfo.surplus_anchor_virtual}<br/>剩余收益</label>
														</a>
													</div>
													<div class="form-group mt10 col-sm-2">
														<a>
														<i class="fa fa-btc" style="font-size:40px"></i>
														<label class="control-label" style="vertical-align: top;">${userInfo.total_gift}<br/>累计收到礼物数</label>
														</a>
													</div>
													<div class="form-group mt10 col-sm-8">
														<a class="btn btn-xs btn-outline btn-primary" href="javascript:showWithdrawSet(${uid})">提现申请</a>
														<label class="control-label">申请将收益提现,由财务确认并打款给主播</label>
													</div>
													<div class="form-group mt10 col-sm-8">
														<a class="btn btn-xs btn-outline btn-primary" data-toggle="modal" href="#reward-modal-form">奖励收益</a>
														<label class="control-label">适用于[将基础工资以收益的方式发放][额外奖励魅力给主播]等场景</label>
													</div>
													<div class="form-group mt10 col-sm-8">
														<a class="btn btn-xs btn-outline btn-primary" data-toggle="modal" href="#return-modal-form">收回收益</a>
														<label class="control-label">适用于[发放收益失误需要追回][需要扣除收益以惩罚主播]等场景</label>
													</div>
												</form>
											</div>
										</div>
									</div>
									<ul class="nav nav-tabs">
										<li><a href="${BASE_PATH}/useranchor/profitlist?uid=${uid}">魅力值流水</a></li>
										<li class="active"><a href="#">提现记录</a></li>							
									</ul>	
									<div class="m-b-sm mt10">
										<div class="row">
											<div class="col-sm-6">
												<form action="${BASE_PATH}/useranchor/withdraw/waterlist"
													autocomplete="off" method="get" class="form-inline">
													<div class="form-group">
														<input type="hidden" name="uid" value="${uid}"/>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" value="${date}"
																name="date" placeholder="日期。。。" onClick="WdatePicker({dateFmt:'yyyy-MM'})">
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
																<th class="text-center">消耗收益</th>
																<th class="text-center">对应人民币</th>
																<th class="text-center">操作人员</th>
																<th class="text-center">提现时间</th>
																<th class="text-center">备注</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${withdrawList}" var="withdraw">
																<tr class="text-center">
                           											<td>${withdraw.withdraw_virtual}</td>
                           											<td>${withdraw.withdraw_rmb}</td>
                           											<td>${withdraw.w_name}</td>
                           											<td><fmt:formatDate value="${withdraw.update_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />${date}</td>
                           											<td></td>
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
<div id="withdraw-set-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">设置提现方式</h3>
						<form class="form-horizontal" role="form" id="withdraw_set_form" action="${BASE_PATH}/useranchor/savewithdrawtype" method="post">
							<div class="form-group col-sm-12">
								<input type="hidden" name="id" />
								<input type="hidden" name="uid" />
								<label class="col-sm-4 control-label text-right">*提现方式：</label>
								<div class="col-sm-6">
									<select name="withdraw_type" class="form-control">
										<option value="0">支付宝</option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">*支付宝/微信账号：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="withdraw_pass">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">*姓名：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="withdraw_name">
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
<div id="withdraw-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">提现申请</h3>
						<form id="withdraw" action="${BASE_PATH}/withdraw/savewithdrawinfo" method="post">
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">提现到：</label>
								<div class="col-sm-9">
									<label class="control-label" id="withdraw_info"></label>
									<input type="hidden" name="uid"/>
									<input type="hidden" name="withdraw_type"/>
									<input type="hidden" name="withdraw_pass"/>
									<input type="hidden" name="withdraw_name"/>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">扣除魅力值：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="withdraw_virtual">
									<br/><label class="control-label" id="can_withdraw_rmb">可用魅力值余额：${userInfo.surplus_anchor_virtual}</label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">打款金额：</label>
								<div class="col-sm-9">
									<label class="control-label" id="withdraw_rmb"></label>
									<input type="hidden" name="withdraw_rmb"/>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">备注：</label>
								<div class="col-sm-9">
									<textarea rows="3" class="form-control" name="remark"></textarea>
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
<div id="reward-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">奖励魅力</h3>
						<form id="reward" action="${BASE_PATH}/useranchor/savereward" method="post">
							<input type="hidden" name="uid" value="${uid}"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">奖励给：</label>
								<div class="col-sm-9">
									<label class="control-label">${nickname}</label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">发放收益：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="virtual">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">备注：</label>
								<div class="col-sm-9">
									<textarea rows="3" class="form-control" name="remark"></textarea>
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
<div id="return-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">追回魅力</h3>
						<form id="return" action="${BASE_PATH}/useranchor/savereturn" method="post">
							<input type="hidden" name="uid" value="${uid}"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">追回者：</label>
								<div class="col-sm-9">
									<label class="control-label">${nickname}</label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">扣除收益：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="virtual">
									<br/><label class="control-label">可用收益余额：${userInfo.surplus_anchor_virtual}</label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">备注：</label>
								<div class="col-sm-9">
									<textarea rows="3" class="form-control" name="remark"></textarea>
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
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	function editWithdraw(id, nickname, withdraw_rmb) {
		$("#withdraw-modal-form").modal('show');
		$("input[name=id]").val(id);
		$("#tip").text("已确认给主播"+nickname+"打款"+withdraw_rmb+"元？");
	}
	function showWithdrawSet(uid)
	{
		$("#withdraw-set-modal-form").modal('hide');
		$.get("${BASE_PATH}/useranchor/getwithdraw",{uid:uid},function(json){
			if(json.withdraw_pass=="")
			{
				$("#withdraw-set-modal-form").modal('show');
				$("#withdraw_set_form").find("input[name=uid]").val(uid);
				$("#withdraw_set_form").find("input[name=withdraw_type]").val(json.withdraw_type);
				$("#withdraw_set_form").find("input[name=withdraw_pass]").val(json.withdraw_pass);
				$("#withdraw_set_form").find("input[name=withdraw_name]").val(json.withdraw_name);
			}
			else
			{
				$("#withdraw-modal-form").modal('show');
				$("#withdraw").find("input[name=uid]").val(uid);
				$("#withdraw").find("input[name=withdraw_type]").val(json.withdraw_type);
				$("#withdraw").find("input[name=withdraw_pass]").val(json.withdraw_pass);
				$("#withdraw").find("input[name=withdraw_name]").val(json.withdraw_name);
				$("#withdraw_info").html((json.withdraw_type==0?"支付宝账号":"微信账号")+"<br/>"+"账号："+json.withdraw_pass+" 用户名："+json.withdraw_name);
			}
		});	
	}
	$(function(){
		$("#withdraw_set_form").validate({
			rules: {
				withdraw_type: {required:true},
				withdraw_pass: {required:true,maxlength:100},
				withdraw_name: {required:true,maxlength:10}
			},
			messages: {
				withdraw_type: {required:"提现方式不能为空"},
				withdraw_pass: {required:"提现账号不能为空",maxlength:"提现账号长度应小于100个字"},
				withdraw_name: {required:"账号姓名不能为空",maxlength:"账号姓名长度应小于10个字"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#withdraw_set_form"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
		        		showWithdrawSet('${uid}');
		        });
	        	return false;
	    	}
		});
		$("#withdraw").validate({
			rules: {
				withdraw_virtual: {required:true}
			},
			messages: {
				withdraw_virtual: {required:"魅力值不能为空"}
			},
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
		$("#reward").validate({
			rules: {
				virtual: {required:true}
			},
			messages: {
				virtual: {required:"发放收益不能为空"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#reward"), function(json){
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
		$("#return").validate({
			rules: {
				virtual: {required:true}
			},
			messages: {
				virtual: {required:"扣除收益不能为空"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#return"), function(json){
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
		$("input[name=withdraw_virtual]").blur(function(){
			var target = $(this);
			$.get("${BASE_PATH}/useranchor/getwithdrawrmb",{uid:'${uid}',withdraw_virtual:target.val()},function(data){
				target.parents("form").find("input[name=withdraw_rmb]").val(data);
				$("#withdraw_rmb").text(data);
			});
		});
	});
</script>