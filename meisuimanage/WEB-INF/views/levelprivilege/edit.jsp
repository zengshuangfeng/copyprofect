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
				<h2>等级特权添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li><strong><a href="${BASE_PATH}/levelprivilege/list">特权管理</a></strong>
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
										<form id="tab" action="${BASE_PATH}/levelprivilege/save"
											method="post">		
											<input type="hidden" name="id" value="${levelPrivilege.id}"/>
											<div class="form-group">
												<label class="col-sm-2 control-label">特权名称：</label>
												<div class="col-sm-5">
													<input type="text" name="title" class="form-control" value="${levelPrivilege.title}">
												</div>
											</div>			
											<div class="form-group">
												<label class="col-sm-2 control-label">特权图标</label>
												<div class="btn-group col-sm-6">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="icon" value="${levelPrivilege.icon}"/>
														<div id="singleDiv"></div>
														<c:choose>
															<c:when test="${empty levelPrivilege.icon}">
																<img src="" class="hide wd200" id="image" />
															</c:when>
															<c:otherwise>
																<img src="${uploadUrl}${levelPrivilege.icon}" class="mt10 wd200" id="image" />
															</c:otherwise>
														</c:choose>
													</div>
													<span class="col-sm-5 help-block m-b-none text-danger"
														style="color: blue">&nbsp;&nbsp;&nbsp;图片大小：</span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">解锁等级：</label>
												<div class="col-sm-4">
													<select name="level" class="form-control">
														<c:forEach var="i" begin="1" end="100">
															<option value="${i}"<c:if test="${levelPrivilege.level==i}"> selected="selected"</c:if>>${i}</option>
														</c:forEach>
													</select>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-sm-2 control-label">排序：</label>
												<div class="col-sm-4">
													<input type="text" name="sort" class="form-control" value="${levelPrivilege.sort}">
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
	var jumpUrl = "${BASE_PATH}/levelprivilege/list";
	$().ready(function() {
		$("#tab").validate({
			rules: {
				title: {required:true,maxlength:100},
				icon: {required:true},
				sort: {digits:true}
			},
			messages: {
				name: {required:"特权名称不能为空",maxlength:"特权名称长度不能大于100个字"},
				icon: {required:"特权图标不能为空"},
				sort: {digits:"排序只能是正整数"}
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
		singleImage("#fileInput", "peipei", "#image", "input[name=icon]", "singleDiv");
	});
</script>