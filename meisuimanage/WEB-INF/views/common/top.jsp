<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <style>
        .red-point{
          position: relative;
        }

        .red-point::before{
          content: " ";
          border: 7px solid red;/*设置红色*/
          border-radius:7px;/*设置圆角*/
          position: absolute;
          z-index: 1000;
          right: 0%;
          margin-right: -9px;
          margin-top: -9px;
        }
    </style>
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
			<li><a href="${BASE_PATH}/message/list">
				<c:if test="${messagecount==0}"><em>消息</em></c:if>
				<c:if test="${messagecount>0}"><em  class="red-point">消息</em></c:if>		
			</a></li>
			<li><a tabindex="-1" href="#modal-form" data-toggle="modal">修改密码</a></li>
			<li><a href="${BASE_PATH}/logout"> <i class="fa fa-sign-out"></i>
					注销
			</a></li>
		</ul>
	</nav>
</div>
<div id="modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<form class="form-horizontal" role="form" id="updatePwd"
							action="${BASE_PATH}/login/savepwd" method="POST">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">旧密码：</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" placeholder=""
										name="opwd">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">新密码：</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" placeholder=""
										name="npwd">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">确认新密码：</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" placeholder=""
										name="npwd2">
								</div>
							</div>
							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									data-dismiss="modal">取消</button>
							</div>
							<input type="hidden" name="id" value="${id}" />
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
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