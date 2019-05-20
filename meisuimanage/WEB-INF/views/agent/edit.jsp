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
				<h2>编辑代理</h2>
				<ol class="breadcrumb">
					<li><a>代理管理</a></li>
					<li><a href="${BASE_PATH}/agent/list">代理列表</a></li>
					<li class="active"><strong><a>编辑</a></strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<form id="fform_submit" action="${BASE_PATH}/operate/agentsave" method="post">
									<div class="panel-body">
										<fieldset class="form-horizontal">
											<input type="hidden" name="id" value="${agent.id}"/>
											<div class="form-group">
												<label class="col-sm-2 control-label">代理名称：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="name"
														value="${agent.name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">分成比例(%)：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="divide"
														value="${agent.divide}">
												</div>
												<label class="col-sm-1 control-label" style="text-align: left;">%</label>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">备注：</label>
												<div class="col-sm-5">
													<textarea rows="" cols="" style="resize: none"
														class="form-control" name="remark">${agent.remark}</textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">设置代理后台用户名：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="username"
														value="${agent.username}"><span name="username"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">设置代理后台密码：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="password" value=""><span name="password"></span>													
												</div>
												<span class="col-sm-5 help-block m-b-none text-danger" style="color: blue">
														&nbsp;&nbsp;&nbsp;不修改请放空
												</span>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">联系方式：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="contact"
														value="${agent.contact}"><span name="contact"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">持卡人：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="card_name"
														value="${agent.card_name}"><span name="card_name"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">银行卡号：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="card_no"
														value="${agent.card_no}"><span name="card_no"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">开户行：</label>
												<div class="col-sm-2">
													<select class="form-control" name="province" id="province"
														onchange="setCity()">
														<option value="0">选择省份</option>
														<c:forEach items="${areaList}" var="area">
															<option value="${area.id}"<c:if test="${area.id==agent.province}"> selected="selected"</c:if>>${area.name}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-sm-2">
													<select class="form-control" name="city" id="city">
														<option value="0">选择城市</ption>
														<c:forEach items="${cityList}" var="city">
															<option value="${city.id}"<c:if test="${city.id==agent.city}"> selected="selected"</c:if>>${city.name}</option>
														</c:forEach>
													</select> 
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">&nbsp;</label>												
												<div class="col-sm-5">
													<input type="text" class="form-control"
														placeholder="请填写开户银行名称" name="card_bank" value="${agent.card_bank}"><span
														name="card_bank"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">公司名称：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="company"
														value="${agent.company}"><span name="company"></span>
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
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function setCity(){
		var c=$('#province option:selected').text();
		var cv=$('#province option:selected').val();
		$.ajax({
			url:"/operate/getcity",
			type:"post",
			data:{"f_id":cv},
			dataType:"json",
			success:function(data){
				$('#city').empty();
				$('#city').append('<option value="0" selected="selected">选择城市</ption>');
				for(var i=0;i<data.length;i++){
					$("#city").append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
				}
			}
		});		
	};
	var jumpUrl = "${BASE_PATH}/operate/agent?centerId=${centerId}";
	$().ready(function() {
		$("#fform_submit").validate({
			rules: {
				name: {required:true},
				username: {required:true,maxlength:20},
				password: {maxlength:20,minlength:6},
				
			},
			messages: {
				name: {required:"代理名称不能为空"},
				username: {required:"用户名不能为空",maxlength:"用户名长度不能大于20个字"},
				password: {maxlength:"密码长度不能大于20个字",minlength:"密码长度不能小于6个字"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#fform_submit"), function(json){
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
	$("input[name=username]").blur(function(){
		var username = $(this).val();
		$.ajax({
			url:"${BASE_PATH}/operate/getagentusernameexist",
			type:"get",
			data:{username:username,id:${agent.id}},
			success:function(data){
				if(data==1)
				{
					$("span[name=username]").text('代理后台用户名已存在');
					$("span[name=username]").attr("style","color:red")
					$("#fform_submit").find("button").attr("disabled","disabled");
				}
				else
				{
					$("span[name=username]").text('');
					$("#fform_submit").find("button").removeAttr("disabled");
				}
			}
		});
	});	
</script>