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
				<h2>礼物添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物管理</a></li>
					<li><strong><a href="${BASE_PATH}/gift/list">礼物列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/gift/box/save"
											method="post">											
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物名称：</label>
												<div class="col-sm-5">
													<input type="text" name="gift_name" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物文案：</label>
												<div class="col-sm-5">
													<input type="text" name="gift_description" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="gift_head" />
														<div id="singleDiv"></div>
														<img src="" class="hide wd200" id="image" />
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;图片大小：</span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物单价：</label>
												<div class="col-sm-4">
													<input type="text" name="gift_virtual" class="form-control">
												</div>
												<label class="col-sm-1 control-label" style="text-align:left">钻石</label>
											</div>													
											<div class="form-group">
												<label class="col-sm-2 control-label">对应旧礼物id：</label>
												<div class="col-sm-5">
													<input type="text" name="old_gift_id" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">礼物类型：</label>
												<div class="col-sm-5">
													<select name="gift_type" class="form-control">
														<option value="0">连击</option>
														<option value="1">特效连击</option>
														<option value="2">飘屏</option>
														<option value="3">钥匙</option>
													</select>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">飘屏量词：</label>
												<div class="col-sm-5">
													<input type="text" name="quantifier" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">飘屏客户端礼物：</label>
												<div class="col-sm-5">
													<select name="screen_type" class="form-control">
														<option value="0">请选择</option>
														<option value="1">法拉利</option>
														<option value="2">宝马车</option>
													</select>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">主播可获得魅力：</label>
												<div class="col-sm-5">
													<input type="text" name="anchor_virtual" class="form-control">
												</div>
											</div>
							
												<div class="form-group">
												<label class="col-sm-2 control-label">主播分成占比：</label>
												<div class="col-sm-5">
													<input type="text" name="anchor_divide" class="form-control" value="50"/>
												</div>
												<label class="col-sm-1 control-label" style="text-align:left">%</label>
											</div>
												<div class="form-group">
												<label class="col-sm-2 control-label">推广分成占比：</label>
												<div class="col-sm-5">
													<input type="text" name="promoter_divide" class="form-control" value="50"/>
												</div>
												<label class="col-sm-1 control-label" style="text-align:left">%</label>
											</div>
												
											<div class="form-group">
												<label class="col-sm-2 control-label">解锁等级：</label>
												<div class="col-sm-5">
													<input type="text" name="gift_level" class="form-control">
												</div>
											</div>										
											<div class="form-group">
												<label class="col-sm-2 control-label">排序值：</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" name="sort">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">版本：</label>
												<div class="col-sm-5">
													<input type="text" name="version" class="form-control">
												</div>
											</div>																				
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"
															checked="checked" /> <label for="inlineRadio1">&nbsp;正常</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online" /> <label for="inlineRadio2">&nbsp;禁用</label>
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/gift/box";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				gift_name: {required:true,maxlength:100},
				gift_description: {required:true,maxlength:200},
				gift_head: {required:true},
				gift_level: {required:true, digits:true},
				gift_key: {digits:true},
				is_private: {required:true,min:0},
				sort: {required:true, digits:true}
			},
			messages: {
				gift_name: {required:"礼物名称不能为空",maxlength:"礼物名称长度不能大于100个字"},
				gift_description: {required:"礼物文案不能为空",maxlength:"礼物文案长度不能大于200个字"},
				gift_head: {required:"礼物图片不能为空"},
				gift_level: {required:"解锁等级不能为空", digits:"解锁等级只能是正整数"},
				gift_key: {digits:"用户可获得钥匙数只能是正整数"},
				is_private: {required:"请选择礼物类型",min:"请选择礼物类型"},
				sort: {required:"排序值不能为空", digits:"排序值只能是正整数"}
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
   