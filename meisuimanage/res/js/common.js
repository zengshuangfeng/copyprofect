//将form转为AJAX提交
function ajaxSubmit(frm, fn) {
    var dataPara = getFormJson(frm);
    $.ajax({
        url: frm.attr("action"),
        type: frm.attr("method"),
        data: dataPara,
        success: fn
    });
}
//将form中的值转换为键值对。
function getFormJson(frm) {
    var o = {};
    var a = $(frm).serializeArray();
    $.each(a, function () {
        if (o[this.name] != undefined) {
            o[this.name] = o[this.name] + ',' + (this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });

    return o;
}
function getCookie(name)
{
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
	return unescape(arr[2]);
	else
	return null;
}
function show(m, jumpUrl)
{
	switch(m.code)
	{
	case 0:
		swal({
		title: "",
		text: m.msg,
		type: "success",
		confirmButtonColor: '#DD6B55',
		confirmButtonText: '确定'
		},
		function(isConfirm){
		    if (isConfirm){
		    	if(jumpUrl!=null&&typeof(jumpUrl)!='undefined'&&jumpUrl!=""){
		    		window.location.href = jumpUrl + (jumpUrl.indexOf("?")>0?"":("?r=" + Math.random()));
		    	}
		    }
		});
		break;
	case -1:
		swal({title: "",text: m.msg,type: "error",confirmButtonText: "确定" });
		break;		
	}
}