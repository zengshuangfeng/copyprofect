<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<style type="text/css">
.actiondiv{display:none;position: absolute;background-color: #fff;z-index: 10;border: 1px solid #e7eaec;padding: 10px 20px 20px 20px;right: 0px;}
</style>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>主播列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>主播列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&nickname=${nickname}&uid=${uid}&f_uuid=${f_uuid}&anchor_state=${anchor_state}&union_id=${union_id}&is_trial=${is_trial}&last_anchor_time=${last_anchor_time}&operate_centerid=${operate_centerid}"
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
												<form action="${BASE_PATH}/useranchor/list"
													autocomplete="off" method="get" class="form-inline" id="search_form">
													<div class="form-group">
														<div class="input-group">
															<input type="text" class="form-control" value="${uid>0?uid:''}"
																name="uid" placeholder="主播uid">
														</div>
													</div>
													<div class="form-group">
														<div class="input-group">
															<input type="text" class="form-control" value="${f_uuid>0?f_uuid:''}"
																name="f_uuid" placeholder="主播八位数房间号">
														</div>
													</div>
													<div class="form-group">
														<div class="input-group">
															<input class="form-control" value="${nickname}" name="nickname"
																type="text" placeholder="昵称">
														</div>
													</div>
											
													<div class="form-group">
														<select name="operate_centerid"class="form-control"
															onchange="$('#search_form').submit()">
															<option value="0">请选择运营中心</option>
															<c:forEach items="${operate}" var="operate">
															<option value="${operate.id}"<c:if test="${operate.id==operate_centerid}"> selected="selected"</c:if>>${operate.name}</option>
															</c:forEach>
														</select>
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
														<label class="control-label" for="status">&nbsp;</label> <a
															href="${BASE_PATH}/useranchor/getinfo?uid=0"
															class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加主播</button>
														</a>
													</div>
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger" href="${BASE_PATH}/useranchor/exportexcel?uid=${uid}&f_uuid=${f_uuid}&nickname=${nickname}&operate_centerid=${operate_centerid}">导出</a>
															</span>
														</div>
													</div>	
												    <br/>
												    <br/>											
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger" href="${BASE_PATH}/useranchor/exportexcel2?union_id=${union_id}">导出魅力值变更日志</a>
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
																<th class="text-center">主播UID</th>
																<th class="text-center">房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">是否为推广员</th>
																<th class="text-center">运营中心</th>
																<th class="text-center">分成占比</th>
																<th class="text-center">代理</th>
																<th class="text-center">分成占比</th>														
																<th class="text-center">总星光值</th>
																<th class="text-center">可用魅力值</th>
																<th class="text-center">直播累计所得魅力值</th>
																<th class="text-center">推广累计所得魅力值</th>	
																<th class="text-center">总收益魅力值</th>
																<!-- <th class="text-center">是否开启为虚拟账号</th>	 -->																										
																<th class="text-center footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userAnchorList}" var="userAnchor">
																<tr class="text-center">
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${userAnchor.uid}&type=4">${userAnchor.uid}</a></td>
																	<td>${userAnchor.f_uuid}</td>
																	<td><a href="${BASE_PATH}/userinfo/detail?id=${userAnchor.uid}&type=4">${userAnchor.nickname}</a></td>
																	<td>${userAnchor.ispromoter==0?'否':'是' }</td>
																	<td>${userAnchor.operateName}</td>		
																	<td>${userAnchor.operate_divide}%</td>
																	<td>${userAnchor.agentName}</td>
																	<td>${userAnchor.agent_divide}%</td>															
																	<td><a href="${BASE_PATH}/useranchor/profitlist?uid=${userAnchor.uid}">${userAnchor.total_anchor_virtual}</a></td>
																	<td>${userAnchor.surplus_anchor_virtual}</td>		
																	<td>${userAnchor.total_live_virtual }</td>
																	<td>${userAnchor.total_promote_virtual }</td>
																	<td>${userAnchor.total_live_virtual+userAnchor.total_promote_virtual }</td>																																
																	<%-- <td><c:choose>
																			<c:when test="${userAnchor.is_virtual==0}">
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" class="onoffswitch-checkbox"
																						id="examples${userAnchor.uid}" value="${userAnchor.uid}">																			
																					<label class="onoffswitch-label"
																						for="examples${userAnchor.uid}"> <span
																						class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>

																			</c:when>
																			<c:otherwise>
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" checked
																						class="onoffswitch-checkbox"
																						id="examples${userAnchor.uid}" value="${userAnchor.uid}">
																					<label class="onoffswitch-label"
																						for="examples${userAnchor.uid}"> <span
																						class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose> 
																		</td>	 --%>														
																	<td><span class="actionclick" style="cursor:pointer">更多&nbsp;<i class="click-expand glyphicon glyphicon-plus"></i></span>
																	<div class="actiondiv">
																	<a
																		href="${BASE_PATH}/useranchor/getinfo?uid=${userAnchor.uid}" class="btn btn-xs btn-outline btn-success mt10">主播信息</a><br/>
																		<a href="${BASE_PATH}/useranchor/timelist?uid=${userAnchor.uid}" class="btn btn-xs btn-outline btn-success mt10">直播记录</a><br/>
																		<a class="btn btn-xs btn-outline btn-danger mt10"
																		href="javascript:deleteUserAnchor(${userAnchor.id})">删除</a><br/>																		
																		<a href="${BASE_PATH}/useranchor/virtualchangelist?uid=${userAnchor.uid}" class="btn btn-xs btn-outline btn-success mt10">魅力值变更日志</a><br/>
																		<a href="${BASE_PATH}/useranchor/adminlist?f_uuid=${userAnchor.f_uuid}" class="btn btn-xs btn-outline btn-success mt10">房管设置</a><br/>																		
																	</div>
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
<div id="divide-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">设置直播分成占比</h3>
						<form class="form-horizontal" role="form" id="divide_form" action="${BASE_PATH}/useranchor/updatedivide" method="post">
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">*直播分成占比:</label>
								<div class="col-sm-4">
									<input type="hidden" name="uid"/>
									<input type="text" class="form-control" name="divide_proportion">
								</div>
								<div class="col-sm-1">
									<label class="control-label">%</label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-10 control-label text-right">例：如主播分成比例=70%，即公司与主播的收益三七分</label>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-6 control-label text-right"><a>查看该主播分成比例修改记录</a></label>
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
						<h3 class="m-t-none m-b">设置提现方式</h3>
						<form class="form-horizontal" role="form" id="withdraw_form" action="${BASE_PATH}/useranchor/savewithdrawtype" method="post">
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
<div id="info-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content"></div>
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
						<h3 class="m-t-none m-b">奖励钻石数</h3>
						<form id="reward" action="${BASE_PATH}/useranchor/savebalancevirsualadd" method="post">
							<input type="hidden" name="uid" value="${uid}"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">现有钻石数：</label>
								<div class="col-sm-9">
									<label class="control-label" id="balance_virtual"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">赠送钻石：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="add" value="300">
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
<div id="rewardkey-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">奖励钥匙</h3>
						<form id="rewardkey" action="${BASE_PATH}/useranchor/rewardkeycount" method="post">
							<input type="hidden" name="id" />
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">现有钥匙：</label>
								<div class="col-sm-9">
									<label class="control-label" id="key_count"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">奖励钥匙：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="add">
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
<div id="rewarddiamonds-modal-form" class="modal fade" aria-hidden="true">
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
							action="${BASE_PATH}/useranchor/savediamonds"
							method="post">
							<input type="hidden" name="id" value="${uid}" />
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
										<label> <input type="radio" value="zftype2"
											name="diamondsa"> <i></i>家族充值
										</label>
									</div>
									<div class="i-checks">
										<label> <input type="radio" value="zftype3"
											name="diamondsa"> <i></i>奖励充值
										</label>
									</div>

								</div>
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
							<div class="form-group col-sm-12" style="display: none;"
												id="jiazu-form">
								<label class="col-sm-3 control-label text-right">家族：</label>
								<div class="col-sm-9">

									<select class="form-control m-b" name="familyselect">
										<option value="0">无</option>
										<c:forEach items="${familyList}" var="family">
											<option value="${family.name}">${family.name}</option>
										</c:forEach>

									</select>
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

<div id="disturb-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">设置免打扰</h3>
						<form id="disturb" action="${BASE_PATH}/useranchor/saveonedisturb" method="post">
							<input type="hidden" name="uid" value=""/>
							<input type="hidden" name="one_disturb" value=""/>
							<div class="col-sm-10" id="tips">
								
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
<div id="one_divide-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">设置一对一分成占比</h3>
						<form class="form-horizontal" role="form" id="one_divide_form" action="${BASE_PATH}/useranchor/updateonedivide" method="post">
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">*一对一分成占比:</label>
								<div class="col-sm-4">
									<input type="hidden" name="uid"/>
									<input type="text" class="form-control" name="one_divide_proportion">
								</div>
								<div class="col-sm-1">
									<label class="control-label">%</label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-10 control-label text-right">例：如主播分成比例=70%，即公司与主播的收益三七分</label>
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<script type="text/javascript"> 

	function deleteUserAnchor(id) {
		deleteConfirm(id, "${BASE_PATH}/useranchor/delete", "该信息");
	}
	function closeAnchor(f_uuid) {
		deleteConfirm(f_uuid, "${BASE_PATH}/useranchor/close", "直播","踢出");
	}
	function showWithdraw(uid)
	{
		$.get("${BASE_PATH}/useranchor/getwithdraw",{uid:uid},function(json){
			$("#withdraw-modal-form").modal('show');
			$("#withdraw_form").find("input[name=uid]").val(uid);
			$("#withdraw_form").find("input[name=withdraw_type]").val(json.withdraw_type);
			$("#withdraw_form").find("input[name=withdraw_pass]").val(json.withdraw_pass);
			$("#withdraw_form").find("input[name=withdraw_name]").val(json.withdraw_name);
		});	
	}
	function showDivide(uid)
	{
		$.get("${BASE_PATH}/useranchor/getdivide",{uid:uid},function(data){
			$("#divide-modal-form").modal('show');
			$("#divide-modal-form").find("input[name=uid]").val(uid);
			$("#divide-modal-form").find("input[name=divide_proportion]").val(data);
		});	
	}
	function showOneDivide(uid, one_divide_proportion)
	{
		$("#one_divide-modal-form").modal('show');
		$("#one_divide-modal-form").find("input[name=uid]").val(uid);
		$("#one_divide-modal-form").find("input[name=one_divide_proportion]").val(one_divide_proportion);
	}
	/* function balanceVirtualAdd(uid, balance_virtual)
	{
		$("#reward-modal-form").modal('show');
		$("#reward-modal-form").find("input[name=uid]").val(uid);
		$("#reward-modal-form").find("#balance_virtual").text(balance_virtual);
	} */
	$().ready(function() {
		$("#divide_form").validate({
			rules: {
				divide_proportion: {required:true,digits:true}
			},
			messages: {
				divide_proportion: {required:"直播分成占比不能为空",digits:"直播分成占比只能是整数"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#divide_form"), function(json){
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
		$("#withdraw_form").validate({
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
		        ajaxSubmit($("#withdraw_form"), function(json){
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
				add: {required:true,digits:true}
			},
			messages: {
				add: {required:"赠送钻石不能为空",digits:"赠送钻石只能是整数"}
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
		$("#rewardkey").validate({
			rules: {
				add: {required:true,digits:true}
			},
			messages: {
				add: {required:"奖励钥匙不能为空",digits:"奖励钥匙只能是整数"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#rewardkey"), function(json){
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
		$("#changevirtual").validate({
			rules: {
				remark: {required:true,maxlength:200}
			},
			messages: {
				remark: {required:"操作说明不能为空",maxlength:"操作说明长度不能大于200个字"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#changevirtual"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
	        		{
		        		$("#changevirtual-modal-form").modal('hide');
	        			show(json, window.location.href.replace('#',''));
	        		}
		        });
	        	return false;
	    	}
		});
		$("#reward2").validate(
		{
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
				ajaxSubmit(
						$("#reward2"),
						function(json) {
							if (json.code == -3) {
								for ( var key in json.msg) {
									$("*[name="+ json.msg[key].name+ "]").addClass("error");
									$("*[name="+ json.msg[key].name+ "]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+ json.msg[key].value+ "</label>");
								}
							} else
								window.location.reload();
						});
				return false;
			}
		});
		$("#disturb").validate({
			submitHandler : function() {
				ajaxSubmit(
						$("#disturb"),
						function(json) {
							if (json.code == -3) {
								for ( var key in json.msg) {
									$("*[name="+ json.msg[key].name+ "]").addClass("error");
									$("*[name="+ json.msg[key].name+ "]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+ json.msg[key].value+ "</label>");
								}
							} else
								window.location.reload();
						});
				return false;
			}
		});
		$("#one_divide_form").validate({
			rules: {
				one_divide_proportion: {required:true,digits:true}
			},
			messages: {
				one_divide_proportion: {required:"一对一分成占比不能为空",digits:"一对一分成占比只能是整数"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#one_divide_form"), function(json){
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
		$(document).on("click",".actionclick",function(){
			var i_action = $(this).children("i");
			$(".actionclick").next("div").hide();
			if(i_action.hasClass("click-expand"))
			{
				i_action.removeClass("click-expand");
				i_action.addClass("click-collapse");
				i_action.removeClass("glyphicon-plus");
				i_action.addClass("glyphicon-minus");
				$(this).next("div").show();
			}
			else
			{
				i_action.removeClass("click-collapse");
				i_action.addClass("click-expand");
				i_action.removeClass("glyphicon-minus");
				i_action.addClass("glyphicon-plus");
				$(this).next("div").hide();
			}
		});
		$(document).bind("click",function(e){ 
			var target = $(e.target); 
			if(target.closest(".actiondiv").length == 0&&target.closest(".actionclick").length==0){ 
				$(".actionclick").children("i").removeClass("click-collapse");
				$(".actionclick").children("i").addClass("click-expand");
				$(".actionclick").children("i").removeClass("glyphicon-minus");
				$(".actionclick").children("i").addClass("glyphicon-plus");
				$(".actiondiv").hide();
			} 
		});
	});
	function checkConfirm(target, cid, type)
	{
			var checked = $(target).prop("checked");
			var id = $(target).val();
			var anchor_type = 0;
			var xiuChangChecked = $("#xiuChangCheck"+cid).prop("checked");
			var youxiChecked = $("#youxiCheck"+cid).prop("checked");
			if(xiuChangChecked&&!youxiChecked)
				anchor_type = 1;
			else if(!xiuChangChecked&&youxiChecked)
				anchor_type = 2;
			else if(xiuChangChecked&&youxiChecked)
				anchor_type = 3;
			var title = type==1?"主播秀场直播权限？":"主播游戏直播权限？";
			swal({
				title : "主播直播权限",
				text : (checked?"是否开启":"是否关闭")+title,
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#1ab394",
				confirmButtonText : "确认",
				cancelButtonText : "取消",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({type: "POST",url:"${BASE_PATH}/useranchor/updatestate",data: {uid:id,anchor_type:anchor_type},success:function(data){
						if(data > 0)
						{
							window.location.reload();
						}	
					}});
				}
			});	
	}
	function rewardKeyCount(id, key_count) {
		$("#rewardkey-modal-form").modal('show');
		$("#rewardkey-modal-form").find("input[name=id]").val(id);
		$("#rewardkey-modal-form").find("#key_count").text(key_count);
	}
	function balanceVirtualAdd(uid, balance_virtual) {
		$("#rewarddiamonds-modal-form").modal('show');
		$("#rewarddiamonds-modal-form").find("input[name=id]").val(uid);
		$("#rewarddiamonds-modal-form").find("#balance_virtual").text(balance_virtual);
	}
	function changeVirtual(uid, surplus_anchor_virtual)
	{
		$("#changevirtual-modal-form").modal('show');
		$("#changevirtual-modal-form").find("input[name=uid]").val(uid);
		$("#changevirtual-modal-form").find("input[name=surplus_anchor_virtual]").val(surplus_anchor_virtual);
		$("#changevirtual-modal-form").find("input[name=remark]").val("");
	}
	function selectVirtualPercent(percent)
	{
		var surplus_anchor_virtual = $("#changevirtual-modal-form").find("input[name=surplus_anchor_virtual]").val(); 
		$("#changevirtual-modal-form").find("input[name=remark]").val((surplus_anchor_virtual*percent/100).toFixed(2));
		$("#changevirtual-modal-form").find("input[name=change_virtual]").val(surplus_anchor_virtual);
	}
    function saveOneDisturb(uid, one_disturb)
    {
    	$("#disturb-modal-form").modal('show');
		$("#disturb-modal-form").find("input[name=uid]").val(uid);
		$("#disturb-modal-form").find("input[name=one_disturb]").val(one_disturb);
		if(one_disturb==1)
		{
			$("#disturb-modal-form").find("#tips").text("确定开启免打扰？");
		}
		else
		{
			$("#disturb-modal-form").find("#tips").text("确定取消免打扰？");
		}
    }
	
</script>