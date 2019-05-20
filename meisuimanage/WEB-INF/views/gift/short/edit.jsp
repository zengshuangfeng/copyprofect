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
				<h2>礼物编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物管理</a></li>
					<li><strong><a href="${BASE_PATH}/gift/list">礼物列表</a></strong>
					</li>
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
								<div class="panel-body">
									<fieldset class="form-horizontal">
										<form id="tab" action="${BASE_PATH}/shortgift/save"
											method="post">						
											<input type="hidden" name="id" value="${short_gift.id}">		
											<div class="form-group">
												<label class="col-sm-2 control-label">快捷礼物图标</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload2" id="fileInput2" type="file" /><input
															type="hidden" id="imageHidden2" name="gift_pic" value="${short_gift.gift_pic}"/>
														<div id="singleDiv2"></div>
														<img src="${uploadUrl}${short_gift.gift_pic}" class="wd200 mt10" id="image2" />
													</div>												
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">备注：</label>																					
													<div class="col-sm-5">
													<input type="text" name="remark" class="form-control" value="${short_gift.remark}">
												</div>																		
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">对应礼物表ID：</label>
												<div class="col-sm-5">											
													<select name="gift_id" class="form-control">
													<c:forEach items="${gift_info_list}" var="gift_info_list">
														<option value="${gift_info_list.id}" <c:if test="${gift_info_list.id==gift_id}"> selected="selected"</c:if>>${gift_info_list.gift_name}</option>		
													</c:forEach>																				
													</select>												
												</div>
											</div>												
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物名称：</label>
												<div class="col-sm-5">
													<input type="text" name="gift_name" class="form-control" value="${short_gift.gift_info.gift_name}"  readonly="readonly">
												</div>
											</div>																		
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物种类：</label>
												<div class="col-sm-5">
													<select name="type" class="form-control"  readonly="readonly">
														<option value="0"<c:if test="${short_gift.gift_info.type==0}"> selected="selected"</c:if>>普通礼物</option>
														<option value="1"<c:if test="${short_gift.gift_info.type==1}"> selected="selected"</c:if>>特殊礼物</option>									
													</select>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物图片:</label>
												<div class="btn-group col-sm-6">
													<div class="fl">														
														<img src="${uploadUrl}${short_gift.gift_info.gift_head}" class="wd200 mt10" id="image" />
													</div>
												
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物单价：</label>
												<div class="col-sm-4">
													<input type="text" name="gift_virtual" class="form-control"  readonly="readonly" value="${short_gift.gift_info.gift_virtual}" > 
												</div>
												<label class="col-sm-1 control-label" style="text-align:left">钻石</label>
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
<script src="${ctx}/js/uploadfiy.setting.js?r=1" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/shortgift/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				gift_pic: {required:true},
				gift_id: {required:true}
			},
			messages: {
				gift_pic: {required:"礼物图片不能为空"},
				gift_id: {required:"对应礼物id不能为空"}
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
		singleImage("#fileInput2", "meisui", "#image2", "input[name=gift_pic]", "singleDiv2");
		
	});
	
	$(function(){	
		$("select[name=gift_id]").change(function(){
			$.get("${BASE_PATH}/shortgift/getgiftinfo",{gift_id:$(this).val()},function(json){	
					if(json.data !=null || json.data !=''){
						$("input[name=gift_name]").val(json.data.gift_name);
						$("select[name=type]").val(json.data.type);
						$("input[name=gift_head]").val(json.data.gift_head);
						$("input[name=gift_virtual]").val(json.data.gift_virtual);
						$("#image").attr("src",json.url+json.data.gift_head);
					}
			});	
		});
	});
</script>
   