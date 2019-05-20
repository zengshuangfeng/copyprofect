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
				<h2>游戏列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>游戏管理</a></li>
					<li class="active"><strong>游戏列表</strong></li>
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
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">游戏名称</th>
																<th class="text-center">排序</th>
																<th class="text-center">开关</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${gameTypeList}" var="gameType">
																<tr class="text-center">
																	<td>${gameType.name}</td>
																	<td>${gameType.sort}</td>
																	<td><c:choose>
																			<c:when test="${gameType.is_open==1}">
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox" checked class="onoffswitch-checkbox"
																						id="youxiCheck${gameType.id}" onclick="checkConfirm(this,${gameType.id},0)"> <label
																						class="onoffswitch-label" for="youxiCheck${gameType.id}">
																						<span class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>

																			</c:when>
																			<c:otherwise>
																				<div style="text-align: left; margin: 0 auto;"
																					class="onoffswitch">
																					<input type="checkbox"
																						class="onoffswitch-checkbox" id="youxiCheck${gameType.id}" onclick="checkConfirm(this,${gameType.id},1)">
																					<label class="onoffswitch-label" for="youxiCheck${gameType.id}">
																						<span class="onoffswitch-inner"></span> <span
																						class="onoffswitch-switch"></span>
																					</label>
																				</div>
																			</c:otherwise>
																		</c:choose></td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="javascript:updateSort(${gameType.id}, ${gameType.sort},'${gameType.name}')">编辑</a>
																	</td>
																</tr>
															</c:forEach>
														</tbody>
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
<div id="sort-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b"></h3>
						<form class="form-horizontal" role="form" id="sort_form" action="${BASE_PATH}/gametype/updatesort" method="post">
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">排序：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="sort">
									<input type="hidden" name="id"/>
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
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<script type="text/javascript">
	function updateSort(id, sort, name)
	{
		$("#sort-modal-form").modal('show');
		$("#sort-modal-form").find("h3").text(name);
		$("#sort-modal-form").find("input[name=id]").val(id);
		$("#sort-modal-form").find("input[name=sort]").val(sort);
	}
	$().ready(function() {
		$("#sort_form").validate({
			rules: {
				sort: {required:true,digits:true}
			},
			messages: {
				sort: {required:"排序不能为空",digits:"排序只能是整数"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#sort_form"), function(json){
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
	function checkConfirm(target, id, is_open)
	{
			var checked = $(target).prop("checked");
			swal({
				title : "游戏开关",
				text : (checked?"是否开启游戏":"是否关闭游戏"),
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#1ab394",
				confirmButtonText : "确认",
				cancelButtonText : "取消",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({type: "POST",url:"${BASE_PATH}/gametype/updateopen",data: {id:id,is_open:is_open},success:function(data){
						if(data > 0)
						{
							window.location.reload();
						}	
					}});
				}
				else
				{
					window.location.reload();
				}
			});	
	}
</script>