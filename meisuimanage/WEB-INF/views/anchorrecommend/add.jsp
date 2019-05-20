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
				<h2>添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/anchorrecommend/list">主播首页推荐</a></strong>
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
										<form id="tab" action="${BASE_PATH}/anchorrecommend/save"
											method="post">
											<div class="form-group">
												<label class="col-sm-2 control-label">主播房间号：</label>
												<div class="col-sm-2">
													<input type="text" name="f_uuid" class="form-control" id="f_uuid">
												</div>
											</div>	
												<div class="form-group hide" id="nicknamehide">
												<label class="col-sm-2 control-label">主播昵称：</label>
												<div class="col-sm-2">
													<input type="text" name="nickname" class="form-control" id="nickname" readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="pic" />
														<div id="singleDiv"></div>
														<img src="" class="hide wd200" id="image" />
													</div>
													<font color="blue">不传默认显示原头像图片</font>
												</div>
											</div>																	
											<div class="form-group">
												<label class="col-sm-2 control-label">排序值：</label>
												<div class="col-sm-2">
													<input type="text" name="sort" class="form-control">
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
	var jumpUrl = "${BASE_PATH}/anchorrecommend/list"+window.location.search;
	$().ready(function() {
		$("#tab").validate({
			rules: {
				f_uuid:{required:true},
				sort: {required:true}
			},
			messages: {
				f_uuid:{required:"主播房间号不能为空"},
				sort: {required:"排序值不能为空"}							
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
		
	});
	
	$(function(){	
		$("input[name=f_uuid]").change(function(){
			$.get("${BASE_PATH}/anchorrecommend/getfuuidexist",{f_uuid:$(this).val()},function(json){
			    $("input[name=f_uuid]").next("label").remove();
				if(json.code>0)
				{
					$("input[name=f_uuid]").next("label").remove();
					$("input[name=f_uuid]").addClass("error");
				    $("input[name=f_uuid]").after("<label class=\"error\">不能重复设置</label>");
				    $("#nicknamehide").addClass("hide");
				    $("#tab .ladda-button").attr("disabled","disabled");
				}else if(json.code==-1)
				{
					$("input[name=f_uuid]").next("label").remove();
					$("input[name=f_uuid]").addClass("error");
				    $("input[name=f_uuid]").after("<label class=\"error\">主播不存在</label>");
				    $("#nicknamehide").addClass("hide");
				    $("#tab .ladda-button").attr("disabled","disabled");
				}
				else
				{
					$("input[name=f_uuid]").next("label").remove();
					$("input[name=f_uuid]").removeClass("error");
				    $("input[name=f_uuid]").next("label").remove();
				    $("#tab .ladda-button").removeAttr("disabled");
				    $("input[name=nickname]").val(json.nickname);
				    $("#nicknamehide").removeClass("hide");
				}
				
			});	
		});
	});
</script>
   