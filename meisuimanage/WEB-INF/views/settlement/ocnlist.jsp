<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>运营中心未结算</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>结算管理</a></li>
					<li class="active"><strong>运营中心未结算</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
		<c:set value="&type=${type }&centerId=${centerId}" var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">
										<form action="${BASE_PATH}/settlement/ocnlist"
											autocomplete="off" method="get" id="search_form">
											<div class="row">
												<div class="col-sm-1" style="width:130px">
													<div class="form-group">
														<label class="control-label" for="for_type">类型</label>
															<select class="form-control" name="type" onchange="$('#search_form').submit()">
																<option value="0" <c:if test="${type == 0 }">selected</c:if>>周结</option>
																<option value="1" <c:if test="${type == 1 }">selected</c:if>>日结</option>
															</select>
													</div>
												</div>
												<div class="col-sm-1" style="width:150px">
													<div class="form-group">
														<label class="control-label" for="for_type">选中运营中心</label>
															<select class="form-control" name="centerId" onchange="$('#search_form').submit()">
																<option value="0">全部</option>
																<c:forEach var="center" items="${centerList }">
																	<option value="${center.id }" <c:if test="${center.id==centerId }">selected</c:if> >${center.name }</option>
																</c:forEach>
															</select>
													</div>
												</div>
												
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<button type="submit" class="btn btn-primary">搜索</button>
															</span>
														</div>
													</div>
												</div>
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger"  href="javascript:cleanAll(${type },${centerId })">一键清除魅力值</a>
															</span>
														</div>
													</div>
												</div>
											</div>
										</form>
										
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="ibox">
												<div class="ibox-content">
													<table
														class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
														data-page-size="15">
														<thead>
															<tr>
																<th class="text-center">运营中心ID</th>
																<th class="text-center">运营中心名称</th>
																<th class="text-center">类型</th>
																<th class="text-center">总魅力值</th>
																<th class="text-center">已兑换魅力值</th>
																<th class="text-center">本次结算魅力值</th>
																<th class="text-center">运营中心分成</th>
																<th class="text-center">总收益（元）</th>
															</tr>
														</thead>
														<tbody>
														<c:forEach items="${list }" var="center">
															<c:if test="${center.surplus_anchor_virtual>0}">
																<tr class="text-center">
																	<td>${center.id}</td>
																	<td>${center.name}</td>
																	<td>${center.settlement_type==0?'周结':'日结'}</td>
																	<td>${center.total_anchor_virtual}</td>
																	<td>${center.total_exchange_virtual}</td>
																	<td>${center.surplus_anchor_virtual-center.total_exchange_virtual}</td>
																	<td>${center.divide}%</td>
																	<td><fmt:formatNumber value="${center.money_count}" pattern="0.00" maxFractionDigits="2"/>元</td>
																</tr>
															</c:if>
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
	var is_click = 0;
	function cleanAll(type,centerId){
		$(".btn-danger").attr("disabled","disabled");
		swal({ 
			  title: "清除魅力值", 
			  text: "确认清除魅力值？", 
			  type: "warning",
			  showCancelButton: true, 
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "确定", 
			  cancelButtonText: "取消",
			  closeOnConfirm: false, 
			},
			function(isConfirm){ 
			  if (isConfirm&&is_click==0) {
				  is_click = 1;
				  $.ajax({
					  type:"post",
					  data:{
						  type:type,centerId:centerId
					  },
				 	  url:"${BASE_PATH}/settlement/cleancenter",
				 	  success:function(data){
			 			swal({ 
				 			  title: data==1?"清除成功":"清除失败", 
				 			  type:data==1?"success":"error",
				 			  showConfirmButton: true,
				 			  confirmButtonText: "确定", 
				 			},
				 			function(isConfirm){
				 				window.location.reload();
				 			}
				 		);
				 	  }
				  })
			  }
			  else
				  $(".btn-danger").removeAttr("disabled");
			});
	}
</script>