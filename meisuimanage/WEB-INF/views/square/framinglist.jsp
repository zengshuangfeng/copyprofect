<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<style>
.product-box{
	width: 230px;
}
.product-imitation {
	padding:0;
	width: 230px;
    height: 230px;
    background: #000;
}
.live-monitor{
	height: 230px;
}
.product-desc {
	padding: 10px;
}
</style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>分帧监控</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>监控管理</a></li>
					<li class="active"><strong>分帧监控</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&f_uuid=${f_uuid}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<form action="${BASE_PATH}/framing/list" autocomplete="off"
											method="get" id="square_form">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label">主播：</label>
														<div class="input-group">
															<select name="f_uuid" class="form-control"
																onchange="$('#square_form').submit()">
																<option value="0">全部</option>
																<c:forEach items="${allSquareList}" var="square">
																<option value="${square.f_uuid}"<c:if test="${square.f_uuid==f_uuid}"> selected="selected"</c:if>>${square.nickname}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content" id="square_content">
													<c:forEach items="${squareList}" var="square">
														<div class="col-md-2 square_video">
															<div class="ibox">
																<div class="ibox-content product-box active">
																	<div class="product-imitation">
																	<img class="live-monitor" id="${square.f_uuid}" src="${square.anchor_cover}">
																	</div>
																	<div class="product-desc">
																		<h3>
																			<c:choose>
																				<c:when test="${not empty square.anchor_notice}">${square.anchor_notice}</c:when>
																				<c:otherwise>无标题</c:otherwise>
																			</c:choose>
																		</h3>
																		<div class="m-t-xs">主播昵称：${square.nickname}</div>
																		<div id="watch_${square.f_uuid}" class="m-t-xs">观看人数：${square.watch_count}</div>
																		<div id="real_${square.f_uuid}" class="m-t-xs">真实人数：${square.real_count}</div>
																		<div class="m-t-xs">uid：${square.uid}</div>
																		<div class="m-t-xs">房间号：${square.f_uuid}</div>
																		<div class="m-t" style="text-align: center;">
																			<a 
																				onclick="return waringAnchor(${square.uid},${square.f_uuid},'${square.nickname}')"
																				class="btn btn-warning">警告</a> <a 
																				onclick="return closeAnchor(${square.uid},${square.f_uuid},'${square.nickname}')"
																				class="btn btn-danger" style="margin-left: 20%;">关闭</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
												<div style="clear:both">
													<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
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
<div class="modal inmodal fade in" id="myModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated ">
			<form id="save_logis_form" method="post"
				action="${BASE_PATH}/square2/savewarning" class="form-horizontal">
				<input type="hidden" id="beanId" name="id" value=""> 
				<input type="hidden" name="type" value="">
				<input type="hidden" name="uid" value="">
				<input type="hidden" name="f_uuid" value=""> 
				<input type="hidden" name="anchor_name" value="">
				<div class="modal-header">
					<h4 class="modal-title" style="color: red;" id="title"></h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-3 control-label">直播昵称:</label>
						<div class="col-sm-7" style="margin-top:7px">
							<span id="u_anchor_name"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">理由:</label>
						<div class="col-sm-7">
							<input id="u_reason" class="form-control" type="text"
								name="reason" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">理由:</label>
						<div class="col-sm-7">
							<select id="reason_select"
								class="form-control select2-hidden-accessible">
								<option></option>
								<option value="太丑">太丑</option>
								<option value="坦胸露乳">坦胸露乳</option>
								<option value="少儿不宜">少儿不宜</option>
								<option value="违规操作">违规操作</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">系统截屏:</label>
						<div class="btn-group col-sm-4">
							<img src="" class="wd200" id="sys-img" style="width: 120px;" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">截屏:</label>
						<div class="btn-group col-sm-4">
							<input name="upload" id="fileInput5" type="file" /><input
								type="hidden" id="imageHidden5" name="pic" /> <input
								type="hidden" name="pic_picsize3" value="" />
							<div id="singleDiv5"></div>
							<img src="" class="wd200 hide" id="image5" />
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="submit" class="btn btn-primary">确定</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
				</div>
				<div class="form-group" style="text-align: center;">
					<span>理由/截屏可以在记录里单独修改/补充 </span>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
	function closeAnchor(f_uuid) {
		deleteConfirm(f_uuid, "${BASE_PATH}/square2/close", "直播", "踢出");
	}
	var rtmpPath = '${rtmpPath}';
	$(function(){
		  setInterval(function () {
			  var f_uuid_arr = new Array();
		      $(".product-imitation").each(function (e) {
		        f_uuid_arr[e] = $(this).children(".live-monitor").prop('id');
		      });
		      if (null != f_uuid_arr&&f_uuid_arr!='') {
		    	  $.ajax({
				  		type: "GET",
				  		url:"${BASE_PATH}/square2/getwatchcountfromframing",
				  		data: {f_uuid_arr: f_uuid_arr},
				  		success:function(json){
				  			for(var key in json)
			  				{
				  				$("#watch_" + json[key].f_uuid).html("观看人数："+json[key].watch_count);
			            		$("#real_" + json[key].f_uuid).html("真实人数："+json[key].real_count);
			            		$("#" + json[key].f_uuid).attr("src",json[key].anchor_cover);
			  				}
				  		}
				  });
		      }
		  },5000);
		  singleImage("#fileInput5", "peipei", "#image5", "#imageHidden5","singleDiv5");
		  $("#reason_select").change(function(){
				$("#save_logis_form input[name='reason']").val($(this).val());
		  });
		  $("#save_logis_form").validate({
				submitHandler: function(){
					myModal=false;
					ajaxSubmit($("#save_logis_form"), function(json){
						$("#myModal").modal("hide");
						if(json.code==1){
							swal({
								  title: "",
								  text: "操作成功",
								  timer: 800,
								});
							setTimeout(function(){
							    hasDialog=false;
							  }, 800);
							
							return false;
						}else{
							 swal({
				            	  title: "",
				            	  text: json.msg,
				            	  type: "warning",
				            	  showCancelButton: false,
				            	  confirmButtonText: "确定",
				            	  closeOnConfirm: false
				            	},
				            	function(){
				            		swal.close();
				            	});
						}
				    });
			        return false;
		    	}
			});
	});
	function waringAnchor(uid,f_uuid,nickname)
	{
		 $.ajax({
	  		type: "GET",
	  		url:"${BASE_PATH}/square2/getwaringcount",
	  		data:{
	  			uid:uid
	  		},
	  		success:function(json){
	  			swal({
					  title: "是否确认警告主播"+nickname+"？",
					  text: "该主播在过去20分钟内，被警告 <font color='red'>"+json.msg+"</font> 次",
					  type: "warning",
					  showCancelButton: true,
					  confirmButtonText: "确定",
					  cancelButtonText: "取消",
					  closeOnConfirm: false,
					  html: true
					},
					function(isConfirm){
						if(isConfirm){
							$.ajax({
								type: "GET",
								url:"${BASE_PATH}/square2/getsnapshot", //获取截图
								data:{
									streamKey:f_uuid
								},
								success:function(data){
									if(data.code==1){
										swal.close();
										$("#save_logis_form #title").text("警告")
										$("#save_logis_form input[name='type']").val(0);
										$("#save_logis_form input[name='uid']").val(uid);
										$("#save_logis_form input[name='f_uuid']").val(f_uuid);
										$("#save_logis_form input[name='anchor_name']").val(nickname);
										$("#u_anchor_name").html(nickname);
										$("#imageHidden5").val(data.msg);
										$("#sys-img").prop("src",data.msg);
										$("#myModal").modal({backdrop: 'static',keyboard: false});
										$("#save_logis_form").prop("action","${BASE_PATH}/square2/savewaring");
									}else{
										swal("", data.msg, "error")
										hasDialog=false;
									}
								}
							})
							
						}else{
							hasDialog=false;
						}
					});
	  		}
		 });
	}
	function closeAnchor(uid,f_uuid,nickname)
	{
		 $.ajax({
	  		type: "GET",
	  		url:"${BASE_PATH}/square2/getwaringcount",
	  		data:{
	  			uid:uid
	  		},
	  		success:function(json){
	  			swal({
					  title: "是否确认关闭主播"+nickname+"直播？",
					  text: "该主播在过去20分钟内，被警告 <font color='red'>"+json.msg+"</font> 次<br/>请谨慎操作，关闭操作不可逆",
					  type: "warning",
					  showCancelButton: true,
					  confirmButtonText: "确定",
					  cancelButtonText: "取消",
					  closeOnConfirm: false,
					  html: true
					},
					function(isConfirm){
						if(isConfirm){
							$.ajax({
								type: "GET",
								url:"${BASE_PATH}/square2/getsnapshot", //获取截图
								data:{
									streamKey:f_uuid
								},
								success:function(data){
									if(data.code==1){
										swal.close();
										$("#save_logis_form #title").text("关闭")
										$("#save_logis_form input[name='type']").val(1);
										$("#save_logis_form input[name='uid']").val(uid);
										$("#save_logis_form input[name='f_uuid']").val(f_uuid);
										$("#save_logis_form input[name='anchor_name']").val(nickname);
										$("#u_anchor_name").html(nickname);
										$("#imageHidden5").val(data.msg);
										$("#sys-img").prop("src",data.msg);
										$("#myModal").modal({backdrop: 'static',keyboard: false});
										$("#save_logis_form").prop("action","${BASE_PATH}/square2/savewaring");
									}else{
										swal("", data.msg, "error")
										hasDialog=false;
									}
								}
							})
							
						}else{
							hasDialog=false;
						}
					});
	  		}
		 });
	}
</script>