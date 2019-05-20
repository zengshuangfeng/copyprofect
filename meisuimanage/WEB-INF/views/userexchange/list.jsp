<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>订单列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>商品管理</a></li>
					<li class="active"><strong>订单列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&status=${status}&type=${type}&p_name=${p_name}&start_time=${start_time}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">	
									<div class="m-b-sm">
										<form action="${BASE_PATH}/userexchange/list" autocomplete="off"
											method="get" id="tab">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">状态</label> <select
															name="status" class="form-control" onchange="$('#tab').submit()">
															<option value="-1">全部</option>
															<option value="0"
																<c:if test="${status==0}"> selected="selected"</c:if>>未付款</option>
															<option value="1"
																<c:if test="${status==1}"> selected="selected"</c:if>>待发货</option>
															<option value="2"
																<c:if test="${status==2}"> selected="selected"</c:if>>已发货</option>
															<option value="3"
																<c:if test="${status==3}"> selected="selected"</c:if>>已失效</option>
														</select>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="type">商品类型</label> <select
															name="type" class="form-control" onchange="$('#tab').submit()">
															<option value="-1">不限</option>
															<option value="0"
																<c:if test="${type==0}"> selected="selected"</c:if>>钥匙兑换</option>
															<option value="1"
																<c:if test="${type==1}"> selected="selected"</c:if>>现金支付</option>
														</select>
													</div>
												</div>
												<div class="col-sm-2" style="width:220px">
													<div class="form-group">
														<label class="control-label">商品名称</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${p_name}" name="p_name">
														</div>
													</div>
												</div>
												<div class="col-sm-2" style="width:220px">
													<div class="form-group">
														<label class="control-label">下单时间</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${start_time}" name="start_time" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">&nbsp;</label>
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
																<th class="text-left footable-first-column">ID</th>
																<th class="text-center">商品名称</th>
																<th class="text-center">商品图</th>
																<th class="text-center">商品类型</th>
																<th class="text-center">数量</th>
																<th class="text-center">买家</th>
																<th class="text-center">下单时间</th>
																<th class="text-center">订单状态</th>
																<th class="text-center">钥匙/金额</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userExchangeList}" var="userExchange">
																<tr class="text-center">
																	<td class="text-left footable-first-column">${userExchange.id}</td>
                           											<td>${userExchange.p_name}</td>
                           											<td class="col-xs-1">
																		<c:choose><c:when test="${not empty userExchange.p_pic}">
                                   			 							<img class="col-xs-12" src="${uploadUrl}${userExchange.p_pic}">
                                   			 							</c:when>
                                   			 							<c:otherwise><img class="col-xs-12" src="${ctx}/img/default.jpg"  /></c:otherwise>
                                   			 							</c:choose>
                           											</td>	
                           											<td>${userExchange.type==0?'钥匙兑换':'现金支付'}</td>	
                           											<td>1</td>
                           											<td>${userExchange.nickname}</td>
                           											<td>${userExchange.create_time}</td>
                           											<td>
                           												<c:choose>
                           													<c:when test="${userExchange.status==0}">待付款</c:when>
                           													<c:when test="${userExchange.status==1}">待发货<br/>
                           													<a class="btn btn-xs btn-outline btn-primary" href="javascript:send(${userExchange.id})">发货</a>
                           													</c:when>
                           													<c:when test="${userExchange.status==2}">已发货<br/>
                           													<a class="btn btn-xs btn-outline btn-primary" href="javascript:updateLogistics(${userExchange.id})">修改物流</a>
                           													</c:when>
                           													<c:when test="${userExchange.status==3}">已失效</c:when>
                           												</c:choose>
																	</td>
                           											<td>${userExchange.price}</td>			
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/userexchange/detail?id=${userExchange.id}">详情</a>
																		<c:choose>
																			<c:when
																				test="${userExchange.status==1||userExchange.status==2}">
																				<a class="btn btn-xs btn-outline btn-danger"
																					href="javascript:updateStatus(${userExchange.id}, 3)">置为失效</a>
																			</c:when>
																			<c:when test="${userExchange.status==3}">
																				<span class="label label-default">失效</span>
																			</c:when>
																		</c:choose></td>
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
<div id="send-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">商品发货</h3>
						<form id="send" action="${BASE_PATH}/userexchange/updatelogistics" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<input type="hidden" name="id" />
							<input type="hidden" name="status" value="2"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">发货方式：</label>
								<div class="col-sm-7">
									<div class="radio-info radio-inline">
										<input type="radio" value="1" name="need_logistics"
											checked="checked" /> <label for="inlineRadio1">&nbsp;需要物流</label>
									</div>
									<div class="radio-info radio-inline">
										<input type="radio" value="0" class="ml15" name="need_logistics" />
										<label for="inlineRadio2">&nbsp;不需物流</label>
									</div>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">物流公司：</label>
								<div class="col-sm-4">
									<select name="logistics_name" class="form-control">
										<option value="">请选择</option>
										<option value="顺丰物流">顺丰物流</option>
										<option value="圆通物流">圆通物流</option>
									</select>
								</div>
								<div class="col-sm-5">
									<input type="text" name="logistics_code" class="form-control" placeholder="请输入快递单号">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">备注：</label>
								<div class="col-sm-9">
									<input type="text" name="remark" class="form-control">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">收货信息：</label>
								<div class="col-sm-9">
									<label style="font-weight: 500" class="control-label" id="send_info"></label>
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
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function updateStatus(id, status)
	{
			swal({
				title : "置为失效",
				text : "是否将订单置为失效？",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#1ab394",
				confirmButtonText : "确认",
				cancelButtonText : "取消",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({type: "POST",url:"${BASE_PATH}/userexchange/updatestatus",data: {id:id,status:status},success:function(data){
						if(data > 0)
						{
							window.location.reload();
						}	
					}});
				}
			});	
	}
	$().ready(function() {
		$("#send").validate({
			rules: {
				remark: {maxlength:200}
			},
			messages: {
				remark: {maxlength:"备注长度不能大于200个字"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#send"), function(json){
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
		$("input[name=need_logistics]").click(function(){
			if($("input[name=need_logistics]:checked").val()=='0')
			{
				$("select[name=logistics_name]").find("option[value='']").attr("selected",true);
				$("input[name=logistics_code]").val("");
			}
		});
	});
	function send(id)
	{
		$("#send-modal-form").find("input[name=id]").val(id);
		$.get("${BASE_PATH}/userexchange/get",{id:id},function(json){
			$("#send_info").text(json.name+"         "+json.tel+"         "+json.address);
		});
		$("#send-modal-form").modal('show');
	}
	function updateLogistics(id)
	{
		$("#send-modal-form").find("input[name=id]").val(id);
		$.get("${BASE_PATH}/userexchange/get",{id:id},function(json){
			$("select[name=logistics_name]").find("option[value='"+json.logistics_name+"']").attr("selected",true);
			$("input[name=logistics_code]").val(json.logistics_code);
			$("input[name=remark]").val(json.remark);
			$("#send_info").text(json.name+"         "+json.tel+"         "+json.address);
		});
		$("#send-modal-form").modal('show');
	}
</script>