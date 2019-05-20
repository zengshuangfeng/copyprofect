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
				<h2>座驾添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><strong><a href="${BASE_PATH}/mengyan/list">座驾列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/vehicle/save"
											method="post">
											<div class="form-group">
												<label class="col-sm-2 control-label">座驾名称：</label>
												<div class="col-sm-2">
													<input type="text" name="name" class="form-control">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">座驾简介：</label>
												<div class="col-sm-2">
													<textarea name="info" class="form-control"style="height: 120px;"></textarea>
												</div>
											</div>	
												<div class="form-group">
												<label class="col-sm-2 control-label">座驾类型：</label>
												<div class="col-sm-2">
													<select name="level" class="form-control">
														<option value="-1">请选择</option>
														<option value="3">黄金座驾</option>
														<option value="2">白银座驾</option>
														<option value="1">青铜座驾</option>
														<option value="0">普通座驾</option>
													</select>
												</div>
											</div>	
										<div class="form-group">
												<label class="col-sm-2 control-label">请选择车型：</label>
												<div class="col-sm-2">
													<select name="type" class="form-control">
														<option value="-1">请选择</option>														
														<option value="0">普通车型</option>
														<option value="1">神秘车型</option>
													</select>
												</div>
											</div>								
											<div class="form-group">
												<label class="col-sm-2 control-label">座驾图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="pic" />
														<div id="singleDiv"></div>
														<img src="" class="hide wd200" id="image" />
													</div>
													
												</div>
											</div>	
												<div class="form-group">
												<label class="col-sm-2 control-label">座驾静态图片</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload2" id="fileInput2" type="file" /><input
															type="hidden" id="imageHidden2" name="static_pic"/>
														<div id="singleDiv2"></div>
														<img src="" class="wd200 mt10" id="image2" />
													</div>
													
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">座驾动态特效图</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput3" type="file" /><input
															type="hidden" id="imageHidden3" name="special_pic"/>
														<div id="singleDiv3"></div>
														<img src="" class="wd200 mt10" id="image3" />
													</div>
													</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">座驾单价：</label>
												<div class="col-sm-2">
													<input type="text" name="price" class="form-control">
												</div>
													<label class="col-sm-1 control-label" style="text-align:left">钻石</label>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">座驾别名：</label>
												<div class="col-sm-2">
													<input type="text" name="alias_name" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">座驾期限：</label>
												<div class="col-sm-2">
													<input type="text" name="time_limit" class="form-control">
												</div>
													<label class="col-sm-1 control-label" style="text-align:left">天</label>
											</div>	

											<div class="form-group">
												<label class="col-sm-2 control-label">座驾稀有度：</label>
												<div class="col-sm-2">
													<select name="rare_level" id="rare_level" class="form-control">		
														<option value="0">请选择</option>																									
														<option value="1" <c:if test="${vehicle.rare_level==1}"> selected="selected"</c:if>>★</option>
														<option value="2" <c:if test="${vehicle.rare_level==2}"> selected="selected"</c:if>>★★</option>
														<option value="3" <c:if test="${vehicle.rare_level==3}"> selected="selected"</c:if>>★★★</option>
														<option value="4" <c:if test="${vehicle.rare_level==4}"> selected="selected"</c:if>>★★★★</option>
														<option value="5" <c:if test="${vehicle.rare_level==5}"> selected="selected"</c:if>>★★★★★</option>
														<option value="6" <c:if test="${vehicle.rare_level==6}"> selected="selected"</c:if>>★★★★★★</option>
														<option value="7" <c:if test="${vehicle.rare_level==7}"> selected="selected"</c:if>>★★★★★★★</option>
														<option value="8" <c:if test="${vehicle.rare_level==8}"> selected="selected"</c:if>>★★★★★★★★</option>
													</select>
												</div>
												<label class="col-sm-1 control-label" style="text-align:left" id="start">${vehicle.rare_level}</label>
											</div>
											<input type="hidden" name="divide" value="100">
												<!-- <div class="form-group">
												<label class="col-sm-2 control-label">分成占比：</label>
												<div class="col-sm-2">
													<input type="text" name="divide" class="form-control">
												</div>
													<label class="col-sm-1 control-label" style="text-align:left">%</label>
											</div> -->			
												<div class="form-group">
												<label class="col-sm-2 control-label">排序值：</label>
												<div class="col-sm-2">
													<input type="text" name="sort" class="form-control">
												</div>
											</div>								
										<div class="form-group">
												<label class="col-sm-2 control-label">平台：</label>
												<div class="col-sm-5">
													<label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="10">&nbsp;&nbsp;&nbsp;iOS
													</label> 
													<label class="checkbox-inline i-checks"> <input
														type="checkbox" name="platform" value="20">&nbsp;&nbsp;&nbsp;安卓
													</label>
												</div>												
											</div>		
											<div class="form-group">
												<label class="col-sm-2 control-label">状态：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="1" name="is_online"
															checked="checked" /> <label for="inlineRadio1">&nbsp;上线</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" class="ml15"
															name="is_online" /> <label for="inlineRadio2">&nbsp;下线</label>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/startScore.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/vehicle/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				name: {required:true},
				info:{required:true},			
				sort: {required:true},
				pic: {required:true},
				static_pic:{required:true},
				special_pic:{required:true},
				type:{required:true,min:0},
				divide: {required:true,number:true},
				level: {required:true,min:0},
				price: {required:true,min:0},
				time_limit: {required:true,min:0},
				alias_name: {required:true}
			},
			messages: {
				name: {required:"座驾名称不能为空"},
				info: {required:"座驾简介不能为空"},
				sort: {required:"排序值不能为空"},
				pic: {required:"座驾图片不能为空"},
				static_pic: {required:"座驾静态图片不能为空"},
				special_pic: {required:"座驾动态特效图不能为空"},
				type: {required:"请选择车型类型",min:"请选择车型类型"},
				divide: {required:"分成占比不能为空",number:"请输入数字"},
				level: {required:"请选择礼物类型",min:"请选择礼物类型"},
				price: {required:"座驾单价不能为空",min:"请输入数字"},
				time_limit: {required:"座驾期限不能为空",min:"请输入数字"},
				alias_name: {required:"座驾别名不能为空"}
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
		singleImage("#fileInput", "meisui", "#image", "input[name=pic]", "singleDiv");
		singleImage("#fileInput2", "meisui", "#image2", "input[name=static_pic]", "singleDiv2");
		singleImage("#fileInput3", "meisui", "#image3", "input[name=special_pic]", "singleDiv3");
		
		$("#rare_level").change(function(){
			var start=$("#rare_level").val();
			$("#start").html(start);
			});   
	});
	
</script>
   