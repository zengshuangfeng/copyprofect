<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>主播申请列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>主播申请列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&is_contact=${is_contact}&uid=${uid}&f_uuid=${f_uuid}&nickname=${nickname}&qq=${qq}&phone=${phone}&remark=${remark}&start_time=${start_time}&end_time=${end_time}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/apply/list" autocomplete="off"
											method="get" id="select">
											<div class="row">
												<div class="col-sm-1" style="width:120px">
													<div class="form-group">
														<label class="control-label" for="jumpstyle">是否联系</label>
														<select name="is_contact" class="form-control"
															onchange="$('#select').submit()">
															<option value="-1">全部</option>
															<option value="1"<c:if test="${is_contact==1}"> selected="selected"</c:if>>是</option>
															<option value="0"<c:if test="${is_contact==0}"> selected="selected"</c:if>>否</option>
														</select>
													</div>
												</div>
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
														<label class="control-label">房间号</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:180px">
													<div class="form-group">
														<label class="control-label">昵称</label>
														<div class="input-group">
															<input type="text" class="form-control"
																value="${nickname}" name="nickname">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:180px">
													<div class="form-group">
														<label class="control-label">QQ</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${qq}"
																name="qq">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:180px">
													<div class="form-group">
														<label class="control-label">手机</label>
														<div class="input-group">
															<input type="text" class="form-control" value="${phone}"
																name="phone">
														</div>
													</div>
												</div>
												<br/>
												<div class="col-sm-2" style="clear:both">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control" value="${start_time}"
																name="start_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
														</div>
													</div>
												</div>
											    <div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span> <input id="date_modified"
																class="form-control" value="${end_time}" name="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																type="text">
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
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <label
															class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn"> <a
																class="btn btn-danger"
																href="javascript:exportExcel();">导出</a>
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
																<th class="text-center">UID</th>
																<th class="text-center">房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">照片预览</th>
																<th class="text-center">手机</th>
																<th class="text-center">QQ</th>
																<th class="text-center">是否是主播</th>
																<th class="text-center">是否为推广员</th>
																<th class="text-center">申清时间</th>
																<th class="text-center">是否联系</th>
																<th class="text-center">备注</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${applyList}" var="apply">
																<tr class="text-center">
																	<td>${apply.uid}</td>
																	<td>${apply.f_uuid}</td>
																	<td>${apply.nickname}</td>
																	<td class="col-xs-3">
																		<c:if test="${not empty apply.head}">
																			<c:set value="${fn:split(apply.head, ',') }" var="p_pics" />
																			<c:forEach items="${p_pics}" var="p_pic">
                                   			 								<img class="col-xs-4" src="${uploadUrl}${p_pic}" onclick="showImg('${uploadUrl}${p_pic}')">
                                   			 								</c:forEach>
                                   			 							</c:if>
                           											</td>
                           											<td>${apply.phone}</td>
                           											<td>${apply.qq}</td>
                           											<td>${apply.is_anchor==1?'是':'否'}</td>
                           											<td>${apply.ispromoter==0?'否':'是' }</td>
                           											<td>${apply.create_time}</td>
                           											<td>
                           												<c:choose>
                           													<c:when test="${apply.is_contact==1}"><span class="label label-primary">是</span></c:when>
                           													<c:when test="${apply.is_contact==0}"><span class="label label-danger">否</span></c:when>
                           												</c:choose>
                           											</td>
                           											<td>${apply.remark}</td>
																	<td><a class="btn btn-xs btn-outline btn-primary"
																		href="javascript:editApply(${apply.id}, ${apply.is_contact}, '${apply.remark}')">编辑</a>
																		<c:if test="${apply.is_anchor==0}">
																			<a href="${BASE_PATH}/apply/getinfo?uid=${apply.uid}&apply_id=${apply.id}" class="btn btn-xs btn-outline btn-success">通过</a>
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
<div id="apply-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">编辑申请信息</h3>
						<form id="apply" action="${BASE_PATH}/apply/save" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<input type="hidden" name="id" />
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">是否联系：</label>
								<div class="col-sm-8">
									<div class="radio radio-inline">
										<input type="radio" value="0" class="ml15" name="is_contact" checked="checked" />
										<label for="inlineRadio2">&nbsp;否</label>
									</div>
									<div class="radio radio-info radio-inline">
										<input type="radio" value="1" name="is_contact" /> <label for="inlineRadio1">&nbsp;是</label>
									</div>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">备注：</label>
								<div class="col-sm-6">
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
<div id="img-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">图片预览</h3>
						<form id="apply" action="${BASE_PATH}/apply/save" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<div class="form-group col-sm-12">
								<div class="col-sm-12">
									<img src="" class="col-sm-12"/>
								</div>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function editApply(id, is_contact, remark) {
		$("#apply-modal-form").modal('show');
		$("input[name=id]").val(id);
		$("input[name=is_contact][value="+is_contact+"]").prop("checked", true);
		$("textarea[name=remark]").val(remark);
	}
	function showImg(src)
	{
		$("#img-modal-form").modal('show');
		$("#img-modal-form").find("img").attr("src", src);
	}
	$(function(){
		$("#apply").validate({
			submitHandler: function(){
		        ajaxSubmit($("#apply"), function(json){
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
	function exportExcel()
	{
		var is_contact = $("select[name=is_contact]").val();
		var uid = $("input[name=uid]").val();
		var f_uuid = $("input[name=f_uuid]").val();
		var nickname = $("input[name=nickname]").val();
		var qq = $("input[name=qq]").val();
		var phone = $("input[name=phone]").val();
		var start_time = $("input[name=start_time]").val();
		var end_time = $("input[name=end_time]").val();
		if(typeof(end_time) =='undefined')
			end_time = "";
		location.href = "${BASE_PATH}/apply/exportexcel?is_contact="+is_contact+"&uid="+uid+"&f_uuid="+f_uuid+"&nickname="+nickname+"&qq="+qq+"&phone="+phone+"&start_time="+start_time+"&end_time="+end_time;
	}
</script>