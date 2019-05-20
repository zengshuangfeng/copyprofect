<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>重置密码</title>
<link href="${BASE_PATH}/res/css/bootstrap.min.css" rel="stylesheet">
<link href="${BASE_PATH}/res/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="${BASE_PATH}/res/css/animate.css" rel="stylesheet">
<link href="${BASE_PATH}/res/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="loginColumns animated fadeInDown">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="ibox-content">
					<form class="m-t" role="form" action="${BASE_PATH}/login/resetpwd"
						autocomplete="off" method="post">
						<div class="form-group">
							<input type="password" class="form-control" placeholder="新密码" name="password" id="password">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="再一次新密码" name="password2">
						</div>
						<button type="submit" class="btn btn-primary block full-width m-b">重置</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${BASE_PATH}/res/js/jquery-2.1.1.js" type="text/javascript"></script>
<script src="${BASE_PATH}/res/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${BASE_PATH}/res/js/common.js" type="text/javascript"></script>
<link href="${BASE_PATH}/res/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${BASE_PATH}/res/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$("form").validate({
			rules: {
				password: {required:true,minlength:6,maxlength:30},
				password2: {required:true,equalTo:"#password"}
			},
			messages: {
				password: {required:"密码不能为空",minlength:"密码最少6个字符，最多30个字符",maxlength:"密码最少6个字符，最多30个字符"},
				password2: {required:"再一次密码不能为空",equalTo:"两次密码输入不一致"}
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
		        	{
		        		swal({
		        			title : "",
		        			text : json.msg,
		        			type : "success",
		        			showCancelButton : true,
		        			confirmButtonColor : "#DD6B55",
		        			confirmButtonText : "确定",
		        			cancelButtonText : "取消",
		        			closeOnConfirm : true,
		        			closeOnCancel : true
		        		}, function(isConfirm) {
		        			if (isConfirm) {
		        				window.location.href= "${BASE_PATH}/login"
		        			}
		        		});
		        	}
		        });
		        return false;
	    	}
		});
	});
</script>
</html>