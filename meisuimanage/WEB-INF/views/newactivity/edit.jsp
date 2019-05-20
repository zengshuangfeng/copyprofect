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
				<h2>首页活动编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/newactivity/list">广场首页活动列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/newactivity/save"
											method="post">				
											<input type="hidden" name="id" value="${activity.id}"/>							
											<div class="form-group">
												<label class="col-sm-2 control-label">活动名称：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control" value="${activity.name}">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">跳转链接：</label>
												<div class="col-sm-5">
													<input type="text" name="url" class="form-control" value="${activity.url}">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">排序：</label>
												<div class="col-sm-5">
													<input type="text" name="order" class="form-control" value="${activity.order}">
												</div>
											</div>	
												<div class="form-group">
												<label class="col-sm-2 control-label">跳转类型：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="type"
														<c:if test="${activity.type==1}"> checked="checked"</c:if> /> <label for="inlineRadio1">&nbsp;跳转</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15" <c:if test="${activity.type==0}"> checked="checked"</c:if> 
															name="type" /> <label for="inlineRadio2">&nbsp;不跳转</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">是否分享：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_share"
															<c:if test="${activity.is_share==1}"> checked="checked"</c:if> /> <label for="inlineRadio1">&nbsp;可分享</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15" <c:if test="${activity.is_share==0}"> checked="checked"</c:if>
															name="is_share" /> <label for="inlineRadio2">&nbsp;不可分享</label>
													</div>
												</div>
											</div>
												<div class="form-group">
												<label class="col-sm-2 control-label">封面图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput2" type="file" /><input
															type="hidden" id="imageHidden2" name="pic" value="${activity.pic}"/>
														<div id="singleDiv2"></div>
														<img src="${uploadUrl}${activity.pic}" class="<c:if test="${empty activity.pic }">hide </c:if>wd200 mt10" id="image2" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;图片大小：</span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">上线时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="上线时间"
														name="state_time" value="<fmt:formatDate value="${activity.state_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">下线时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="下线时间"
														name="end_time" value="<fmt:formatDate value="${activity.end_time}"  pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>												
											<div class="form-group">
												<label class="col-sm-2 control-label">平台：</label>
												<div class="col-sm-5">
													<label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="10" <c:if test="${activity.platform==10||activity.platform==00}"> checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;iOS
													</label> <label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="20"<c:if test="${activity.platform==20||activity.platform==00}"> checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;安卓
													</label>
												</div>
											</div>									
											<div class="form-group">
												<label class="col-sm-2 control-label">活动显示位置：</label>
												<div class="col-sm-3">
													<select name="position" class="form-control">
														<option value="0"  <c:if test="${activity.position==0}"> selected="selected"</c:if>>直播间banner</option>																						
													</select>
												</div>
											</div>
										<%-- 	<div class="form-group">
												<label class="col-sm-2 control-label">时间类型：</label>
												<div class="col-sm-3">
													<select name="time_type" class="form-control">
														<option value="0"  <c:if test="${activity.time_type==0}"> selected="selected"</c:if>>时间段</option>
														<option value="1"  <c:if test="${activity.time_type==1}"> selected="selected"</c:if>>时间段内的某个时间点后开启</option>													
													</select>
												</div>
											</div> --%>
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"
															<c:if test="${activity.is_online==1}"> checked="checked"</c:if>/> <label for="inlineRadio1">&nbsp;上线</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online" 
															<c:if test="${activity.is_online==0}"> checked="checked"</c:if>/>
															<label for="inlineRadio2">&nbsp;下线</label>
													</div>
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
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/newactivity/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {required:true,maxlength:100},				
				state_time: {required:true},
				end_time: {required:true},
				pic:{required:true},
				order:{required:true,digits:true},			
			},
			messages: {
				name: {required:"活动名称不能为空",maxlength:"活动名称长度不能大于100个字"},				
				state_time: {required:"上线时间不能为空"},
				end_time: {required:"下线时间不能为空"},
				pic: {required:"封面图片不能为空"},
				order: {required:"排序不能为空",digits:"请输入整数"}
			
			},
			submitHandler: function(){
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
	$(function(){	
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
        singleImage("#fileInput2", "meisui", "#image2", "input[name=pic]", "singleDiv2");
	});
</script>
   