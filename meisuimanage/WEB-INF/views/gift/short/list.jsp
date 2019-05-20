<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>礼物列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>礼物管理</a></li>
					<li class="active"><strong>快捷礼物列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
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
																<th class="text-center footable-first-column">快捷礼物图标</th>
																<th class="text-center">礼物种类</th>															
																<th class="text-center">礼物名称</th>															
																<th class="text-center">礼物图片</th>																														
																<th class="text-center">礼物单价（钻石）</th>	
																<th class="text-center">备注</th>												
																<th class="text-right footable-last-column">操作</th>
															</tr>
														</thead>
														<tbody>														
														<tr class="text-center">																
															<td class="col-xs-1">
																		<c:choose><c:when test="${not empty short_gift.gift_pic}">
                                   			 							<img class="col-xs-12" src="${uploadUrl}${short_gift.gift_pic}">
                                   			 							</c:when>
                                   			 							<c:otherwise><img class="col-xs-12" src="${ctx}/img/default.jpg"  /></c:otherwise>
                                   			 							</c:choose>
                           											</td>	
																	<td><c:if test="${short_gift.gift_info.type==0}">普通礼物</c:if>
																	<c:if test="${short_gift.gift_info.type==1}">特殊礼物</c:if>
																	</td>
																	<td>${short_gift.gift_info.gift_name}</td>																
																	<td class="col-xs-1">
																		<c:choose><c:when test="${not empty short_gift.gift_info.gift_head}">
                                   			 							<img class="col-xs-12" src="${uploadUrl}${short_gift.gift_info.gift_head}">
                                   			 							</c:when>
                                   			 							<c:otherwise><img class="col-xs-12" src="${ctx}/img/default.jpg"  /></c:otherwise>
                                   			 							</c:choose>
                           											</td>	
																	<td>${short_gift.gift_info.gift_virtual}</td>	
																	<td>${short_gift.remark}</td>																
																	<td class="text-right footable-last-column"><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="${BASE_PATH}/shortgift/edit?id=${short_gift.id}">编辑</a>
																		</td>
																</tr>													
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
