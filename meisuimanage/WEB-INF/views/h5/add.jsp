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
				<h2>H5添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>h5管理</a></li>
					<li><strong><a href="${BASE_PATH}/h5/list">h5列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/h5/save"
											method="post">											
											<div class="form-group">
												<label class="col-sm-2 control-label">标题：</label>
												<div class="col-sm-5">
													<input type="text" name="title" class="form-control">
												</div>
											</div>		
											<div class="form-group">
												<label class="col-sm-2 control-label">来源：</label>
												<div class="col-sm-5">
													<input type="text" name="author" class="form-control" value="官方公告">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">banner封面图片：</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="banner" />
														<div id="singleDiv"></div>
														<img src="" class="hide wd200" id="image" />
													</div>
												</div>
											</div>
											<div class="form-group content-group">
												<label class="col-sm-2 control-label">段落：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control" name="remark2"></textarea>
												</div>
											</div>	
											<div class="form-group content-group">
												<label class="col-sm-2 control-label">图片：</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput2" type="file" /><input
															type="hidden" id="picHidden2" name="pic2" />
														<div id="singleDiv2"></div>
														<img src="" class="hide wd200" id="pic2" />
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">&nbsp;</label>
												<div class="btn-group col-sm-2">
													<div class="fl">
														<button class="btn btn-default" type="button" onclick="addContent(this)">+段落</button>
													</div>
													<div class="fl" style="margin-left:30px">
														<button class="btn btn-default" type="button" onclick="addPic(this)">+图片</button>
													</div>
												</div>
											</div>
											<input type="hidden" name="content"/>
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
	var jumpUrl = "${BASE_PATH}/h5/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				title: {required:true,maxlength:100},
				banner: {required:true}
			},
			messages: {
				title: {required:"标题不能为空",maxlength:"标题长度不能大于100个字"},
				banner: {required:"banner不能为空"}
			},
			submitHandler: function(){
				var html = "[";
				$(".content-group").each(function(){
					var content = $(this).find("textarea").val();
					var pic = $(this).find("input[type=hidden]").val();
					if(content!=''&&typeof(content)!="undefined")
					{
						content = content.replace("\"","\\\"");
						html += ",{\"content\":\""+content+"\",type=\"0\"}";
					}
					if(pic!=''&&typeof(pic)!="undefined")
					{
						html += ",{\"content\":\""+pic+"\",type=\"1\"}";
					}
				});
				html += "]";
				if(html!="[]")
				{
					html = html.replace("[,{","[{");
				}
				$("input[name=content]").val(html);
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
		singleImage("#fileInput", "peipei", "#image", "input[name=banner]", "singleDiv");
		singleImage("#fileInput2", "peipei", "#pic2", "input[name=pic2]", "singleDiv2");
	});
	var pic_sign = 3, content_sign = 3;
	function addPic(target)
	{
		var html = "<div class=\"form-group content-group\"><label class=\"col-sm-2 control-label\">图片：</label><div class=\"btn-group col-sm-6\"><div class=\"fl\"><input name=\"upload\" id=\"fileInput"+pic_sign+"\" type=\"file\" /><a class=\"btn btn-xs btn-outline btn-danger\" style=\"margin-left:10px\" href=\"javascript:void(0)\" onclick=\"deleteTag(this)\">删除</a><input type=\"hidden\" id=\"picHidden"+pic_sign+"\" name=\"pic"+pic_sign+"\" /><div id=\"singleDiv"+pic_sign+"\"></div><img src=\"\" class=\"hide wd200\" id=\"pic"+pic_sign+"\" /></div></div></div>";
		$(target).parents(".form-group").before(html);
		singleImage("#fileInput"+pic_sign, "peipei", "#pic"+pic_sign, "input[name=pic"+pic_sign+"]", "singleDiv"+pic_sign);
		pic_sign++;
	}
	function addContent(target)
	{
		var html = "<div class=\"form-group content-group\"><label class=\"col-sm-2 control-label\">段落：</label><div class=\"col-sm-5\"><textarea rows=\"3\" class=\"form-control\" name=\"remark"+content_sign+"\"></textarea></div><div class=\"col-sm-1\"><a class=\"btn btn-xs btn-outline btn-danger\" style=\"margin-top:20px\"  href=\"javascript:void(0)\" onclick=\"deleteTag(this)\">删除</a></div></div>	";
		$(target).parents(".form-group").before(html);
		content_sign++;
	}
	function deleteTag(target)
	{
		$(target).parents(".content-group").remove();
	}
</script>
   