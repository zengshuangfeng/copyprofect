<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>直播时间列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>直播时间列表</strong></li>
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
														href="javascript:addLiveTime()" 
														class="input-group">
														<button type="button" class="btn btn-w-m btn-primary">添加</button>
													</a>
												</div>
											</div>
											<div class="col-sm-5">
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label> <span
														class="help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;不要设置类似20:00-01:00,隔天请分开两次设置，如20:00-23:59,00:00-01:00</span>
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
																<th class="text-center footable-first-column">ID</th>
																<th class="text-center">开始时间</th>
																<th class="text-center">结束时间</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">编辑时间</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${liveTimeList}" var="liveTime">
																<tr class="text-center">
																	<td class="footable-first-column">${liveTime.id}</td>
																	<td>${liveTime.s_time}</td>	
																	<td>${liveTime.e_time}</td>																	
																	<td>${liveTime.w_name}</td>																	
																	<td>${liveTime.update_time}</td>
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="javascript:editLiveTime(${liveTime.id}, '${liveTime.s_time}', '${liveTime.e_time}')">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteLiveTime(${liveTime.id})">删除</a></td>
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
<div id="time-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">添加直播时间</h3>
						<form id="time" action="${BASE_PATH}/livetime/save" method="post">
							<input type="hidden" name="id" value="0"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">开始时间：</label>
								<div class="col-sm-6">
									<input type="text" name="s_time" class="control-label" onClick="WdatePicker({dateFmt:'HH:mm'})"/>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">结束时间：</label>
								<div class="col-sm-6">
									<input type="text" name="e_time" class="control-label" onClick="WdatePicker({dateFmt:'HH:mm'})"/>
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	function deleteLiveTime(id) {
		deleteConfirm(id, "${BASE_PATH}/livetime/delete", "该信息");
	}
	function addLiveTime()
	{
		$("#time-modal-form").find(".m-t-none").text("添加直播时间");
		$("#time-modal-form").modal('show');
	}
	function editLiveTime(id, s_time, e_time)
	{
		$("#time-modal-form").find(".m-t-none").text("编辑直播时间");
		$("#time-modal-form").find("input[name=id]").val(id);
		$("#time-modal-form").find("input[name=s_time]").val(s_time);
		$("#time-modal-form").find("input[name=e_time]").val(e_time);
		$("#time-modal-form").modal('show');
	}
	$(function(){
		$("#time").validate({
			rules: {
				s_time: {required:true},
				e_time: {required:true}
			},
			messages: {
				s_time: {required:"开始时间不能为空"},
				e_time: {required:"结束时间不能为空"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#time"), function(json){
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