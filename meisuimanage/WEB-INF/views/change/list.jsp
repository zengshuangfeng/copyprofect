<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>充值套餐</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石</a></li>
					<li class="active"><strong>充值套餐</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-2">
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label> <a
														href="#change-modal-form" data-toggle="modal" 
														class="input-group">
														<button type="button" class="btn btn-w-m btn-primary">添加</button>
													</a>
												</div>
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
																<th class="text-center">充值名额（元）</th>
																<th class="text-center">包含钻石</th>
																<th class="text-center">会员价(3%)</th>
																<th class="text-center">套餐状态</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">编辑时间</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${changeList}" var="change">														
																<tr class="text-center">
																
																	<td>${change.change_rmb}</td>
																	<td>${change.virtual_count}</td>
																		<td id="virtualtd">
																		<c:choose>
																			<c:when test="${change.is_virtual==0}">
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" class="onoffswitch-checkbox"
																						id="example${change.id}" value="${change.id}"> <label
																						class="onoffswitch-label" for="example${change.id}">
																						<span class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>

																			</c:when>
																			<c:otherwise>
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" checked
																						class="onoffswitch-checkbox" id="example${change.id}" value="${change.id}">
																					<label class="onoffswitch-label" for="example${change.id}">
																						<span class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose>
																		</td>
																	<td id="onlinetd"><c:choose>
																			<c:when test="${change.is_online==0}">
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" class="onoffswitch-checkbox"
																						id="examples${change.id}" value="${change.id}"> <label
																						class="onoffswitch-label" for="examples${change.id}">
																						<span class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>

																			</c:when>
																			<c:otherwise>
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" checked
																						class="onoffswitch-checkbox" id="examples${change.id}" value="${change.id}">
																					<label class="onoffswitch-label" for="examples${change.id}">
																						<span class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose></td>
																	<td>${change.w_name}</td>
																	<td>${change.update_time}</td>
																	<td>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteRecommend(${change.id})">删除</a><br></td>
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
<div id="change-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<form id="change" action="${BASE_PATH}/change/save" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">充值面额（元）：</label>
								<div class="col-sm-6">
									<select name="change_rmb" class="form-control">
										<option value="6">￥6.00</option>
										<option value="25">￥25.00</option>
										<option value="28">￥28.00</option>
										<option value="50">￥50.00</option>
										<option value="58">￥58.00</option>
										<option value="68">￥68.00</option>
										<option value="88">￥88.00</option>
										<option value="108">￥108.00</option>
										<option value="158">￥158.00</option>
										<option value="208">￥208.00</option>
										<option value="318">￥318.00</option>
										<option value="518">￥518.00</option>
										<option value="998">￥998.00</option>
										<option value="1998">￥1998.00</option>
										<option value="2998">￥2998.00</option>
										<!-- <option value="4998">￥4998.00</option>
										<option value="8888">￥8888.00</option>
										<option value="9998">￥9998.00</option> -->
									</select>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">包含钻石：</label>
								<div class="col-sm-6">
									<label class="control-label">600</label>
									<input type="hidden" name="virtual_count" value="600"/>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">会员价(3%)：</label>
								<div class="col-sm-8">
									<div class="radio radio-info radio-inline">
										<input type="radio" value="1" name="is_virtual"
											checked="checked" /> <label for="inlineRadio1">&nbsp;是</label>
									</div>
									<div class="radio radio-inline">
										<input type="radio" value="0" class="ml15" name="is_virtual" />
										<label for="inlineRadio2">&nbsp;否</label>
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#onlinetd .onoffswitch-checkbox").click(function(){
			var checked = $(this).prop("checked");
			var id = $(this).val();
			swal({
				title : "设置套餐状态",
				text : checked?"是否开启该套餐？":"是否关闭该套餐？",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#1ab394",
				confirmButtonText : "确认",
				cancelButtonText : "取消",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({type: "POST",url:"${BASE_PATH}/change/updateisonline",data: {id:id,is_online:checked?1:0},success:function(data){
						if(data > 0)
						{
							window.location.reload();
						}	
					}});
				}
			});			
		});
		$("select[name=change_rmb]").change(function(){
			var rmb = parseInt($(this).val());
			$("input[name=virtual_count]").val(rmb*100);
			$("input[name=virtual_count]").prev("label").text(rmb*100);
		});
		$("#change").validate({
			submitHandler: function(){
		        ajaxSubmit($("#change"), function(json){
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
	function deleteRecommend(id) {
		deleteConfirm(id, "${BASE_PATH}/change/delete", "该套餐");
	}
	
	$(function() {
		$("#virtualtd .onoffswitch-checkbox").click(function(){
			var checked = $(this).prop("checked");
			var id = $(this).val();
			swal({
				title : "设置会员价状态",
				text : checked?"是否开启会员？":"是否关闭会员？",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#1ab394",
				confirmButtonText : "确认",
				cancelButtonText : "取消",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({type: "POST",url:"${BASE_PATH}/change/updateivirtual",data: {id:id,is_virtual:checked?1:0},success:function(data){
						if(data > 0)
						{
							window.location.reload();
						}	
					}});
				}
			});			
		});	
	});
</script>