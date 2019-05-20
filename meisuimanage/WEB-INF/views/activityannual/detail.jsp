<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>年度盛典</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>金钱树</a></li>
					<li class="active"><strong>查看明细</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
		<c:set
				value="&wheel=${wheel}&activity_id=${activity_id}&count=${count}"
				var="query" />
			第${count}轮
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">用户</th>																
																<th class="text-center">用户UID</th>
																<th class="text-center">红包</th>
																<th class="text-center">状态</th>															
																<th class="text-center">备注</th>
																<th class="text-center">操作人</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${prizeuser}" var="prizeuser">
																<tr class="text-center">
																<td class="text-center">${prizeuser.nickname }</td>
																<td class="text-center">${prizeuser.uid }</td>
																<td class="text-center">${prizeuser.prize_name }</td>
																<td class="text-center">													
																<c:if test="${prizeuser.is_take==1}">已领取</c:if>
																<c:if test="${prizeuser.is_take==0}"><a href="javascript:change_take(${prizeuser.id})">未领取</a></c:if>
																</td>
																<td class="text-center" style="width:222px">
																<input type="hidden" id="prizeuserid" value="${prizeuser.id}">
																<input type="text" id="remark"
											class="form-control <c:if test="${empty prizeuser.remark}"> hide</c:if>"
											name="remark" value="${prizeuser.remark}"> <c:choose>
												<c:when test="${not empty prizeuser.remark}">
												</c:when>
												<c:otherwise>
													<a class="showRemar">填写备注</a>
												</c:otherwise>
											</c:choose>
																</td>
																<td class="text-center">${prizeuser.w_name}</td>
																</tr>
															</c:forEach>
														</tbody>
														<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="recharge-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">状态</h3>
						<form id="change_take" action="${BASE_PATH}/activityannual/changetake" method="post">
							<input type="hidden" name="id"/>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right">领取该红包：</label>
								<div class="col-sm-9">									
									<div class="col-sm-10">
										<div class="radio radio-info radio-inline">
											<input type="radio" value="1" name="is_take" checked="checked" /> <label for="inlineRadio1">&nbsp;领取</label>
										</div>											
									</div>
								</div>
							</div>
					
							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									data-dismiss="modal">取消</button>
							</div>
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
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$("#remark").blur(
		function() {
			var remark= $("#remark").val();		
			var id=$("#prizeuserid").val();
			$.ajax( {  
			     url:'${BASE_PATH}/activityannual/saveremark',
			     data:{'remark':remark,'id':id}, 
			     type:'post',  
			     dataType:'json',  
			     success:function(data) { 
			    	if(data>0){
			    		show({"code":0,"msg":"保存备注成功"});
			    	}
			     },  
			     error : function() {  
			   	    show({"code":0,"msg":"保存备注失败"});  
			     }
			});
		}		
	);

});	
function change_take(id) {
	$("#recharge-modal-form").modal('show');
	$("#recharge-modal-form").find("input[name=id]").val(id);
}
$(function() {
	$("#change_take").validate({
		submitHandler : function() {
			ajaxSubmit($("#change_take"),
				function(json) {
					if (json.code == -3) {
						for (var key in json.msg) {
							$("*[name="+ json.msg[key].name + "]").addClass("error");
							$("*[name="+ json.msg[key].name + "]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+ json.msg[key].value+ "</label>");
						}
					} else
						window.location.reload();
				});
			return false;
		}
	});
});
$(".showRemar").click(function () {
	$("#remark").removeClass("hide");
});	
</script>