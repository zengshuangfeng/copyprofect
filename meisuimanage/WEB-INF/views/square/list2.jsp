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
				<h2>主播监控</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>监控管理</a></li>
					<li class="active"><strong>主播监控</strong></li>
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
										<form action="${BASE_PATH}/square2/list" autocomplete="off"
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
												<!-- <div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label> <label
															class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn"> <a
																class="btn btn-danger"
																href="javascript:window.location.reload();">刷新</a>
															</span>
														</div>
													</div>
												</div> -->
											</div>
										</form>
									</div>
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-2" id="totalUser">用户在线总人数：${totalUser}</div>
											<div class="col-sm-2" id="totalRecord">主播在线总人数：${showPage.totalRecord}</div>
						                </div>
						            </div>
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content" id="square_content">
													<c:forEach items="${squareList}" var="square">
														<div class="col-md-2 square_video">
															<div class="ibox">
																<div class="ibox-content product-box active">
																	<div class="product-imitation" id="${square.f_uuid}" rtmpurl="${rtmpPath}${square.f_uuid}"></div>
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
																		<div id="serverIP_${square.f_uuid}" class="m-t-xs">IM IP：${square.serverIP}</div>
																		<div class="m-t-xs">uid：${square.uid}</div>
																		<div class="m-t-xs">房间号：${square.f_uuid}</div>
																		<div class="m-t-xs">主播类型：${square.is_trial == 1?'试播':'正式'}</div>
																		<div style="margin-top:5px">
																				VIP房间：
																			    <div 
																					class="onoffswitch" style="float:right;height:20px" >
																					<input type="checkbox" class="onoffswitch-checkbox" <c:if test="${square.is_vip==1}">checked</c:if>
																						id="onoffswitch_${square.f_uuid}" value="${square.uid}"> 
																					<label class="onoffswitch-label" for="onoffswitch_${square.f_uuid}" >
																						<span class="onoffswitch-inner" ></span> 
																						<span class="onoffswitch-switch"></span>
																					</label>
																				</div>
																		</div>																	
																		<div class="m-t" style="text-align: center;">
																			<a  onclick="return waringAnchor(${square.uid},${square.f_uuid},'${square.nickname}')"
																				class="btn btn-warning">警告</a> <a 
																				onclick="return closeAnchor(${square.uid},${square.f_uuid},'${square.nickname}')"
																				class="btn btn-danger">关闭</a>
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

