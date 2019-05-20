<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
function deleteConfirm(id, url, name, title, jsonData, jumpUrl)
{
		var tip = "删除";
		if (title)
			tip = title;
		swal({
			title : "",
			text : "确定要" + tip + name + "？",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : title,
			cancelButtonText : "取消",
			closeOnConfirm : true,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				deleteData( url , id , jsonData , jumpUrl);
			}
		});
}
function deleteData(url, id, jsonData, jumpUrl)
{	
	if(typeof(jsonData) == 'undefined')
	{
		jsonData = eval('({id:'+id+'})');
	}
	
	$.ajax({type: "POST",url:url,data:jsonData,success:function(){
		if(typeof(jumpUrl) == 'undefined')
		{
			window.location.reload(true);
		}
		else
		{
			window.location.href = jumpUrl + "?r=" + Math.random();
		}		
	}});
}
</script>