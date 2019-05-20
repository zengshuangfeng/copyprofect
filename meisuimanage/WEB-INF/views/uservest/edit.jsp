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
				<h2>马甲编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li><strong><a href="${BASE_PATH}/uservest/list">马甲列表</a></strong>
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
										<form id="tab" action="${BASE_PATH}/uservest/saveinfo"
											method="post">		
											<input type="hidden" name="id" value="${userVest.id}"/>
											<div class="form-group">
												<label class="col-sm-2 control-label">昵称：</label>
												<div class="col-sm-5">
													<input type="text" name="nickname" class="form-control" value="${userVest.nickname}">
												</div>
											</div>	
											
											<div class="form-group">
												<label class="col-sm-2 control-label">性别：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="0" name="sex"<c:if test="${userVest.sex==0}"> checked="checked"</c:if> /> <label for="inlineRadio1">&nbsp;男</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="1" 
															name="sex" <c:if test="${userVest.sex==1}"> checked="checked"</c:if>/> <label for="inlineRadio2">&nbsp;女</label>
													</div>
												</div>
											</div>			
											<div class="form-group">
												<label class="col-sm-2 control-label">头像：</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="head" value="${userVest.head}"/>
														<div id="singleDiv"></div>
														<c:choose>
															<c:when test="${empty userVest.head}">
																<img src="" class="hide wd200" id="image" />
															</c:when>
															<c:otherwise>
																<img src="${uploadUrl}${userVest.head}" class="mt10 wd200" id="image" />
															</c:otherwise>
														</c:choose>
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;图片大小：</span>
												</div>
											</div>											
											<div class="form-group">
												<label class="col-sm-2 control-label">等级：</label>
												<div class="col-sm-4">
													<input type="text" name="level" class="form-control" value="${userVest.level}">
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">年龄：</label>
												<div class="col-sm-4">
													<input type="text" name="age" class="form-control" value="${age}">
												</div>
											</div>										
											<div class="form-group">
												<label class="col-sm-2 control-label">地区：</label>
												<input name="area" value="" type="hidden"/>
												<div class="col-sm-2">
													<select name="province" class="form-control">
														<option value="">请选择省份</option>
														<c:forEach items="${areaList}" var="area">
															<option value="${area.id}"<c:if test="${userVest.province==area.id}"> selected="selected"</c:if>>${area.name}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-sm-2">
													<select name="city" class="form-control">
														<option value="">请选择城市</option>
														<c:forEach items="${areaList2}" var="area">
															<option value="${area.id}"<c:if test="${userVest.city==area.id}"> selected="selected"</c:if>>${area.name}</option>
														</c:forEach>
													</select>
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
	var jumpUrl = "${BASE_PATH}/uservest/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				nickname: {required:true,maxlength:100},
				head: {required:true},			
				level: {required:true, digits:true}
			},
			messages: {
				nickname: {required:"昵称不能为空",maxlength:"昵称长度不能大于100个字"},
				head: {required:"头像不能为空"},
				level: {required:"等级不能为空", digits:"等级只能是正整数"}
			},
			submitHandler: function(){
			    $("#tab .ladda-button").attr("disabled","disabled");
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
				    $("#tab .ladda-button").removeAttr("disabled");
		        });
	        	return false;
	    	}
		});
	});
	$(function(){	
		singleImage("#fileInput", "peipei", "#image", "input[name=head]", "singleDiv");
		$("input[name=nickname]").blur(function(){
			$.get("${BASE_PATH}/uservest/getnicknameexist",{uid:${userVest.id},nickname:$(this).val()},function(data){
				if(data==1)
				{
					$("input[name=nickname]").addClass("error");
				    $("input[name=nickname]").after("<label class=\"error\">用户昵称已存在</label>");
					$("#tab .ladda-button").attr("disabled","disabled");
				}
				else
				{
					$("input[name=nickname]").removeClass("error");
				    $("input[name=nickname]").next("label").remove();
				    $("#tab .ladda-button").removeAttr("disabled");	
				}				
			});
		});
		$("select[name=province]").change(function(){
			$.get("${BASE_PATH}/uservest/getarealist",{f_id:$(this).val()},function(json){
				var html = "<option value=\"\">请选择城市</option>";
				for(var key in json)			
				{
					html += "<option value=\"" +json[key].id+ "\">"+json[key].name+"</option>";
				}
				$("select[name=city]").html(html);
			});
		});
	});
</script>