<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav metismenu" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span> <c:if test="${null==userIcon||userIcon==''}">
									<img alt="image" class="img-circle" style="width:48px;height:48px;" src="${ctx}/img/adminhead.jpg" />
								</c:if> 
								<c:if test="${null!=userIcon&&userIcon!=''}"><img alt="image" class="img-circle" src="${userIcon}" />
								</c:if>
							</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear"> <span class="block m-t-xs"> <strong
										class="font-bold">${user}</strong>
								</span>
							</span>
							</a>
						</div>
					</li>
					<c:forEach items="${menuList}" var="menu">
						<c:if test="${menu.f_id == 0 }">
							<li><a href="#"><i class="${menu.class_name}"></i><span class="nav-label">${menu.name}</span><span
									class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<c:forEach items="${menuList}" var="submenu">
										<c:if test="${submenu.f_id == menu.id}">
											<li><a  href="javascript:void(0)"
							onclick="jump('${BASE_PATH}/${submenu.url}?r='+Math.random(),this)">${submenu.name}</a>
											</li>
										</c:if>
									</c:forEach>
								</ul></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</nav>
		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top  " role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>
						<!-- <form role="search" class="navbar-form-custom"
							action="search_results.html">
							<div class="form-group">
								<input type="text" placeholder="搜索" class="form-control"
									name="top-search" id="top-search">
							</div>
						</form> -->
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li><span class="m-r-sm text-muted welcome-message">欢迎来到美岁直播</span>
						</li>
						<li><a tabindex="-1" href="#modal-form" data-toggle="modal">修改密码</a></li>
						<li><a tabindex="-1" href="${BASE_PATH}/logout">注销<i class="fa fa-sign-out"></i></a></li>
					</ul>

				</nav>
			</div>
			<div style="-webkit-overflow-scrolling:touch;overflow:auto;">
			<iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
				id="iframepage" src="${BASE_PATH}/blank" width="100%"
				onLoad="iFrameHeight()"></iframe></div>
	
			
			<!-- <div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-sm-4">
					<h2>标题</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">This is</a></li>
						<li class="active"><strong>Breadcrumb</strong></li>
					</ol>
				</div>
			</div>
			<div class="wrapper wrapper-content">
				<div class="middle-box text-center animated fadeInRightBig">casd</div>
			</div> -->
		</div>
	</div>	
    <div id="modal-form" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <form class="form-horizontal" role="form" id="updatePwd" action="${BASE_PATH}/login/savepwd" method="POST">
                            	 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <div class="form-group col-sm-12"><label class="col-sm-3 control-label text-right">旧密码：</label>
                                    <div class="col-sm-6"><input type="password" class="form-control" placeholder="" name="opwd"></div>
                                </div>
                                <div class="form-group col-sm-12"><label class="col-sm-3 control-label text-right">新密码：</label>
                                    <div class="col-sm-6"><input type="password" class="form-control" placeholder="" name="npwd"></div>
                                </div>
                                <div class="form-group col-sm-12"><label class="col-sm-3 control-label text-right">确认新密码：</label>
                                    <div class="col-sm-6"><input type="password" class="form-control" placeholder="" name="npwd2"></div>
                                </div>
                                <div class="col-sm-6">
                                     <button class="btn btn-default pull-right" type="button" data-dismiss="modal">取消</button>
                                </div>
                                <input type="hidden" name="id" value="${id}"/>
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>							
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/menu/list";
	$().ready(function() {
		$("#updatePwd").validate({
			rules: {
				opwd: {required:true},
				npwd: {required:true},
				npwd2: {required:true}
			},
			messages: {
				opwd: {required:"旧密码不能为空"},
				npwd: {required:"新密码不能为空"},
				npwd2: {required:"确认新密码不能为空"}
			},
			submitHandler: function(){
		        ajaxSubmit($("form"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
		        		window.location.href="${BASE_PATH}/login";
		        });
		        return false;
	    	}
		});
	});
</script>
