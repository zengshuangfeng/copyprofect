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
				<h2>照片管理</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>社区</a></li>
					<li><strong><a href="${BASE_PATH}/community/picmanager">照片管理</a></strong>
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
										<form id="tab" action="${BASE_PATH}/community/picmanager/save"
											method="post">
											<div class="form-group">
												<label class="col-sm-2 control-label">绑定主播UID：</label>
												<div class="col-sm-2">
													<input type="text" name="uid" class="form-control" placeholder="单行输入">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">标题：</label>
												<div class="col-sm-5">
													<input type="text" name="title" class="form-control" placeholder="单行输入" id="title">											
												</div>
												<label class="col-sm-5 control-label" style="text-align:left;color:blue">汉字44个字符，英文88个字符</label>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">赞：</label>
												<div class="col-sm-2">
													<input type="text" name="zan_count" class="form-control" placeholder="单行输入">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">分享：</label>
												<div class="col-sm-2">
													<input type="text" name="share_count" class="form-control" placeholder="单行输入">
												</div>
											</div>	
										<div class="form-group">
												<label class="col-sm-2 control-label">帖子标签：</label>
												<div class="col-sm-2">
													<select name="tag_id" class="form-control"
														id="tag_id">
														<option value="">请选择</option>
														<c:forEach items="${posttag}" var="posttag">
															<option value="${posttag.id}">${posttag.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
																		
													<div class="form-group">
												<label class="col-sm-2 control-label">图片上传：</label>						
												<div class="btn-group col-sm-10" id="picControl">
													<input name="upload" id="fileInput" type="file" />
													<span
														style="color: blue;">&nbsp;&nbsp;&nbsp;图片上限6张，前台展示:6张为1专辑，不足6张展示为图片幻灯片。必须传正方形图。</span>
													 <input
														type="hidden" id="imageHidden" name="pic"
														value="${picString}" />													
													<div id="queueDiv"></div>													
													<c:forEach items="${picList}" var="pic">
														<img src="${picpath}${pic.pic}" data="${pic.pic}" id="pic${pic.id}"
															class="fl wh200-150 mr10 mt10" />
														<i class="fl remove mtr2-18"></i>
													</c:forEach>											
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
$("#title").blur(
		function() {
			var str= $("#title").val();			
			var len = 0;
		    for (var i=0; i<str.length; i++) { 
		     var c = str.charCodeAt(i); 
		    //单字节加1 
		     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
		       len++; 
		     } 
		     else { 
		      len+=2; 
		     } 
		    } 
		    if(len>88){
		    	$("#title").after("<label id='title-error' class='error' for='title'>汉字44个字符，英文88个字符</label>");
		    	 function checkDisable() {
		    	        return false;
		    	    }	
		    }    
		}		
	);
	
$(function(){	
	$("input[name=uid]").blur(function(){
		$.get("${BASE_PATH}/community/getuidexist2",{uid:$(this).val()},function(json){
		    $("input[name=uid]").next("label").remove();
			if(json.code>0)
			{
				$("input[name=uid]").next("label").remove();
				$("input[name=uid]").addClass("error");
			    $("input[name=uid]").after("<label class=\"error\">不能重复设置</label>");
			    $("#tab .ladda-button").attr("disabled","disabled");
			}
			else if(json.code==-1)
			{
				$("input[name=uid]").next("label").remove();
				$("input[name=uid]").addClass("error");
			    $("input[name=uid]").after("<label class=\"error\">主播不存在</label>");
			    $("#tab .ladda-button").attr("disabled","disabled");
			}
			else
			{
				$("input[name=uid]").next("label").remove();
				$("input[name=uid]").removeClass("error");
			    $("input[name=uid]").next("label").remove();
			    $("#tab .ladda-button").removeAttr("disabled");
			}			
		});	
	});
});

	var jumpUrl = "${BASE_PATH}/community/picmanager"+window.location.search;
	$().ready(function() {
		$("#tab").validate({
			rules: {
				sort: {required:true},
				uid:{digits:true,required:true},
				title:{required:true},
				zan_count:{required:true,digits:true},
				share_count:{required:true,digits:true},
				pic:{required:true},
			},
			messages: {
				sort: {required:"排序值不能为空"},
				uid:{ digits:"主播UID为整数",required:"主播UID不能为空"},
				title:{required:"标题不能为空"},
				zan_count:{required:"点赞数不能为空", digits:"点赞数为整数"},
				share_count:{required:"分享数不能为空", digits:"分享数为整数"},
				pic:{required:"图片不能为空"},
			},
			submitHandler: function(){
				var str= $("#title").val();			
	    		var len = 0;
	    	    for (var i=0; i<str.length; i++) { 
	    	     var c = str.charCodeAt(i); 
	    	    //单字节加1 
	    	     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
	    	       len++; 
	    	     } 
	    	     else { 
	    	      len+=2; 
	    	     } 
	    	    } 
	    	    if(len>88){	 
	    	    	$("#title").after("<label id='title-error' class='error' for='title'>汉字44个字符，英文88个字符</label>");	
	    	    	return false;	
	    	    } 	
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
		        	else 
		        	{
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
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
		multipleImage("#fileInput", "meisui", "#imageHidden");
	});
	

</script>
   