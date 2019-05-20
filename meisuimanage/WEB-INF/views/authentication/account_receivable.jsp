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
				<h2>代理列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>实名认证审核</a></li>
					<li><strong><a href="${BASE_PATH}/authentication/list">身份认证审核记录</a></strong>
					</li>
					<li class="active"><strong><a>账户复审</a></strong></li>
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
											<div class="form-group">
												<label class="col-sm-2 control-label">收款人姓名：</label>
												<div class="col-sm-3">
													<input type="text"   readonly="true" name="payee_name" class="form-control" value="${account.payee_name}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">收款账户：</label>
												<div class="col-sm-3">
													<input type="text"  readonly="true" name="payment_account" class="form-control" value="${account.payment_account}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">付款人姓名：</label>
												<div class="col-sm-3">
													<input type="text" name="payer_name" id="payer_name" class="form-control" value="${account.payer_name}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">付款账户：</label>
												<div class="col-sm-3">
													<input type="text" name="pay_account"  id="pay_account" class="form-control" value="${account.pay_account}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">验证账户支付金额：</label>
												<div class="col-sm-3">
													<input type="text" name="pay_number" id="pay_number" onblur="chekpaynumber()"class="form-control" value="${account.pay_number}">
												</div>
												<div class="col-sm-3">
												<span id="message" name="message" ></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label"></label>
												<div class="col-sm-3">
													 <input type="radio" class="ladda-button btn btn-info" <c:if test="${account.pay_type=='公账'}"> checked="checked"</c:if> name="pay_type" id="pay_type" value="公账">
													 <button class="ladda-button btn btn-info">
																&nbsp;公账
													</button>
													 <input type="radio" class="ladda-button btn btn-info" <c:if test="${account.pay_type=='私账'}"> checked="checked"</c:if> name="pay_type" id="pay_type" value="私账">
													 <button class="ladda-button btn btn-info">
																&nbsp;私账
													</button>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">备注：</label>
												<div class="col-sm-3">
													<input type="text" name="remark" id="remark" class="form-control" value="${account.remark}" >
												</div>
											</div>
											<input type="hidden" id="id" name="id" value="${account.id}"/>
											<input type="hidden" id="authentication_id" name="authentication_id" value="${account.authentication_id}"/>
												<div class="form-group">
														<label class="col-sm-2 control-label" style="width:10%"> </label>
														<div class="col-sm-4 col-sm-offset-2">
															<c:if test="${status==5}">
															<button class="ladda-button btn btn-info"
															id="niubi"	onclick="checkaccountPass(3)">
																<i class="fa fa-check"></i>&nbsp;确认打款
															</button>
															<button class="ladda-button btn btn-info"
																onclick="checkaccountPass(4)">
																<i class="fa fa-check"></i>&nbsp;重新审核
															</button>
															</c:if>
															<c:if test="${status==3}">
															<div class="form-group">
														<div class="col-sm-8 col-sm-offset-2">
														<div>
														<label style="color:red">实名认证复审已完成</label><br>
														</div>
														</div>
														</div>
																<a href="${BASE_PATH}/authentication/list" class="btn btn-info">返回列表</a>	
															</c:if>
														</div>
												</div>
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
	var jumpUrl = "${BASE_PATH}/authentication/list";
	$().ready(function() {
		
		 document.getElementById("niubi").disabled=true;
		$("#tab").validate({
			rules: {
				payer_name: {required:true},
				pay_account: {required:true},
				pay_number: {required:true},
				pay_type:{required:true}
			},
			messages: {
				payer_name: {required:"付款人姓名不能为空"},
				pay_account: {required:"收款账户不能为空"},
				pay_number: {required:"账户支付金额不能为空"},
				pay_type:{required:"请选择支付类型"}
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
	function checkaccountPass(type){
		var pay_type= $('input[name="pay_type"]:checked').val()
		 $.ajax({
	         type: "POST",
	         url: "${BASE_PATH}/authentication/checkaccountPass",
	         data: {authentication_id:$("#authentication_id").val(),is_status:type,payer_name:$("#payer_name").val(),pay_account:$("#pay_account").val(),pay_number:$("#pay_number").val(),
	        	 pay_type:pay_type,remark:$("#remark").val()},
	         dataType: "text",
	         success: function(json){
	        	 show({"code":0,"msg":"保存成功"},jumpUrl);
	          },
	         error:function(cool){
	         }
	     });
		
	}
	function chekpaynumber(){
		 $.ajax({
	         type: "POST",
	         url: "${BASE_PATH}/authentication/chekpaynumber",
	         data: {authentication_id:$("#authentication_id").val(),pay_number:$("#pay_number").val()},
	         dataType: "text",
	         success: function(data){
	        	if(data==0){
	        		$('#message').html("验证通过");
	        		 document.getElementById("niubi").disabled=false;
	        		 var ele=document.getElementById("message").style.color="green"; 
	        	}else if(data==1){
	        		$('#message').html("验证失败");
	        		 document.getElementById("niubi").disabled=true;
	        		 var ele=document.getElementById("message").style.color="red"; 
	        	}
	          },
	         error:function(cool){
	        	
	         }
	     });
		
	}
	
	
</script>