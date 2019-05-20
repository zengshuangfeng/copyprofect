<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>关闭列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>监控管理</a></li>
					<li class="active"><strong>关闭列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&uid=${uid}&f_uuid=${f_uuid}&w_name=${w_name}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">										
										<form action="${BASE_PATH}/close/list" autocomplete="off" method="get" id="square_form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播UID</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${uid>0?uid:''}" name="uid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播房间号</label>
														<div class="input-group"><input type="text"
																class="form-control" value="${f_uuid>0?f_uuid:''}" name="f_uuid">
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">操作人</label>
														<div class="input-group">
															<select name="w_name" class="form-control"
																onchange="$('#square_form').submit()">
																<option value="">全部</option> 
																<c:forEach items="${wnameList}" var="wname">
																<option value="${wname}"<c:if test="${wname==w_name}"> selected="selected"</c:if>>${wname}</option>
																</c:forEach>
															</select>
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
																<th class="text-center">ID</th>
																<th class="text-center">被警告主播</th>
																<th class="text-center">主播ID</th>
																<th class="text-center">主播房间号</th>
																<th class="text-center">系统截图</th>
																<th class="text-center">警告理由</th>
																<th class="text-center">警告时间</th>
																<th class="text-center">操作人员</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${partnerRecordList}" var="partnerRecord">
																<tr class="text-center">
																	<td>${partnerRecord.id}</td>
																	<td>${partnerRecord.anchor_name}</td>
																	<td>${partnerRecord.uid}</td>
																	<td>${partnerRecord.f_uuid}</td>
																	<td class="col-xs-1"><img class="col-xs-12" src="${fn:startsWith(partnerRecord.pic,'http')?'':uploadUrl}${partnerRecord.pic}"/></td>
																	<td>${partnerRecord.reason}</td>
																	<td>${partnerRecord.create_time}</td>
																	<td>${partnerRecord.w_name}</td>
																	<td><div class="btn-group">
																			<a href="javascript:detail(${partnerRecord.id},'${partnerRecord.w_name}','${partnerRecord.create_time}','${partnerRecord.anchor_name}', ${partnerRecord.uid},'${partnerRecord.reason}','${partnerRecord.pic}')" class="btn btn-xs btn-outline btn-primary view-detail">查看详情</a>
																		</div></td>
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
<div class="modal inmodal" id="myModal" tabindex="-1" data-backdrop="static" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated bounceInRight">
			<form id="save_logis_form" method="post" action="${BASE_PATH}/square2/saveclose" class="form-horizontal">
				<input type="hidden"  name="id" value="">
				<input type="hidden" name="type" value="1">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">警告详情</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-3 control-label">操作人:</label>
						<div class="col-sm-3">
							<span id="u_w_name" class="form-control"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">警告时间:</label>
						<div class="col-sm-7">
							<span id="u_create_time" class="form-control"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">被警告主播:</label>
						<div class="col-sm-4">
							<span id="u_anchor_name" class="form-control"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">主播ID:</label>
						<div class="col-sm-3">
							<span id="u_uid" class="form-control"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">警告理由:</label>
						<div class="col-sm-7">
							<input id="u_reason" class="form-control" type="text" name="reason" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">系统截图:</label>
						<div class="col-sm-6">
							<img id="u_pic" src="" style="max-width:300px"  />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">手动截图:</label>
						<div class="btn-group col-sm-4">
							<input name="upload" id="fileInput5" type="file" /><input
								type="hidden" id="imageHidden5" name="pic" /> <input
								type="hidden" name="pic_picsize3" value="" />
							<div id="singleDiv5"></div>
							<img src="" class="wd200 hide" id="image5" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">保存</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		 singleImage("#fileInput5", "peipei", "#image5", "#imageHidden5","singleDiv5");
		 $("#save_logis_form").validate({
				submitHandler: function(){
					$("#myModal").modal("hide");
					ajaxSubmit($("#save_logis_form"), function(json){
						if(json.code==1){
							swal({
							  title:"",
							  text: "更新成功",
							  type: "info",
							  showCancelButton: false,
							  closeOnConfirm: false
							},
							function(){
							  location.reload();
							});
						}
				    });
			        return false;
		    	}
		});
	});
	function detail(id, w_name, create_time, anchor_name, uid, reason, pic)
	{
		$("#myModal").find("input[name=id]").val(id);
		$("#myModal").find("#u_w_name").text(w_name);
		$("#myModal").find("#u_create_time").text(create_time);
		$("#myModal").find("#u_anchor_name").text(anchor_name);
		$("#myModal").find("#u_uid").text(uid);
		$("#myModal").find("input[name=reason]").val(reason);
		$("#myModal").find("#u_pic").attr("src", '${uploadUrl}'+pic);
		$("#myModal").find("input[name=pic]").val(pic);
		$("#myModal").modal('show');
	}
</script>