<div id="charge-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">收费</h3>
						<form id="charge"
							action="${BASE_PATH}/square2/charge"
							method="post">
							<input type="hidden" name="uid"/>
							<input type="hidden" name="f_uuid" />
							<input type="hidden" name="times"/>
							<input type="hidden" name="nickname"/>
							<div class="form-group">
							    <div class="input-group">
							        <input class="form-control" type="text" name="fee_count" value="" />
							    </div>
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
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/ckplayer/ckplayer2.js" charset="utf-8"></script>
<script type="text/javascript">
	function closeAnchor(f_uuid) {
		deleteConfirm(f_uuid, "${BASE_PATH}/square2/close", "直播", "踢出");
	}
	$(".product-imitation").each(function(){
	    var id = $(this).attr('id');
	    var rtmpUrl = $(this).attr('rtmpUrl');
	    createPlayerList(rtmpUrl,id);
	});

	function displayProp(obj){    
	    var names="";       
	    for(var name in obj){       
	       names+=name+": "+obj[name]+", ";  
	    }  
	    alert(names);  
	} 
	function createPlayerList(rtmpUrl,id){
	    console.log(rtmpUrl)
	    console.log(id)
	    var flashvars={
	      f:rtmpUrl,
	      c:'0',
	      p:'1'
	    };
	    var params={bgcolor:'#FFF',allowFullScreen:false,allowScriptAccess:'always'};
	    var video=['http://movie.ks.js.cn/flv/other/2014/06/20-2.mp4->video/mp4'];
	    CKobject.embed('${ctx}/ckplayer/ckplayer.swf',id,'ckplayer_a1','100%','100%',false,flashvars,video,params);
	}
	var rtmpPath = '${rtmpPath}';
	$(function(){
		  setInterval(function () {
	    	  $.ajax({
			  		type: "GET",
			  		url:"${BASE_PATH}/square2/getjson",
			  		data: {page: '${showPage.currentPage}'},
			  		success:function(json){
			  			$(".square_video").each(function(){
			  				var f_uuid = $(this).find(".product-imitation").attr("id");
			  				var is_contain = false;
			  				for(var key in json)
			  				{
			  					if(json[key].f_uuid==f_uuid)
		  						{
			  						is_contain = true;
			  						break;
		  						}
			  				}
			  				if(!is_contain)
		  					{
		  						$(this).remove();
		  					}
			  			});
			  			for(var key in json)
		  				{
			  				var is_contain = false;
			  				$(".square_video").each(function(){
				  				var f_uuid = $(this).find(".product-imitation").attr("id");
				  				if(f_uuid==json[key].f_uuid)
				  				{
				  					is_contain = true;
				  				}
			  				});
			  				if(!is_contain)
		  					{
			  					var html = "";
			  					html += "<div class=\"col-md-2 square_video\"><div class=\"ibox\"><div class=\"ibox-content product-box active\">";
			  					html += "<div class=\"product-imitation\" id=\""+json[key].f_uuid+"\" rtmpurl=\""+rtmpPath+json[key].f_uuid+"\"></div>";
			  					html += "<div class=\"product-desc\">";
			  					html += "<h3>"+(json[key].anchor_notice==""?"无标题":json[key].anchor_notice)+"</h3>";
			  					html += "<div class=\"m-t-xs\">主播昵称："+json[key].nickname+"</div>";
			  					html += "<div id=\"watch_"+json[key].f_uuid+"\" class=\"m-t-xs\">观看人数："+json[key].watch_count+"</div>";
			  					html += "<div id=\"real_"+json[key].f_uuid+"\" class=\"m-t-xs\">真实人数："+json[key].real_count+"</div>";
			  					html += "<div class=\"m-t-xs\">uid："+json[key].uid+"</div>";
			  					html += "<div class=\"m-t-xs\">房间号："+json[key].f_uuid+"</div>";
			  					html += "<div class=\"m-t-xs\">主播类型："+(json[key].is_trial==1?"试播":"正式")+"</div>";
			  					html += "<div style=\"margin-top:5px\">VIP房间：  <div class=\"onoffswitch\" style=\"float:right;height:20px\" >";
			  					html += "<input type=\"checkbox\" class=\"onoffswitch-checkbox\"";
			  					if(json[key].is_vip==1)
		  						{
			  						html += " checked ";
		  						}
								html += " id=\"onoffswitch_"+json[key].f_uuid+"\" value=\""+json[key].uid+"\">"; 
								html += "<label class=\"onoffswitch-label\" for=\"onoffswitch_"+json[key].f_uuid+"\" >";
								html += "<span class=\"onoffswitch-inner\" ></span><span class=\"onoffswitch-switch\"></span></label></div></div>";
			  					html += "<div class=\"m-t\" style=\"text-align: center;\">";
			  					html += "<a onclick=\"return waringAnchor("+json[key].uid+","+json[key].f_uuid+",'"+json[key].nickname+"')\" class=\"btn btn-warning\">警告</a> ";
			  					html += "<a onclick=\"return closeAnchor("+json[key].uid+","+json[key].f_uuid+",'"+json[key].nickname+"')\" class=\"btn btn-danger\" style=\"margin-left: 20%;\">关闭</a>";
			  					html += "</div></div></div></div></div>";
			  					$("#square_content").append(html);
			  					createPlayerList(rtmpPath+json[key].f_uuid,json[key].f_uuid);
		  					}
		  				}
			  		}
			  });
		  },30000);
		  setInterval(function () {
			  var f_uuid_arr = new Array();
		      $(".product-imitation").each(function (e) {
		        f_uuid_arr[e] = $(this).prop('id');
		      });
		      if (null != f_uuid_arr&&f_uuid_arr!='') {
		    	  $.ajax({
				  		type: "GET",
				  		url:"${BASE_PATH}/square2/getwatchcount",
				  		data: {f_uuid_arr: f_uuid_arr},
				  		success:function(jsonContent){
				  			var json = jsonContent.d;
				  			$("#totalRecord").text("主播在线总人数："+jsonContent.totalRecord);
				  			$("#totalUser").text("用户在线总人数："+jsonContent.totalUser);
				  			for(var key in json)
			  				{
				  				$("#watch_" + json[key].f_uuid).html("观看人数："+json[key].watch_count);
			            		$("#real_" + json[key].f_uuid).html("真实人数："+json[key].real_count);
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
		  
			$(".onoffswitch-checkbox").click(function(){
				var checked = $(this).prop("checked");
				var uid = $(this).val();
		        var obj = this;
				swal({
					title : "设置房间VIP权限",
					text : checked?"是否开启VIP？":"是否关闭VIP？",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#1ab394",
					confirmButtonText : "确认",
					cancelButtonText : "取消",
					closeOnConfirm : true,
					closeOnCancel : true
				}, function(isConfirm) {
					if(!isConfirm){
						$(obj).prop('checked',!checked);	
		              return;				
					}
						$.ajax({
							type:"POST",
							url:"${BASE_PATH}/square2/savevip",
							data:{
								uid:uid,
								is_vip:checked?1:0
							},
							success:function(result){

							},
							error:function(XMLHttpRequest, textStatus, errorThrown) 
		                    { 
		                         $(obj).prop('checked',!checked);
		                    }   
						});			
				});			
			});	
			
			$("#charge").validate({
				rules:{				
					fee_count:{
					required : true,
					number:true,
					range:[10,10000]
				}},
				messages:{
					fee_count : {
						required : "收费数不能为空",
						number : "收费数只能是整数",
						range : "收费数只能介于10到10000"
					}						
				},
				submitHandler : function() {

					ajaxSubmit($("#charge"),
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
	});


	
	function charge(uid,f_uuid,times,nickname){
		$('#charge-modal-form').modal('show');
		$('#charge-modal-form').find("input[name=uid]").val(uid);
		$('#charge-modal-form').find("input[name=f_uuid]").val(f_uuid);
		$('#charge-modal-form').find("input[name=times]").val(times);
		$('#charge-modal-form').find("input[name=nickname]").val(nickname);
	}
	
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
										$("#save_logis_form").prop("action","${BASE_PATH}/square2/saveclose");
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