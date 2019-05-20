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
				<h2>运营中心${empty center?'添加':'编辑'}</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营中心</a></li>
					<li><strong><a href="${BASE_PATH}/operate/list">运营列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/operate/save"
											method="post">
											<input type="hidden" name="id" value="${center.id }"/> 	
												<div class="form-group">
												<label class="col-sm-2 control-label">省代名称：</label>
												<div class="col-sm-2">
													<select class="form-control" name="province_center_id" id="province_center_id"
														onchange="setCity()">
														<option value="0">请选择省代</option>
														<c:forEach items="${province_center}" var="province_center">
															<option value="${province_center.id}"<c:if test="${province_center.id==center.province_center_id}"> selected="selected"</c:if>>${province_center.name}</option>
														</c:forEach>
													</select>
												</div>									
											</div>									
											<div class="form-group">
												<label class="col-sm-2 control-label">运营中心名称：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control" value="${center.name }">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">分成比例（%）：</label>
												<div class="col-sm-5">
													<input type="text" name="divide" class="form-control" value="${center.divide }">
												</div>
											</div>
											<c:if test="${empty center}">
											<div class="form-group">
												<label class="col-sm-2 control-label">结算类型：</label>
												<div class="col-sm-5">
													<div class="radio radio-info radio-inline">
														<input type="radio" name="settlement_type" value="0" checked="checked"  <c:if test="${center.settlement_type == 0 }">checked="checked"</c:if>/><label for="inlineRadio3">&nbsp;周结</label>
													</div>
													<div class="radio radio-info radio-inline">
														<input type="radio" name="settlement_type" value="1" <c:if test="${center.settlement_type == 1 }">checked="checked"</c:if>/><label for="inlineRadio3">&nbsp;日结</label>
													</div>
												</div>
											</div>
											</c:if>
											<c:if test="${center.id>0}">
												<div class="form-group">
													<label class="col-sm-2 control-label">结算类型：</label>
													<div class="col-sm-5" style="margin-top:6px">
														${center.settlement_type == 0?'周结':'日结' }
													</div>
												</div>
											</c:if>
											<div class="form-group">
												<label class="col-sm-2 control-label">设置运营中心后台用户名：</label>
												<div class="col-sm-5">
													<input type="text" name="username" class="form-control" value="${center.username }"><span name="username"></span>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">设置运营中心后台密码：</label>
												<div class="col-sm-5">
													<input type="password" name="password" value="" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">联系方式：</label>
												<div class="col-sm-5">
													<input type="text" name="contact" class="form-control" value="${center.contact }">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">持卡人：</label>
												<div class="col-sm-5">
													<input type="text" name="card_name" class="form-control" value="${center.card_name }">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">银行卡号：</label>
												<div class="col-sm-5">
													<input type="text" name="card_no" class="form-control" value="${center.card_no }">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">开户行：</label>
												<div class="col-sm-2">
													<select class="form-control" name="province" id="province"
														onchange="setCity()">
														<option value="0">选择省份</option>
														<c:forEach items="${areaList}" var="area">
															<option value="${area.id}"<c:if test="${area.id==center.province}"> selected="selected"</c:if>>${area.name}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-sm-2">
													<select class="form-control" name="city" id="city">
														<option value="0">选择城市</ption>
														<c:forEach items="${cityList}" var="city">
															<option value="${city.id}"<c:if test="${city.id==center.city}"> selected="selected"</c:if>>${city.name}</option>
														</c:forEach>
													</select> 
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">&nbsp;</label>												
												<div class="col-sm-5">
													<input type="text" class="form-control"
														placeholder="请填写开户银行名称" name="card_bank" value="${center.card_bank}"><span
														name="card_bank"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">公司名称：</label>
												<div class="col-sm-5">
													<input type="text" name="company" class="form-control" value="${center.company}">
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
	var jumpUrl = "${BASE_PATH}/operate/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {required:true,maxlength:100},
				divide: {digits:true,max:100},
				settlement_type : {required:true},
				username: {required:true},
				password: {minlength:6,maxlength:20},
			},
			messages: {
				name: {required:"运营中心名称不能为空",maxlength:"运营中心名称长度不能大于100个字"},
				divide: {required:"分成比例不能为空",max:"分成比例不能超过100%"},
				settlement_type:{required:"请选择结算类型"},
				username: {required:"运营中心后台用户名不能为空"},
				password: {minlength:"运营中心后台密码长度小于6个字",maxlength:"运营中心后台密码长度大于20个字"},
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
	
	
	function setCity(){
		var c=$('#province option:selected').text();
		var f_id=$('#province option:selected').val();
		if(f_id > 0){
			var city_id = "${center.city}";
			$.ajax({
				url:"/operate/getcity",
				type:"post",
				data:{"f_id":f_id},
				success:function(data){
					$('#city').empty();
					if(data=="1"){
						$('#city').empty();
						$('#city').append('<option value="0" selected="selected">选择城市</ption>');
					}
					var list = data;
					for(var i=0;i<data.length;i++){
						if(city_id == list[i].id){
							$("#city").append('<option value="'+list[i].id+'" selected>'+list[i].name+'</option>');
						}else{
							$("#city").append('<option value="'+list[i].id+'">'+list[i].name+'</option>');
						}
					}
				}
			});
		}
	};
	$(function(){
		setCity();
	})
	
		$("input[name=username]").blur(function(){
		var username = $(this).val();
		var id=$("[name=id]").val();
		$.ajax({
			url:"${BASE_PATH}/operate/getusernameexist",
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
   