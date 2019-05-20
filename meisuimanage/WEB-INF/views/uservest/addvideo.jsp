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
				<h2>视频添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li><strong><a href="${BASE_PATH}/uservest/list">马甲列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/uservest/savevideo" method="post">		
											<input type="hidden" name="uid" value="${uid}"/>		
											<input type="hidden" name="f_uuid" value="${f_uuid}"/>	
											<!-- <div class="form-group">
												<label class="col-sm-2 control-label">封面：</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="cover" />
														<div id="singleDiv"></div>
														<img src="" class="hide wd200" id="image" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;图片大小：</span>
												</div>
											</div>	 -->
											<div class="form-group">
												<label class="col-sm-2 control-label">视频：</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput2" type="file" /><input
															type="hidden" id="imageHidden2" name="video" />
														<div id="singleDiv2"></div>
														<label id="tipLabel"></label>
													</div>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">视频秒数：</label>
												<div class="col-sm-4">
													<input type="text" name="seconds" class="form-control" value="0"/>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">来源：</label>
												<div class="col-sm-5">
													<label class="checkbox-inline i-checks"> <input
														type="checkbox" name="source" value="1">&nbsp;&nbsp;&nbsp;美拍
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
<script src="${ctx}/js/uploadfiy.setting.js?r=123300" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/uservest/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				/* cover: {required:true}, */
				video: {required:true},
				seconds: {required:true, digits:true}
			},
			messages: {
				/* cover: {required:"封面不能为空"}, */
				video: {required:"视频不能为空"},
				seconds: {required:"视频秒数不能为空", digits:"视频秒数只能是正整数"}
			},
			submitHandler: function(){
			    $("#tab .ladda-button").attr("disabled","disabled");
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
				    $("#tab .ladda-button").removeAttr("disabled");
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
		singleImage("#fileInput", "peipei", "#image", "input[name=cover]", "singleDiv");
		singleVideo("#fileInput2", "peipei", "#tipLabel", "input[name=video]", "singleDiv2");
	});
</script>