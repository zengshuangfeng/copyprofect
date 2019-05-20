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
				<h2>消息推送编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石</a></li>
					<li><strong><a href="${BASE_PATH}/userpush/list">消息推送列表</a></strong>
					</li>
					<li class="active"><strong><a>编辑</a></strong></li>
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
										<form id="tab" action="${BASE_PATH}/userpush/save"
											method="post">			
											<input type="hidden" name="id" value="${userpush.id}" />
											<div class="form-group">
												<label class="col-sm-2 control-label">推送标题：</label>
												<div class="col-sm-5">
													<input type="text" name="title" class="form-control" value="${userpush.title}">
												</div>
											</div>									
											<div class="form-group">
												<label class="col-sm-2 control-label">推送内容：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control" name="p_content">${userpush.p_content}</textarea>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">路由：</label>
												<div class="col-sm-5">
													<select name="jumpstyle" class="form-control"
														id="jumpstyle">	
														<c:if test="${userpush.style2==2}">
															<option  value="ms://outside">链接</option>															
														</c:if>									
														<c:forEach items="${jumpMapList}" var="map">
														<c:if test="${userpush.style2==2}">														
														<c:if test="${map.key !='ms://outside'}">
														<option  value="${map.key}" <c:if test="${map.key==userpush.url}">selected="selected"</c:if> >${map.value}</option>	
														</c:if>																													
														</c:if>	
														<c:if test="${userpush.style2!=2}">		
														<option  value="${map.key}" <c:if test="${map.key==userpush.url}">selected="selected"</c:if> >${map.value}</option>	
														</c:if>																								
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"></label>
												<div class="col-sm-5">
													<input type="text" name="href" id="href" class="form-control" value="${userpush.style2==2?userpush.url:userpush.href}" placeholder="请输入用户点击推送要跳转的链接，如果跳转主播直播间需要填写主播房间号">
												</div>
											</div>		
											<div class="form-group">
												<label class="col-sm-2 control-label">接收人：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="0" name="p_range" id="prange0" <c:if test="${userpush.p_range==0}"> checked="checked"</c:if>  /> <label for="inlineRadio3">&nbsp;指定</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="1" class="ml15"
															name="p_range" id="prange1" <c:if test="${userpush.p_range==1}"> checked="checked"</c:if>  /> <label for="inlineRadio4">&nbsp;全部</label>
													</div>
												</div>
											</div>	
											<div class="form-group<c:if test="${userpush.p_range==1}"> hide</c:if>" id="userid">
												<label class="col-sm-2 control-label"></label>
												<div class="col-sm-5">
													<input type="text" name="userid" class="form-control" value="${userid}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">平台：</label>
												<div class="col-sm-5">
													<label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="10"<c:if test="${userpush.platform==10||userpush.platform==00}"> checked="checked"</c:if> >&nbsp;&nbsp;&nbsp;iOS
													</label> <label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="20"<c:if test="${userpush.platform==20||userpush.platform==00}"> checked="checked"</c:if> >&nbsp;&nbsp;&nbsp;安卓
													</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">版本：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="version" value="${userpush.version}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">推送开始时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control"
														name="start_time" value="${userpush.start_time }" 
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">推送结束时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control"
														name="end_time" value="${userpush.end_time }" 
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/userpush/list";
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
	$().ready(function() {
		$("#tab").validate({
			rules: {
				title: {maxlength:20},
				p_content: {required:true},
				start_time: {required:true},
				version: {required:true}
			},
			messages: {
				title: {maxlength:"标题长度不能大于20个字"}, 
				p_content: {required:"推送内容不能为空"},
				start_time: {required:"推送开始时间不能为空"},
				version: {required:"版本不能为空"} 
			},
			submitHandler: function(){
				var p_range = $("input[name=p_range]:checked").val();
				if (p_range == 0){
					var userid = $('input[name=userid]').val();
					//验证是否为整数
					if (!(/^(\+|-)?\d+$/.test( userid ))) {
						$("input[name=userid]").addClass("error");
						$("input[name=userid]").after("<label id=\"userid-error\" class=\"error\" for=\"userid\"  >请不要输入非数字字符</label>");
						return false;
					}
				}
				
				var platform = $('input[name=platform]').is(':checked');
				if(!platform){
					$("input[name=platform]").addClass("error");
					$("#div_platform").after("<label id=\"platform-error\" class=\"error\" for=\"platform\"  >平台不能为空</label>");
					return false;
				}
				
				if(new Date($('input[name=start_time]').val().replace(/\-/g, '\/')) > new Date($('input[name=end_time]').val().replace(/\-/g, '\/'))){
					$("input[name=end_time]").after("<label id=\"end_time-error\" class=\"error\" for=\"end_time\" >结束时间不能小于开始时间</label>");
					return false;
				}
				var jumptype=$("#jumpstyle").val();
				var hreftext=$("#href").val();
				if(jumptype=="ms://outside"){
					if(hreftext==""){
						$("#href").after("<label id='href-error' class='error' for='href'>请输入用户点击推送要跳转的链接</label>");
						return false;
					}					
				}
		        ajaxSubmit($("#tab"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
			        	show(json, jumpUrl);
		        });
	        	return false;
	    	}
		});
	});
	
	$("input[name=p_range]").change(function(){
		var range=$(this).val();
		if(range==1){
			$("#userid").addClass("hide");
		}else if(range==0){			
			$("#userid").removeClass("hide");
		}
		
	})
</script>