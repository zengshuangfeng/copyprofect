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
			<h2>账号编辑</h2>
			<ol class="breadcrumb">
				<li><a href="javascript:void(0);"
					onclick="window.parent.location.href='/main'">Home</a></li>
				<li><a>权限管理</a></li>
				<li><strong><a href="${BASE_PATH}/permission/list">账号列表</a></strong>
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
							<form id="form_submit1" action="${BASE_PATH}/permission/save"
								method="post">
								<div class="panel-body">
									<fieldset class="form-horizontal">
										<input type="hidden" name="id" value="${admin.id}" />
										<div class="form-group">
											<label class="col-sm-2 control-label">昵称：</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="nickname" value="${admin.nickname}" >
											</div>
										</div>									
										<div class="form-group">
											<label class="col-sm-2 control-label">账号：</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="username" value="${admin.username}" >
											</div>
										</div>									
										<div class="form-group">
											<label class="col-sm-2 control-label">密码：</label>
											<div class="col-sm-5">
												<input type="password" class="form-control" name="password">
											</div>
										</div>								
										<div class="form-group">
											<label class="col-sm-2 control-label">备注：</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="remark" value="${admin.remark}" >
											</div>
										</div>												
										<c:if test="${fn:length(groupList)>0}">										
										<div class="form-group"><label class="col-sm-2 control-label">角色：</label>
	                                        <div class="col-sm-5">
	                                            <select class="form-control" name="group">
	                                               <option value="0">请选择角色</option>
													<c:forEach items="${groupList}" var="group">
														<option value="${group.id}"<c:if test="${admin.group==group.id}"> selected="selected"</c:if>>${group.name}</option>
													</c:forEach>
	                                            </select>
	                                        </div>
	                                    </div>
	                                    </c:if>	
	                                    	<div class="form-group">
												<label class="col-sm-2 control-label">账号类型  ：</label>
												<div class="col-sm-10">
													<div class="radio radio-info radio-inline">
														<input type="radio" value="0" name="is_read" <c:if test="${admin.is_read==0}"> checked="checked"</c:if> /> <label for="inlineRadio3">&nbsp;主账号</label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="1" class="ml15"
															name="is_read"  <c:if test="${admin.is_read==1}"> checked="checked"</c:if>/> <label for="inlineRadio4">&nbsp;子账号</label>
													</div>
												</div>
											</div>
										<div class="form-group" id="permission">										
											<input type="hidden" name="psIds" />
											<c:forEach items="${fMenuList}" var="fTopMenu" varStatus="status">
											<c:if test="${fTopMenu.f_id == 0}">
                                            <label class="col-sm-2 control-label">${status.index==0?'权限：':''}</label>
                                            <div class="col-sm-8 position-rel acc-m-frame">
                                                <c:forEach items="${fMenuList}" var="fMenu">
													<c:if test="${fMenu.f_id == fTopMenu.id&&fMenu.id!=26}">
	                                                <div class="checkbox checkbox-success checkbox-inline acc-ipnut-son">
	                                                    <input type="checkbox" id="${fTopMenu.id}"
														   value="${fMenu.id}"   <c:if test="${fMenu.admin_id>0}"> checked="checked" name="mIds"</c:if> >
	                                                    <label> ${fMenu.name} </label>
	                                                </div>
	                                                </c:if>
                                                </c:forEach>
                                                <div class="checkbox checkbox-success checkbox-inline position-abs acc-ipnut-total">
                                                    <input type="checkbox" value="${fTopMenu.id}" id="${fTopMenu.id}"
													<c:if test="${fTopMenu.admin_id>0}"> checked="checked" name="mIds"</c:if> >
                                                    <label>  ${fTopMenu.name}</label>
                                                </div>
                                            </div>
                                            </c:if>
                                            </c:forEach>
                                        </div>								
									   <div class="form-group">
	                                        <div class="col-sm-4 col-sm-offset-2">
	                                            <button class="ladda-button btn btn-info demo1" data-style="slide-up"><i class="fa fa-check"></i>&nbsp;保存</button>
	                                        </div>
		                               </div>
									</fieldset>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/permission/list";
	$().ready(function() {
		if(${admin.group}>1)
			bindUser();
		$("#form_submit1").validate({
			rules: {
				nickname: {required:true,maxlength:30},
				username: {required:true,maxlength:30},
				password: {minlength:6,maxlength:20},
				remark: {maxlength:200}
			},
			messages: {
				nickname: {required:"账号昵称不能为空",maxlength:"账号昵称长度不能大于30个字"},
				username: {required:"账号用户名不能为空",maxlength:"账号用户名长度不能大于30个字"},
				password: {minlength:"账号密码应在6-20个字符",maxlength:"账号密码应在6-20个字符"},
				remark: {maxlength:"账号备注长度不能大于200个字"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#form_submit1"), function(json){
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
	$("select[name=group]").change(function(){
		switch($(this).val())
		{
		case "2":
			bindUser();
			break;
		case "1":
			bindAdmin();
			break;
		}
	})
	$(".acc-ipnut-total input[type=checkbox]").click(function() {
		if($(this).prop("checked")){
			$(this).attr('name','mIds');
			$(this).parent(".checkbox").siblings(".checkbox").children("input[type=checkbox]").attr('name','mIds');
			$(this).parent(".checkbox").siblings(".checkbox").children("input[type=checkbox]").prop('checked',true);
		}
		if(!$(this).prop("checked")){
			$(this).removeAttr('name');
			$(this).parent(".checkbox").siblings(".checkbox").children("input[type=checkbox]").removeAttr('name');
			$(this).parent(".checkbox").siblings(".checkbox").children("input[type=checkbox]").prop('checked',false);
		}
	});
	function bindUser()
	{
	/* 	$("input[id=23]").prop("checked", false);	
		$("input[id=23]").removeAttr("name");
		$("input[id=23]").parents(".col-sm-8").prev(".col-sm-2").hide();
		$("input[id=23]").parents(".col-sm-8").hide(); */
	}
	function bindAdmin()
	{
	/* 	$("input[id=23]").prop("checked", true);
		$("input[id=23]").attr("name", "mIds");
		$("input[id=23]").parents(".col-sm-8").prev(".col-sm-2").show();
		$("input[id=23]").parents(".col-sm-8").show();
		if(parent.document.getElementById("iframepage")!=null)
			parent.document.getElementById("iframepage").height=$(".content").height(); */
	}
	$(".acc-ipnut-son input[type=checkbox]").click(function(){	
		if($(this).prop('checked')){
		   $(this).attr('name','mIds');
		   $(this).attr('checked','checked');
		   $(this).parent(".checkbox").siblings(".acc-ipnut-total").children("input[type=checkbox]").prop('checked',true);
		   $(this).parent(".checkbox").siblings(".acc-ipnut-total").children("input[type=checkbox]").attr('name','mIds');
		}
		if(!$(this).prop('checked')){
			$(this).removeAttr('name');
			$(this).removeAttr('checked');
			/* $(this).parent(".checkbox").siblings(".acc-ipnut-total").children("input[type=checkbox]").removeAttr('checked');
			$(this).parent(".checkbox").siblings(".acc-ipnut-total").children("input[type=checkbox]").removeAttr('name'); */
		}
	}); 
</script>