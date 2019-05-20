<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>商品列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>商品管理</a></li>
					<li class="active"><strong>商品列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&is_online=${is_online}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">	
									<div class="m-b-sm">
										<form action="${BASE_PATH}/product/list" autocomplete="off"
											method="get" id="tab">
											<div class="row">
												<div class="col-sm-1">
													<div class="form-group">
														<label class="control-label" for="status">状态</label> <select
															name="is_online" class="form-control" onchange="$('#tab').submit()">
															<option value="1"
																<c:if test="${is_online==1}"> selected="selected"</c:if>>上架</option>
															<option value="0"
																<c:if test="${is_online==0}"> selected="selected"</c:if>>下架</option>
														</select>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="status">&nbsp</label> <a
															href="${BASE_PATH}/product/add" class="input-group">
															<button type="button" class="btn btn-w-m btn-primary">添加</button>
														</a>
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
																<th class="text-left footable-first-column">ID</th>
																<th class="text-center">商品名称</th>
																<th class="text-center">商品图</th>
																<th class="text-center">商品类型</th>
																<th class="text-center">价格</th>
																<th class="text-center">库存</th>
																<th class="text-center">销量</th>
																<th class="text-center">排序值</th>
																<th class="text-center">上架时间</th>
																<th class="text-center">编辑人员</th>
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${productList}" var="product">
																<tr class="text-center">
																	<td class="text-left footable-first-column">${product.id}</td>
                           											<td>${product.name}</td>
                           											<td class="col-xs-1">
																		<c:choose><c:when test="${not empty product.pic}">
                                   			 							<img class="col-xs-12" src="${uploadUrl}${product.pic}">
                                   			 							</c:when>
                                   			 							<c:otherwise><img class="col-xs-12" src="${ctx}/img/default.jpg"  /></c:otherwise>
                                   			 							</c:choose>
                           											</td>	
                           											<td>${product.type==0?'钥匙兑换':'现金支付'}</td>	
                           											<td>${product.price}</td>
                           											<td>${product.stock}</td>
                           											<td>${product.sale_count}</td>
                           											<td>${product.sort}</td>
                           											<td>${product.create_time}</td>																
																	<td>${product.w_name}</td>				
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/product/edit?id=${product.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:updateOnline(${product.id},${product.is_online==1?0:1})">${product.is_online==1?'下架':'上架'}</a>
																		<a class="btn btn-xs btn-outline btn-danger"
																		href="javascript:deleteProduct(${product.id})">删除</a>
																	</td>
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script src="${ctx}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	function deleteProduct(id) {
		deleteConfirm(id, "${BASE_PATH}/product/delete", "该信息");
	}
	function updateOnline(id, is_online)
	{
			swal({
				title : "设置商品状态",
				text : is_online==1?"是否上架该商品？":"是否下架改商品？",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#1ab394",
				confirmButtonText : "确认",
				cancelButtonText : "取消",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({type: "POST",url:"${BASE_PATH}/product/updateisonline",data: {id:id,is_online:is_online},success:function(data){
						if(data > 0)
						{
							window.location.reload();
						}	
					}});
				}
			});	
	}
</script>