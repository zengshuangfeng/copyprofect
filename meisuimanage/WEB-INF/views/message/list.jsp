<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
  <style>
        .red-point2{
          position: relative;
        }

        .red-point2::before{
          content: " ";
          border: 8px solid red;/*设置红色*/
          border-radius:2px;/*设置圆角*/
          position: absolute;
          z-index: 1000;
          right: 0%;
          margin-right: -69px;
          margin-top: 3px;
        }
    </style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>消息列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>消息列表</a></li>
					<li class="active"><strong>消息列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value=""
				var="query" />
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
												<form action="${BASE_PATH}/message/updateread" method="get" id="submit_form">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center" width="150px"><input type="checkbox" name="all">全选</th>															
																<th class="text-center"></th>
																<th class="text-center">标题</th>
																<th class="text-center">内容</th>
																<th class="text-center">发送人</th>
																<th class="text-center">时间</th>														
															</tr>
														</thead>
														
														<tbody>
														<td><input type="hidden" name="hid" id="hid" value="">
														<input type="hidden" name="read" id="read" value="">
														</td>	
															<c:forEach items="${messageList}" var="messageList">
																<tr class="text-center">																											
																<td width="150px"><input type="checkbox" name="id[]" value="${messageList.id}" onclick="userCheck(this)"></td>
																	<td>																	
																		<c:if test="${messageList.is_read==1}"></c:if>
																		<c:if test="${messageList.is_read==0}"><em  class="red-point2"></em></c:if>					
																	</td>
																	<td><a href="${BASE_PATH}/message/goauth?id=${messageList.id}"><em style="color:orange">${messageList.title}</em></a></td>
																	<td><a href="${BASE_PATH}/message/goauth?id=${messageList.id}">${messageList.content}</a></td>																
																	<td>${messageList.w_name}</td>
																<td><fmt:formatDate value="${messageList.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																</tr>
															</c:forEach>	
															<thead>														
																<tr>
																<th class="text-center">
																<button onclick="already()" >标记已读</button>																
																</th>
																<th class="text-center">																
																<button onclick="unsign()" >标记未读</button>
																</th>
																	</tr>
															</thead>													
														</tbody>														
														<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
													</table>
													</form>	
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript"> 
$(function () {
    //全选,设置chheckbox name='all' tbody id=tb
    $("input[name=all]").click(function () {
        if (this.checked) {
            $("input[name='id[]']:checkbox").prop("checked", true);
            //$("#tb :checkbox").prop("checked", true);
        } else {
            $("input[name='id[]']:checkbox").prop("checked", false);
            //$("#tb :checkbox").prop("checked", false);
        }
    });
});
//单选 设置name=id
function userCheck(ths) {
    if (ths.checked == false) {
        $("input[name=all]:checkbox").prop('checked', false);
    }
    else {
        var count = $("input[name='id[]']:checkbox:checked").length;
        if (count == $("input[name='id[]']:checkbox").length) {
            $("input[name=all]:checkbox").prop("checked", true);
        }
    }
}
//获取选中
function already() {
        var allData = new Array();
        var num = 0;
        $("input[name='id[]']:checkbox:checked").each(function(){
            allData[num] = $(this).val();
            num++;
        });	
  				 $("#hid").val(allData);
  		        $("#read").val(1);//标记已读
  		        $("#submit_form").submit();
  
}

function unsign() {
    var allData = new Array();
    var num = 0;
    $("input[name='id[]']:checkbox:checked").each(function(){
        allData[num] = $(this).val();
        num++;
    });

    $("#hid").val(allData);
    $("#read").val(0);//标记未读
    $("#submit_form").submit();
}
</script>