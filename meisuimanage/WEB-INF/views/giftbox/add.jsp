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
				<h2>赠送礼物</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物箱管理</a></li>
					<li><strong><a href="${BASE_PATH}/giftbox/list">礼物箱列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/giftbox/save"
											method="post">											
											<div class="form-group">
												<label class="col-sm-2 control-label">用户UID：</label>
												<div class="col-sm-2">
													<input type="text" name="uid" class="form-control">
												</div>
											</div>	
											<div class="form-group">
											<label class="col-sm-2 control-label">礼物：</label>
											<div class="col-sm-2">
														<select name="gift_id"class="form-control">
															<option value="">请选择赠送礼物</option>
															<c:forEach items="${giftinfo}" var="giftinfo">
															<option value="${giftinfo.id}">${giftinfo.gift_name}</option>
															</c:forEach>
														</select>
														</div>
													</div>
									
											<div class="form-group">
												<label class="col-sm-2 control-label">数量：</label>
												<div class="col-sm-2">
													<input type="text" name="gift_count" class="form-control">
												</div>
												
											</div>																																						
											<div class="form-group">
												<div class="col-sm-4 col-sm-offset-2">
													<button class="ladda-button btn btn-info"
														data-style="slide-up">
														赠送
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
	var jumpUrl = "${BASE_PATH}/giftbox/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				uid: {required:true, digits:true},
				gift_id: {required:true, digits:true},
				gift_count: {required:true, digits:true}
			},
			messages: {
				uid: {required:"用户UID不能为空", digits:"用户UID只能是正整数"},
				gift_id: {required:"请选择赠送礼物",digits:"请选择赠送礼物"},
				gift_count: {required:"数量不能为空", digits:"数量只能是正整数"}
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
		singleImage("#fileInput", "peipei", "#image", "input[name=gift_head]", "singleDiv");
	});
</script>
   