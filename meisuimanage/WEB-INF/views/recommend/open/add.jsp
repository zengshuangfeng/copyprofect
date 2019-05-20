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
				<h2>${styleName}添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>推荐位管理</a></li>
					<li><strong><a href="${BASE_PATH}/recommend${name}/list">${styleName}列表</a></strong>
					</li>
					<li class="active"><strong><a>添加</a></strong></li>
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
										<form id="tab" action="${BASE_PATH}/recommendopen/save"
											method="post">											
											<div class="form-group">
												<label class="col-sm-2 control-label">内部名称：</label>
												<div class="col-sm-5">
													<input type="text" name="title" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<input type="hidden" name="style" value="1"/>
												<label class="col-sm-2 control-label">图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="pic" />
														<div id="singleDiv"></div>
														<img src="" class="hide wd200" id="image" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;图片大小：</span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">视频：</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload2" id="fileInput2" type="file" /><input
															type="hidden" id="imageHidden2" name="video" />
														<div id="singleDiv2"></div>
														<div id="image2" ></div>
													</div>
												</div>
											</div>   
											<div class="form-group">
												<label class="col-sm-2 control-label">跳转类型：</label>
												<div class="col-sm-5">
													<select name="jumpstyle" class="form-control"
														id="jumpstyle">
														<option value="">请选择</option>
														<c:forEach items="${jumpMapList}" var="map">
															<option value="${map.key}">${map.value}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">跳转内容：</label>
												<div class="col-sm-5">
													<input type="text" name="href" class="form-control">
												</div>
											</div>											
											<div class="form-group">
												<label class="col-sm-2 control-label">上线时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="上线时间"
														name="s_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">下线时间：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" placeholder="下线时间"
														name="e_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>											
											<div class="form-group">
												<label class="col-sm-2 control-label">停留秒数：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="stayend">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">版本：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="version">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">平台：</label>
												<div class="col-sm-5">
													<label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="10"  id="ios_platform">&nbsp;&nbsp;&nbsp;iOS
													</label> <label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="20">&nbsp;&nbsp;&nbsp;安卓
													</label>
												</div>
											</div>
											<div class="form-group hide" id="mobile_model">
												<label class="col-sm-2 control-label">ios机型：</label>
												<div class="col-sm-5">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="ip6" name="mobile_model" /> <label for="inlineRadio3">&nbsp;iphone6以上</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="ip4" class="ml15"
															name="mobile_model" /> <label for="inlineRadio4">&nbsp;iphone4</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">渠道：</label>
												<div class="col-sm-5">
													<select name="channel" class="form-control"
														id="channel">
														<option value="">美岁</option>
														<c:forEach items="${package_ExtraList}" var="package_Extra">
															<option value="${package_Extra.channel}">${package_Extra.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">编辑状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"
															checked="checked" /> <label for="inlineRadio1">&nbsp;正常</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online" /> <label for="inlineRadio2">&nbsp;下线</label>
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/recommendopen/list"+window.location.search;
	$().ready(function() {
		$("#tab").validate({
			rules: {
				title: {maxlength:100},
				s_time: {required:true},
				e_time: {required:true},
				version: {required:true},
				stayend: {digits:true}
			},
			messages: {
				title: {maxlength:"内部名称长度不能大于100个字"},
				s_time: {required:"上线时间不能为空"},
				e_time: {required:"下线时间不能为空"},
				version: {required:"版本不能为空"},
				stayend: {digits:"停留秒数只能是整数"}
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
		singleImage("#fileInput", "meisui", "#image", "input[name=pic]", "singleDiv");
		singleVideo("#fileInput2", "meisui", "#image2", "input[name=video]", "singleDiv2");	
		$("select[name=jumpstyle]").find("option[value='${recommend.jumpstyle}']").attr("selected",true);
		$("#ios_platform").on('ifChecked', function(){
			$("#mobile_model").removeClass("hide");
			$("input[name=mobile_model][value=ip6]").prop("checked", true);
		});
		$("#ios_platform").on('ifUnchecked', function(){
			$("#mobile_model").addClass("hide");
			$("input[name=mobile_model][value=ip6]").prop("checked", false);
			$("input[name=mobile_model][value=ip4]").prop("checked", false);
		});
	});
</script>
   