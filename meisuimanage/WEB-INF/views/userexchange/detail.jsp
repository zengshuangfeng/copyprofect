<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>订单详情</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>商城管理</a></li>
					<li><strong><a href="${BASE_PATH}/userexchange/list">订单列表</a></strong>
					</li>
					<li class="active"><strong><a>订单详情</a></strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox">
						<div class="ibox-content">
							<table class="footable table table-stripped toggle-arrow-tiny"
								data-page-size="15" style="width:60%">
								<thead>
								</thead>
								<tbody style="border-bottom: 1px solid #e7eaec; border-left: 1px solid #e7eaec; border-right: 1px solid #e7eaec;">
									<tr>
										<td bgcolor="#f3f3f4" style="width:200px">订单号</td>
										<td style="width:300px">${userExchange.o_id}</td>
										<td bgcolor="#f3f3f4" style="width:200px">订单状态</td>
										<td><c:choose>
												<c:when test="${userExchange.status==0}">待付款</c:when>
												<c:when test="${userExchange.status==1}">待发货</c:when>
												<c:when test="${userExchange.status==2}">已发货</c:when>
												<c:when test="${userExchange.status==3}">已失效</c:when>
											</c:choose></td>
									</tr>
									<tr>
										<td bgcolor="#f3f3f4">下单用户</td>
										<td>${userExchange.nickname}</td>
										<td bgcolor="#f3f3f4">下单商品</td>
										<td>${userExchange.p_name}</td>
									</tr>									
									<tr>
										<td bgcolor="#f3f3f4">支付方式</td>
										<td>${userExchange.type==0?'钥匙兑换':'现金支付'}</td>
										<td bgcolor="#f3f3f4">钥匙/金额</td>
										<td>${userExchange.price}</td>										
									</tr>								
									<tr>
										<td bgcolor="#f3f3f4">支付时间</td>
										<td>${userExchange.create_time}</td>
										<td bgcolor="#f3f3f4">备注</td>
										<td>${userExchange.remark}</td>											
									</tr>							
									<tr>
										<td bgcolor="#f3f3f4">快递物流</td>
										<td colspan="3">${userExchange.logistics_name}&nbsp;&nbsp;&nbsp;${userExchange.logistics_code}&nbsp;&nbsp;&nbsp;
										<c:if test="${not empty userExchange.logistics_code}">
										<a class="showRemar" href="javascript:copyToClipboard('${userExchange.logistics_code}');">复制</a>
										</c:if>
										</td>										
									</tr>							
									<tr>
										<td bgcolor="#f3f3f4">收货地址</td>
										<td colspan="3">${userExchange.name}&nbsp;&nbsp;&nbsp;${userExchange.tel}&nbsp;&nbsp;&nbsp;${userExchange.address}</td>										
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script type="text/javascript">
function copyToClipboard(content) {
    var aux = document.createElement("input");
    aux.setAttribute("value", content);
    document.body.appendChild(aux);
    aux.select();
    document.execCommand("copy");
    document.body.removeChild(aux);
    alert("复制成功");
  }
</script>