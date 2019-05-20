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
				<h2>省代运营中心${empty center?'添加':'编辑'}</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>省代运营中心</a></li>
					<li><strong><a href="${BASE_PATH}/provincecenter/list">省代列表</a></strong>
					</li>
					<li class="active"><strong><a>${empty center?'添加':'编辑'}</a></strong></li>
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
										<form id="tab" action="${BASE_PATH}/provincecenter/save"
											method="post">
											<input type="hidden" name="id" value="${center.id }"/> 										
											<div class="form-group">
												<label class="col-sm-2 control-label">省代运营中心名称：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control" value="${center.name }">
												</div>
											</div>												
											<div class="form-group">
												<label class="col-sm-2 control-label">设置省代后台用户名：</label>
												<div class="col-sm-5">
													<input type="text" name="username" class="form-control" value="${center.username }"><span name="username"></span>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">设置省代后台密码：</label>
												<div class="col-sm-5">
													<input type="password" name="password" value="" class="form-control">
												</div>
											</div>									
											<div class="form-group">
												<label class="col-sm-2 control-label">备注：</label>
												<div class="col-sm-5">
													<textarea cols="50" rows="5" name="remark" class="form-control">${center.remark }</textarea>
												</div>
											</div>												
											<div class="form-group">
												<div class="col-sm-4 col-sm-offset-2">
													<button class="ladda-button btn btn-info" data-style="slide-up">
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/provincecenter/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {required:true,maxlength:100},
				username: {required:true},
				password: {minlength:6,maxlength:20},
			},
			messages: {
				name: {required:"省代运营名称不能为空",maxlength:"省代运营名称长度不能大于100个字"},
				username: {required:"省代后台用户名不能为空"},
				password: {minlength:"省代后台密码长度小于6个字",maxlength:"省代后台密码长度大于20个字"},
			},
			submitHandler: function(){
		        ajaxSubmit($("#tab"), function(json){
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
		jQuery.validator.addMethod("password", function(value, element) {   
		    return this.optional(element) || (checkPassword(value));
		}, "密码必须大写英文+数字+小写英文");
	});

	
		$("input[name=username]").blur(function(){
		var username = $(this).val();
		var id=$("[name=id]").val();
		$.ajax({
			url:"${BASE_PATH}/provincecenter/getusernameexist",
			type:"get",
			data:{username:username,id:id},
			success:function(data){
				if(data==1)
				{
					$("span[name=username]").text('运营中心后台用户名已存在');
					$("span[name=username]").attr("style","color:red")
					$("#tab").find("button").attr("disabled","disabled");
				}
				else
				{
					$("span[name=username]").text('');
					$("#tab").find("button").removeAttr("disabled");
				}
			}
		});
	});	
	function checkPassword(str){
	    var reg2 = /[a-z]+/;
	    var reg3 = /[A-Z]+/;
	    var reg4 = /[0-9]+/;
	    if(reg2.test(str) && reg3.test(str) && reg4.test(str)){
	        return true;
	    }else if(!reg2.test(str)){
	        return false;
	    }else if(!reg3.test(str)){
	        return false;
	    }else if(!reg4.test(str)){
	        return false;
	    }
	}
</script>
   