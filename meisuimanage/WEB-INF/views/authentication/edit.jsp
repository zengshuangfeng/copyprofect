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
					<li class="active"><strong><a>审核信息</a></strong></li>
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
												<label class="col-sm-2 control-label">姓名：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control" value="${authentication.name}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">电话：</label>
												<div class="col-sm-5">
													<input type="text" name="phone" class="form-control" value="${authentication.phone}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">邮箱：</label>
												<div class="col-sm-5">
													<input type="text" name="email" class="form-control" value="${authentication.email}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">公司名称：</label>
												<div class="col-sm-5">
													<input type="text" name="company" class="form-control" value="${authentication.company}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">公司联系地址：</label>
												<div class="col-sm-5">
													<input type="text" name="company_address" class="form-control" value="${authentication.company_address}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">注册地址：</label>
												<div class="col-sm-5">
													<input type="text" name="company_reg_address" class="form-control" value="${authentication.company_reg_address}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">营业执照注册号：</label>
												<div class="col-sm-5">
													<input type="text" name="business_number" class="form-control" value="${authentication.business_number}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">营业执照有效期：</label>
												<div class="col-sm-5">
												<input type="text" name="business_license_deadtime" class="form-control" value="${s_time} -- ${e_time}" >
												
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">开户许可证核准号：</label>
												<div class="col-sm-5">
													<input type="text" name="account_open_number" class="form-control" value="${authentication.account_open_number}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">结算账户户名：</label>
												<div class="col-sm-5">
													<input type="text" name="account_name" class="form-control" value="${authentication.account_name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">结算银行卡号：</label>
												<div class="col-sm-5">
													<input type="text" name="bank_card" class="form-control" value="${authentication.bank_card}" >
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">开户银行：</label>
												<div class="col-sm-5">
													<input type="text" name="bank_of_deposit" class="form-control" value="${authentication.bank_of_deposit}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">开户支行：</label>
												<div class="col-sm-5">
													<input type="text" name="account_opening_branch" class="form-control" value="${authentication.account_opening_branch}" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">营业执照:</label>
												<div class="col-sm-5">
													<c:if test="${not empty authentication.business_license}">		
													<c:set value="${fn:split(authentication.business_license, ',') }" var="b_pics" />													
													<c:forEach items="${b_pics}" var="pic">
														<img src="${uploadUrl}${pic}" data="${pic}"
															class="fl wh200-150 mr10 mt10" />
														<i class="fl remove mtr2-18"></i>
													</c:forEach>
													</c:if>		
												</div>
											</div>
									<div class="form-group">
												<label class="col-sm-2 control-label">开户许可证:</label>
												<div class="col-sm-5">
														<c:if test="${not empty authentication.account_opening_license}">		
													<c:set value="${fn:split(authentication.account_opening_license, ',') }" var="a_pics" />												
													<c:forEach items="${a_pics}" var="pic2">
														<img src="${uploadUrl}${pic2}" data="${pic2}"
															class="fl wh200-150 mr10 mt10" />
														<i class="fl remove mtr2-18"></i>
													</c:forEach>	
													</c:if>	
												</div>
											</div>
												
											<div class="form-group">
												<label class="col-sm-2 control-label">法人身份证:</label>
												<div class="col-sm-5">
														<c:if test="${not empty authentication.corporate_id_card}">			
													<c:set value="${fn:split(authentication.corporate_id_card, ',') }" var="c_pics" />											
													<c:forEach items="${c_pics}" var="pic3">
														<img src="${uploadUrl}${pic3}" data="${pic3}"
															class="fl wh200-150 mr10 mt10" />
														<i class="fl remove mtr2-18"></i>
													</c:forEach>	
													</c:if>		
												</div>
											</div>
												<div class="form-group">
												<label class="col-sm-2 control-label">其他:</label>
												<div class="col-sm-5">
													<c:if test="${not empty authentication.other}">	
													<c:set value="${fn:split(authentication.other, ',') }" var="o_pics" />												
													<c:forEach items="${o_pics}" var="pic4">
														<img src="${uploadUrl}${pic4}" data="${pic4}"
															class="fl wh200-150 mr10 mt10" />
														<i class="fl remove mtr2-18"></i>
													</c:forEach>	
													</c:if>			
												</div>
											</div>
											
											<input type="hidden" id="id" name="id" value="${authentication.id}"/>
										
												<div class="form-group">
														<label class="col-sm-2 control-label" style="width:10%"> </label>
														<div class="col-sm-4 col-sm-offset-2">
												<c:if test="${authentication.is_status==5}">
													<div class="form-group">
														<div class="col-sm-8 col-sm-offset-2">
														<div>
														<label style="color:red">实名认证复审通过</label><br>
														</div>
														</div>
														</div>
															<a href="${BASE_PATH}/authentication/getAccountReceivable?authentication_id=${authentication.id}" class="btn btn-info">下一步</a>	
												</c:if>
													<c:if test="${authentication.is_status==4}">
																<div class="form-group">
												<div class="col-sm-8 col-sm-offset-2">
														<div>
														<label style="color:red">实名认证复审审核未通过</label><br>
														</div>
														</div>
														</div>
												</c:if>
													<c:if test="${authentication.is_status==1}">
													<div class="form-group">
														<div class="col-sm-8 col-sm-offset-2">
														<div>
														<label style="color:red">实名认证初审通过</label><br>
														</div>
														</div>
														</div>																
												</c:if>
												<c:if test="${authentication.is_status==2}">
																<div class="form-group">
												<div class="col-sm-8 col-sm-offset-2">
														<div>
														<label style="color:red">实名认证初审审核未通过</label><br>
														</div>
														</div>
														</div>
												</c:if>
												<c:if test="${authentication.is_status==3}">
																<div class="form-group">
												<div class="col-sm-8 col-sm-offset-2">
														<div>
														<label style="color:red">已实名认证</label><br>
														</div>
														</div>
														</div>
															<a href="${BASE_PATH}/authentication/getAccountReceivable?authentication_id=${authentication.id}" class="btn btn-info">下一步</a>	
															</c:if>
														
															<c:if test="${authentication.is_status==0}">
															<button class="ladda-button btn btn-info"
																onclick="chekPass(1)">
																<i class="fa fa-check"></i>&nbsp;审核通过
															</button>
															<button class="ladda-button btn btn-info"
																id="addtag">
																<i class="fa fa-check"></i>&nbsp;审核未通过
															</button>
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

<div id="change-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<form id="change" action="${BASE_PATH}/authentication/checkunPass" method="post">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<input type="hidden" name="auth_id" id="auth_id">
							<input type="hidden" name="is_status" id="is_status" value="2">
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">审核未通过原因：</label>
								<div class="col-sm-6">
							<input type="text" name="remark" class="form-control"/>
								</div>
							</div>						
							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									data-dismiss="modal">取消</button>
							</div>
							<div class="col-sm-2">
								<button class="btn btn-primary pull-right" type="submit">
									<strong>确定</strong>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/authentication/list";
	$().ready(function() {
		
		
		$("#change").validate({
			rules: {
			},
			messages: {
			},
			submitHandler: function(){
		        ajaxSubmit($("#change"), function(json){
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
	function chekPass(type){
		 $.ajax({
	         type: "POST",
	         url: "${BASE_PATH}/authentication/checkPass",
	         data: {id:$("#id").val(),is_status:type},
	         dataType: "json",
	         success: function(json){
	        	 show(json, jumpUrl);
	          },
	         error:function(cool){
	        	 
	         }
	     });
		
	}
	$("#addtag").click(function(){
		$("#change-modal-form").modal('show');
		var id=$("#id").val();
		$("#auth_id").val(id);
	})
	
</script>