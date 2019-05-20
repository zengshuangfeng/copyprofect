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
				<h2>视频管理</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>社区</a></li>
					<li><strong><a href="${BASE_PATH}/community/videomanager">视频管理</a></strong>
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
										<form id="tab" action="${BASE_PATH}/community/videomanager/save"
											method="post" >
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
												<label class="col-sm-2 control-label">视频上传：</label>
												<div class="btn-group col-sm-4">
													<div class="fl">
														<input name="upload2" id="fileInput2" type="file" /><input
															type="hidden" id="imageHidden2" name="video" />
														<div id="singleDiv2"></div>
														<div id="image2" ></div>
														<div id="showVideo" style="margin-top:10px;display:none"></div>
													</div>
													<span class="col-sm-6 help-block m-b-none text-danger"
															style="color: blue">&nbsp;&nbsp;&nbsp;视频大小不能大于3M</span>
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
<script src="${ctx}/js/uploadfiy.setting.js?r=225" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="${ctx}/ckplayer/ckplayer.js" ></script>
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
	
	var jumpUrl = "${BASE_PATH}/community/videomanager"+window.location.search;
	$().ready(function() {
		$("#tab").validate({
			rules: {
				uid:{digits:true,required:true},
				title:{required:true},
				zan_count:{required:true,digits:true},
				share_count:{required:true,digits:true},
				video:{required:true}
				
			},
			messages: {
				uid:{ digits:"用户UID为整数",required:"主播UID不能为空"},
				title:{required:"标题不能为空"},
				zan_count:{required:"点赞数不能为空", digits:"点赞数为整数"},
				share_count:{required:"分享数不能为空", digits:"分享数为整数"},
				video:{required:"视频不能为空"}
			
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
	});
	singleVideoNew("#fileInput2", "meisui", "#image2", "input[name=video]", "singleDiv2");	
	function singleVideoNew(id, folder, image, imageHidden, queueID, filename)
	{
		if(typeof(filename) == "undefined")
			filename = "";
		$(id).uploadify({
			'uploader' : '/common/uploadvideo',
			'formData' : {'folder' : folder},
			'queueID' : queueID,
			'fileSizeLimit' : 15360,
			'overrideEvents': ['onSelectError'],
			'buttonText': '点击选择视频',
			'onSelectError':function(file, errorCode, errorMsg){
				switch(errorCode) {
		        	case -110:
		        		this.queueData.errorMsg = "视频大小不能超过15M";
		        	break;
				}
				return false;
			},
			'onUploadStart': function (file) {    
				if(filename!='')
				{
					if($(filename).val()=='')
					{
						$(id).uploadify('stop');
						$(filename).after("<label id=\""+filename+"-error\" class=\"error\" for=\""+filename+"\">请先上传视频</label>");
					}
					else
					{
						$(filename).next(".error").remove();
					}
					$(id).uploadify("settings", "uploader", '/common/uploadvideo?f='+$(filename).val());
				}     
	        },
			'onUploadSuccess' : function(file, data, response) {
				 var data = eval('(' + data + ')')
				 $(imageHidden).val(data.nname);
				 $(image).text("上传完成！");
				 playVideo(data.nname);
			}
		});
	}
	function playVideo(url)
	{
		$("#showVideo").show();		
		var pmHeight = $(window).height();
	    var videoObject = {
	        container : '#showVideo',//“#”代表容器的ID，“.”或“”代表容器的class
	        variable : 'player',//该属性必需设置，值等于下面的new chplayer()的对象
	        poster : '${uploadUrl}'+url+"?vframe/jpg/offset/5",//封面图片
	        autoplay: false,//自动播放
	        mobileCkControls: true,//是否在移动端（包括ios）环境中显示控制栏
	        video : '${uploadUrl}'+url+''//视频地址
	    };
	    var player = new ckplayer(videoObject);	    
	}	
</script>
   