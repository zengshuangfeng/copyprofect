<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>主播信息</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li><strong><a href="${BASE_PATH}/useranchor/list">主播列表</a></strong>
					</li>
					<li class="active"><strong><a>主播信息</a></strong></li>
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
									<fieldset class="form-horizontal">
										<form id="tab" action="${BASE_PATH}/${activeUrl}/saveinfo"
											method="post">
											<div class="form-group">
												<label class="col-sm-2 control-label">UID：</label>
												<div class="col-sm-5">
													<input type="hidden" name="id" value="${userAnchor.id}">
													<input type="text" name="uid" class="form-control" value="${tuser.id}" <c:if test="${userAnchor.id>0||activeUrl=='apply'}">readonly="readonly"</c:if>>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">昵称：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control" value="${tuser.nickname}" readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">封面</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="anchor_cover" value="${userAnchor.anchor_cover}"/>
														<div id="singleDiv"></div>
														<c:choose>
														<c:when test="${fn:length(headList)>0}">
														<c:forEach items="${headList}" var="head">
															<img src="${uploadUrl}${head}" data-ref="${head}" class="mt10 wd200 headselect"/>
														</c:forEach>
														<img src="" class="hide wd200" id="image" />
														</c:when>
														<c:otherwise><img src="${uploadUrl}${userAnchor.anchor_cover}" class="${not empty userAnchor.anchor_cover?'mt10 ':'hide ' }wd200" id="image" /></c:otherwise>
														</c:choose>														
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">
														<c:choose>
														<c:when test="${fn:length(headList)>0}"></c:when>
														<c:otherwise>&nbsp;&nbsp;&nbsp;</c:otherwise>
														</c:choose>	
													</span>
												</div>
											</div>									
											<div class="form-group">
												<label class="col-sm-2 control-label">是否是试播：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_trial"<c:if test="${empty userAnchor || userAnchor.is_trial==1}"> checked="checked"</c:if>/> <label for="inlineRadio3">&nbsp;是</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_trial"<c:if test="${userAnchor.is_trial==0}"> checked="checked"</c:if>/> <label for="inlineRadio4">&nbsp;否</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">游戏权限：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="youxi"<c:if test="${empty userAnchor || userAnchor.anchor_type==2||userAnchor.anchor_type==3}"> checked="checked"</c:if>/> <label for="inlineRadio3">&nbsp;开启</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="youxi"<c:if test="${userAnchor.anchor_type==0||userAnchor.anchor_type==1}"> checked="checked"</c:if>/> <label for="inlineRadio4">&nbsp;关闭</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">直播权限：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="live"<c:if test="${empty userAnchor || userAnchor.anchor_type==1||userAnchor.anchor_type==3}"> checked="checked"</c:if>/> <label for="inlineRadio3">&nbsp;开启</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="live"<c:if test="${userAnchor.anchor_type==0||userAnchor.anchor_type==2}"> checked="checked"</c:if>/> <label for="inlineRadio4">&nbsp;关闭</label>
													</div>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">开播类型：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_vip"<c:if test="${!empty userAnchor || userAnchor.is_vip==1}"> checked="checked"</c:if>/> <label for="inlineRadio3">&nbsp;VIP</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_vip"<c:if test="${empty userAnchor||userAnchor.is_vip==0}"> checked="checked"</c:if>/> <label for="inlineRadio4">&nbsp;非VIP</label>
													</div>
												</div>
											</div>											
								
											<div class="form-group">
												<label class="col-sm-2 control-label">主播类型：</label>
												<div class="col-sm-5">
													<select name="type" class="form-control">
														<option value="1" <c:if test="${1==userAnchor.type}"> selected="selected"</c:if>>A/才艺类</option>	
														<option value="2" <c:if test="${empty userAnchor||2==userAnchor.type}"> selected="selected"</c:if>>B类</option>																
													</select>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">备注：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control"
														name="remark">${userAnchor.remark}</textarea>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">编辑人员：</label>
												<div class="col-sm-5">
													<label class="control-label"> 
														${userAnchor.w_name}
													</label>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">编辑时间：</label>
												<div class="col-sm-5">
													<label class="control-label"> 
														${userAnchor.update_time}
													</label>
												</div>
											</div>										
											<div class="form-group">
												<div class="col-sm-4 col-sm-offset-2">
													<button class="ladda-button btn btn-info"
														data-style="slide-up">
														<i class="fa fa-check"></i>&nbsp;保存
													</button>
												</div>
											</div>
										</form>
									</fieldset>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/${activeUrl}/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				uid:{required:true},
				remark: {maxlength:1000}
			},
			messages: {
				uid:{required:"UID不能为空"},
				remark: {maxlength:"备注长度不能大于1000个字"}
			},
			submitHandler: function(){
				$("#tab").find("button").attr("disabled","disabled");
		        ajaxSubmit($("#tab"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
		        		$("#tab").find("button").removeAttr("disabled");
	        		}
		        	else{
			        	show(json, jumpUrl);
		        		if(json.code == -1){
		        			$("#tab").find("button").removeAttr("disabled");
		        		}
		        		
		        	} 
		        		
		        });
	        	return false;
	    	}
		});
	});
	$(function(){	
		$("#fileInput").uploadify({
			'uploader' : '/common/upload',
			'formData' : {'folder' : "peipei"},
			'queueID' : "singleDiv",
			'fileSizeLimit' : 1024,
			'overrideEvents': ['onSelectError'],
			'onSelectError':function(file, errorCode, errorMsg){
		    	switch(errorCode) {
		        case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
		        	this.queueData.errorMsg = "图片大小不能超过1M";
		          break;
		    	}
		    	return false;
			},
			'onUploadSuccess' : function(file, data, response) {
				 var data = eval('(' + data + ')')
				 $("input[name=anchor_cover]").val(data.nname);
				 $("#image").attr("src", data.src+"?imageView2/2/w/200");
				 $("#image").css("margin-top","10px");
				 $("#image").show();
				 $("#image").removeClass("hide");
				 $(".headselect").remove();
			}
		});
		var useranchorid=${userAnchor.id}+0;
		if(useranchorid<=0){
		$("input[name=uid]").blur(function(){
			$.get("${BASE_PATH}/${activeUrl}/getname",{uid:$(this).val()},function(json){
				if(json.is_anchor==1)
				{
					$("input[name=uid]").next("label").remove();
					$("input[name=uid]").addClass("error");
				    $("input[name=uid]").after("<label class=\"error\">该用户已是主播</label>");
				    $("#tab .ladda-button").attr("disabled","disabled");
				   
				}
				else if(json.hasInviteCode == 0){
					$("input[name=uid]").next("label").remove();
					$("input[name=uid]").addClass("error");
				    $("input[name=uid]").after("<label class=\"error\">该用户未填写邀请码！</label>");
				    $("#tab .ladda-button").attr("disabled","disabled");
				}else if(json.hasInviteCode == -1){
					 $("input[name=uid]").next("label").remove();
					$("input[name=uid]").addClass("error");
				    $("input[name=uid]").after("<label class=\"error\">该用户不存在！</label>");
				    $("#tab .ladda-button").attr("disabled","disabled");
				}
				else
				{
					$("input[name=uid]").removeClass("error");
				    $("input[name=uid]").next("label").remove();
				    $("#tab .ladda-button").removeAttr("disabled");
				}
				$("input[name=name]").val(json.nickname);
			});	
		});		
	}
		var hasInviteCode = ${hasInviteCode};
		if(hasInviteCode == 0){
			$("input[name=uid]").addClass("error");
		    $("input[name=uid]").after("<label class=\"error\">该用户未填写邀请码！</label>");
		    $("#tab .ladda-button").attr("disabled","disabled");
		}
	});
</script>