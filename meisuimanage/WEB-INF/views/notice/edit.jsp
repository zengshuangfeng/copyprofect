<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link
	href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>添加/编辑公告</h2>
				<ol class="breadcrumb">
					<li><a>公告管理</a></li>
					<li><a href="${BASE_PATH}/notice/list">公告列表</a></li>
					<li class="active"><strong><a>添加/编辑</a></strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<form id="form_submit" action="${BASE_PATH}/notice/save" method="post">
									<div class="panel-body">
										<fieldset class="form-horizontal">
											<input type="hidden" name="id" value="${notice.id}"/>
											<div class="form-group">
												<label class="col-sm-2 control-label">公告内容：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="content" value="${notice.content}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">排序值：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="sort" value="${notice.sort}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">类型：</label>
												<div class="col-sm-2">
													<select class="form-control" name="type" onchange="typeChange(this.value)">
														<option value="0" <c:if test="${notice.type==0 }">selected</c:if>>轮播
														<option value="1" <c:if test="${notice.type==1 }">selected</c:if>>仅一次</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">播放：</label>
												<div class="col-sm-5">
													<label class="aaaa checkbox-inline i-checks" id="more"> 
														<input type="checkbox" name="show_time" value="0" <c:if test="${fn:contains(notice.show_time,'0')}">checked="checked"</c:if> >&nbsp;&nbsp;&nbsp;每天
													</label> 
													<label class="checkbox-inline i-checks"> 
														<input type="checkbox" name="show_time" value="1" <c:if test="${fn:contains(notice.show_time,'1')}">checked="checked"</c:if> >&nbsp;&nbsp;&nbsp;周一
													</label>
													<label class="checkbox-inline i-checks"> 
														<input type="checkbox" name="show_time" value="2" <c:if test="${fn:contains(notice.show_time,'2')}">checked="checked"</c:if> >&nbsp;&nbsp;&nbsp;周二
													</label>
													<label class="checkbox-inline i-checks"> 
														<input type="checkbox" name="show_time" value="3" <c:if test="${fn:contains(notice.show_time,'3')}">checked="checked"</c:if> >&nbsp;&nbsp;&nbsp;周三
													</label>
													<label class="checkbox-inline i-checks"> 
														<input type="checkbox" name="show_time" value="4" <c:if test="${fn:contains(notice.show_time,'4')}">checked="checked"</c:if> >&nbsp;&nbsp;&nbsp;周四
													</label>
													<label class="checkbox-inline i-checks"> 
														<input type="checkbox" name="show_time" value="5" <c:if test="${fn:contains(notice.show_time,'5')}">checked="checked"</c:if> >&nbsp;&nbsp;&nbsp;周五
													</label>
												</div>
											</div>
											<div>
												<div class="form-group">
													<label class="col-sm-2 control-label">设置轮播开始时间：</label>
													<div class="col-sm-2">
														<input type="text" class="form-control" placeholder="开始时间" name="start_time"
															onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" value='<fmt:formatDate value="${notice.start_time}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
													</div>
												</div>
												<div class="form-group" id="more2">
													<label class="col-sm-2 control-label">设置轮播结束时间：</label>
													<div class="col-sm-2">
														<input type="text" class="form-control" placeholder="结束时间" name="end_time"
															onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:00'})" value='<fmt:formatDate value="${notice.end_time}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
													</div>
												</div>
											</div>
											<div class="form-group" id="more3">
												<label class="col-sm-2 control-label">设置轮播间隔时间(分钟)：</label>
												<div class="col-sm-2">
													<input type="text" class="form-control" placeholder="分钟数" name="interval_minute" value="${notice.interval_minute}">
												</div>
											</div>
											<div class="form-group">
											<label class="col-sm-2 control-label">平台：</label>
												<div class="col-sm-5">
													<label class="checkbox-inline i-checks"> 
														<input type="checkbox" name=platform value="20" <c:if test="${notice.platform eq '0' or notice.platform eq '20' }">checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;安卓
													</label> 
													<label class="checkbox-inline i-checks"> 
														<input type="checkbox" name="platform" value="10" <c:if test="${notice.platform eq '0' or notice.platform eq '10' }">checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;IOS
													</label>
												</div>
											</div>
											<div class="form-group">
											<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-5">
													<label class="checkbox-inline i-checks"> 
														<input type="radio" name=is_online value="1" <c:if test="${notice.is_online==1 }">checked</c:if> checked>&nbsp;&nbsp;&nbsp;正常
													</label> 
													<label class="checkbox-inline i-checks"> 
														<input type="radio" name="is_online" value="0" <c:if test="${notice.is_online==0 }">checked</c:if> >&nbsp;&nbsp;&nbsp;下线
													</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">版本：</label>
												<div class="col-sm-2">
													<input type="input" class="form-control" name="version" value="${notice.version }"/>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-4 col-sm-offset-2">
													<button class="ladda-button btn btn-info" data-style="slide-up">
														<i class="fa fa-check"></i>&nbsp;保存
													</button>
												</div>
											</div>
										</fieldset>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/notice/list";
	$().ready(function() {
		$("#form_submit").validate({
			rules: {
				content: {required:true,maxlength:20},
				
			},
			messages: {
				content: {required:"内容不能为空",maxlength:"不可超过20个字"},
			},
			submitHandler: function(){
		        ajaxSubmit($("#form_submit"), function(json){
		        	console.log(json);
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
		var type = ${notice.type};
		if(type == 1){
			$("#more").hide();
			$("#more2").hide();
			$("#more3").hide();
		}
	})
	function typeChange(type){
		if(type==0){
			$("#more").show();
			$("#more2").show();
			$("#more3").show();
		}else{
			$("#more").hide();
			$("#more2").hide();
			$("#more3").hide();
		}
	}
</script>