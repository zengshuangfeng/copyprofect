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
				<h2>商品编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>商品管理</a></li>
					<li><strong><a href="${BASE_PATH}/product/list">商品列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/product/save"
											method="post">		
											<input type="hidden" name="id" value="${product.id}"/>		
											<div class="form-group">
												<label class="col-sm-2 control-label">产品名称：</label>
												<div class="col-sm-5">
													<input type="text" name="name" class="form-control" value="${product.name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">产品介绍：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control" name="description">${product.description}</textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">广告图片：</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="pic" value="${product.pic}"/>
														<div id="singleDiv"></div>
														<img src="${uploadUrl}${product.pic}" class="wd200 mt10" id="image" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;图片大小： 宽338高402 </span>
												</div>
											</div>											
											<div class="form-group">
												<label class="col-sm-2 control-label">产品类型：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="0" name="type"<c:if test="${product.type==0}"> checked="checked"</c:if>/> <label for="inlineRadio1">&nbsp;钥匙兑换奖品</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="1" class="ml15"
															name="type"<c:if test="${product.type==1}"> checked="checked"</c:if>/> <label for="inlineRadio2">&nbsp;现金购买商品</label>
													</div>
												</div>
											</div>																					
											<div class="form-group">
												<label class="col-sm-2 control-label">钥匙数或现金金额：</label>
												<div class="col-sm-5">
													<input type="text" name="price" class="form-control" value="${product.price}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">产品库存：</label>
												<div class="col-sm-5">
													<input type="text" name="stock" class="form-control" value="${product.stock}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">发放：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control" name="issue">${product.issue}</textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">领奖提示：</label>
												<div class="col-sm-5">
													<textarea rows="3" class="form-control" name="tips">${product.tips}</textarea>
												</div>
											</div>																					
											<div class="form-group">
												<label class="col-sm-2 control-label">排序值：</label>
												<div class="col-sm-5">
													<input type="text" name="sort" class="form-control" value="${product.sort}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"
															<c:if test="${product.is_online==1}"> checked="checked"</c:if>/> <label for="inlineRadio1">&nbsp;上架</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online" <c:if test="${product.is_online==0}"> checked="checked"</c:if>/> <label for="inlineRadio2">&nbsp;下架</label>
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
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/product/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {required:true, maxlength:100},
				description: {required:true, maxlength:200},
				pic: {required:true},
				price: {required:true, digits:true},
				stock: {required:true, digits:true},
				issue: {required:true, maxlength:200},
				tips: {required:true, maxlength:200}
			},
			messages: {
				name: {required:"产品名称不能为空", maxlength:"产品名称不能大于100个字"},
				description: {required:"产品介绍不能为空", maxlength:"产品介绍不能大于200个字"},
				pic: {required:"产品图片不能为空"},
				price: {required:"钥匙数/价格不能为空", digits:"钥匙数/价格只能是正整数"},
				stock: {required:"库存不能为空", digits:"库存只能是正整数"},
				issue: {required:"发放不能为空", maxlength:"发放不能大于200个字"},
				tips: {required:"领奖提示不能为空", maxlength:"领奖提示不能大于200个字"}
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
		singleImage("#fileInput", "peipei", "#image", "input[name=pic]", "singleDiv");
	});
</script>