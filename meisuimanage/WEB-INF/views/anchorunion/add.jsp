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
				<h2>工会添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li><strong><a href="${BASE_PATH}/anchorunion/list">工会列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/anchorunion/save"
											method="post">											
											<div class="form-group">
												<label class="col-sm-2 control-label">工会名称：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">分成比例：</label>
												<div class="col-sm-5">
													<input type="text" name="divide_proportion" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">一对一分成比例：</label>
												<div class="col-sm-5">
													<input type="text" name="one_divide_proportion" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">结算类型：</label>
												<div class="col-sm-5">
													<select name="type" class="form-control">
													     <option value = "-1">请选择</option>
													     <option value = "0">周结</option>
													     <option value = "1">日结</option>
													</select>
												</div>
											</div>											
											<div class="form-group">
												<label class="col-sm-2 control-label">备注：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control" name="remark"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">设置工会后台用户名：</label>
												<div class="col-sm-5">
													<input type="text" name="username" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">设置工会后台密码：</label>
												<div class="col-sm-5">
													<input type="password" name="password" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">会长昵称：</label>
												<div class="col-sm-5">
													<input type="text" name="commander" placeholder="请填写您的昵称" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">微信号：</label>
												<div class="col-sm-5">
													<input type="text" name="weixin" placeholder="请填写微信号" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">QQ号：</label>
												<div class="col-sm-5">
													<input type="text" name="qq" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">手机号：</label>
												<div class="col-sm-5">
													<input type="text" name="tel" placeholder="请填写11位数手机号" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">邮箱：</label>
												<div class="col-sm-5">
													<input type="text" name="email" placeholder="请填写邮箱" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">持卡人：</label>
												<div class="col-sm-5">
													<input type="text" name="card_holder" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">银行卡号：</label>
												<div class="col-sm-5">
													<input type="text" name="bank_card_no" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">开户行：</label>
												<div class="col-sm-2">
													<select name="province" class="form-control" onchange="setCity(this);">
														<option value="0">请选择省份</option>
														<c:forEach items="${areaList}" var="area">
															<option value="${area.id}">${area.name}</option>
															</c:forEach>
													</select>
												</div>
												<div class="col-sm-2">
													<select name="city" class="form-control">
														<option value="0">请选择城市</option>
														<c:forEach items="${areaList2}" var="area">
															<option value="${area.id}">${area.name}</option>
															</c:forEach>
													</select>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">&nbsp;</label>
												<div class="col-sm-5">
													<input type="text" name="bank_name" placeholder="请填写开户银行名称" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">公司名称：</label>
												<div class="col-sm-5">
													<input type="text" name="company" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">营业执照</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="business_license" />
														<div id="singleDiv"></div>
														<img src="" class="wd200 mt10 hide" id="image" />
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/anchorunion/list";
	singleImage("#fileInput", "peipei", "#image", "input[name=business_license]", "singleDiv");
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {required:true,maxlength:100},
				divide_proportion: {required:true, digits:true},
				one_divide_proportion: {required:true, digits:true},
				type:{required:true,min:0},
				remark: {required:true,maxlength:200},
				password: {minlength:6},
				commander: {maxlength:50},
				weixin: {maxlength:100},
				qq: {maxlength:100},
				tel: {maxlength:100},
				email: {maxlength:100},
				card_holder:{maxlength:50},
				bank_card_no:{maxlength:100},
				bank_name:{maxlength:100},
				company:{maxlength:100}
			},
			messages: {
				name: {required:"工会名称不能为空",maxlength:"工会名称长度不能大于100个字"},
				divide_proportion: {required:"分成比例不能为空", digits:"分成比例只能是正整数"},
				one_divide_proportion: {required:"一对一分成比例不能为空", digits:"分成比例只能是正整数"},
				type:{required:"结算类型不能为空",min:"请选择结算类型"},
				remark: {required:"备注不能为空",maxlength:"备注长度不能大于200个字"},
				password: {minlength:"密码至少要6位"},
				commander: {maxlength:"会长昵称长度不能大于50个字"},
				weixin: {maxlength:"微信长度不能大于100个字"},
				qq: {maxlength:"QQ长度不能大于100个字"},
				tel: {maxlength:"手机号长度不能大于100个字"},
				email: {maxlength:"邮箱长度不能大于100个字"},
				card_holder:{maxlength:"持卡人长度不能大于50个字"},
				bank_card_no:{maxlength:"银行号长度不能大于100个字"},
				bank_name:{maxlength:"开户银行名称长度不能大于100个字"},
				company:{maxlength:"公司长度不能大于100个字"}
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
		$("input[name=username]").blur(function(){
			var username = $(this).val();
			var id = 0;
			$.ajax({
	             type: "GET",
	             url: "${BASE_PATH}/anchorunion/getusernameexist",
	             data: {username:username,id:id},
	             success: function(data){
	                 if(data>0)
                	 {
	                	 if($("#username-error").length==0){	                	 
		                	 $("input[name=username]").addClass("error");
			        		 $("input[name=username]").after("<label id=\"username-error\" class=\"error\" for=\"username\">用户名已存在</label>");
							 $("#tab .ladda-button").attr("disabled","disabled");
	                	 }
                	 }
	                 else
                	 {
	                	 $("input[name=username]").removeClass("error");
	                	 $("#username-error").remove();
	 				     $("#tab .ladda-button").removeAttr("disabled");
                	 }
	              }
	         });
		});
	});
	function setCity(target)
	{
		$.ajax({
            type: "GET",
            url: "${BASE_PATH}/anchorunion/getarealist",
            data: {f_id:$(target).val()},
            dataType: "json",
            success: function(json){
               var html = "<option value=\"0\">请选择城市</option>";
               for(var key in json)
           	{
           		html+= "<option value=\""+json[key].id+"\">"+json[key].name+"</option>"
           	}
               $("select[name=city]").html(html);
            }
        });
	}
</script>
   