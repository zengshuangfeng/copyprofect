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
				<h2>守护配置添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石管理</a></li>
					<li><strong><a href="${BASE_PATH}/guardchangenew/list">守护配置</a></strong>
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
										<form id="tab" action="${BASE_PATH}/guardchangenew/save"
											method="post">	
											<input type="hidden" name="id" value="${anchorguard.id}">	
											<div class="form-group">
												<label class="col-sm-2 control-label">选择守护类型：</label>
												<div class="col-sm-2">
													<select name="type" class="form-control">														
														<option value="0"<c:if test="${anchorguard.type==0}"> selected="selected"</c:if>>包月守护</option>
														<option value="1"<c:if test="${anchorguard.type==1}"> selected="selected"</c:if>>包季守护</option>
														<option value="2"<c:if test="${anchorguard.type==2}"> selected="selected"</c:if>>包年守护</option>
													</select>
												</div>
											</div>			
											<div class="form-group">
												<label class="col-sm-2 control-label">守护名称：</label>
												<div class="col-sm-2">
													<input type="text" name="name" class="form-control" value="${anchorguard.name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">守护价格(钻)：</label>
												<div class="col-sm-2">
													<input type="text" name="change_virtual" class="form-control" value="${anchorguard.change_virtual}">
												</div>
											</div>	
												<div class="form-group">
												<label class="col-sm-2 control-label">专属头像装饰图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="guard_head" value="${anchorguard.guard_head}"/>
														<div id="singleDiv"></div>
														<img src="${uploadUrl}${anchorguard.guard_head}" class="wd200" id="image" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
												</div>
											</div>
												<div class="form-group">
												<label class="col-sm-2 control-label">专属入场特效图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload1" id="fileInput1" type="file" /><input
															type="hidden" id="imageHidden1" name="entrance_pic" value="${anchorguard.entrance_pic }"/>
														<div id="singleDiv1"></div>
														<img src="${uploadUrl}${anchorguard.entrance_pic}" class="wd200" id="image1" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">尊贵特权图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload2" id="fileInput2" type="file" /><input
															type="hidden" id="imageHidden2" name="vehicle_pic" value="${anchorguard.vehicle_pic}"/>
														<div id="singleDiv2"></div>
														<img src="${uploadUrl}${anchorguard.vehicle_pic}" class="wd200" id="image2" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
												</div>
											</div>		
												<div class="form-group">
												<label class="col-sm-2 control-label">专属礼物图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload3" id="fileInput3" type="file" /><input
															type="hidden" id="imageHidden3" name="exclusive_pic" value="${anchorguard.exclusive_pic}"/>
														<div id="singleDiv3"></div>
														<img src="${uploadUrl}${anchorguard.exclusive_pic}" class="wd200" id="image3" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
												</div>
											</div>		
											<div class="form-group">
												<label class="col-sm-2 control-label">专属头像装饰大图</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload4" id="fileInput4" type="file" /><input
															type="hidden" id="imageHidden4" name="guard_head_big" value="${anchorguard.guard_head_big}"/>
														<div id="singleDiv4"></div>
														<img src="${uploadUrl}${anchorguard.guard_head_big}" class="wd200" id="image4" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
												</div>
											</div>
												<div class="form-group">
												<label class="col-sm-2 control-label">专属入场特效大图</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload5" id="fileInput5" type="file" /><input
															type="hidden" id="imageHidden5" name="entrance_pic_big" value="${anchorguard.entrance_pic_big}"/>
														<div id="singleDiv5"></div>
														<img src="${uploadUrl}${anchorguard.entrance_pic_big}" class="wd200" id="image5" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">尊贵特权图片大图</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload6" id="fileInput6" type="file" /><input
															type="hidden" id="imageHidden6" name="vehicle_pic_big" value="${anchorguard.vehicle_pic_big}"/>
														<div id="singleDiv6"></div>
														<img src="${uploadUrl}${anchorguard.vehicle_pic_big}" class="wd200" id="image6" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">专属礼物图片大图</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload7" id="fileInput7" type="file" /><input
															type="hidden" id="imageHidden7" name="exclusive_pic_big" value="${anchorguard.exclusive_pic_big}"/>
														<div id="singleDiv7"></div>
														<img src="${uploadUrl}${anchorguard.exclusive_pic_big}" class="wd200" id="image7" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;只支持.PNG 格式 200x200</span>
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
<script src="${ctx}/js/uploadfiy.setting.js?r=1" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/guardchangenew/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				change_virtual: {required:true, digits:true},
				name: {required:true},
				guard_head: {required:true},
				entrance_pic: {required:true},
				exclusive_pic:{required:true},
				vehicle_pic:{required:true},
				guard_head_big: {required:true},
				entrance_pic_big: {required:true},
				vehicle_pic_big: {required:true},
				exclusive_pic_big: {required:true}
				
			},
			messages: {
				change_virtual: {required:"守护价格不能为空", digits:"守护价格只能是正整数"},
				name: {required:"守护名称不能为空"},
				guard_head: {required:"头像装饰图片不能为空"},
				entrance_pic:{required:"入场特效图片不能为空"},
				exclusive_pic:{required:"专属礼物图片不能为空"},
				vehicle_pic:{required:"入场座驾图片不能为空"},
				guard_head_big: {required:"头像装饰图片大图不能为空"},
				entrance_pic_big: {required:"入场特效图片大图不能为空"},
				vehicle_pic_big: {required:"入场座驾图片大图不能为空"},
				exclusive_pic_big: {required:"专属礼物图片大图不能为空"}
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
	singleImage("#fileInput", "meisui", "#image", "input[name=guard_head]", "singleDiv");
	singleImage("#fileInput1", "meisui", "#image1", "input[name=entrance_pic]", "singleDiv1");
	singleImage("#fileInput2", "meisui", "#image2", "input[name=vehicle_pic]", "singleDiv2");
	singleImage("#fileInput3", "meisui", "#image3", "input[name=exclusive_pic]", "singleDiv3");
	singleImage("#fileInput4", "meisui", "#image4", "input[name=guard_head_big]", "singleDiv4");
	singleImage("#fileInput5", "meisui", "#image5", "input[name=entrance_pic_big]", "singleDiv5");
	singleImage("#fileInput6", "meisui", "#image6", "input[name=vehicle_pic_big]", "singleDiv6");
	singleImage("#fileInput7", "meisui", "#image7", "input[name=exclusive_pic_big]", "singleDiv7");
</script>