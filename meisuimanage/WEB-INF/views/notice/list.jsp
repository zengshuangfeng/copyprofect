<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>公告列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>公告管理</a></li>
					<li class="active"><strong>公告列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set
				value="&begin_time=${begin_time}&end_time=${end_time}&type=${type}&state=${state}&platform=${platform}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
								<div class="m-b-sm">
										<form action="${BASE_PATH}/notice/list" autocomplete="off"
											method="get" >
											<div class="row">
												<div class="col-sm-2" style="clear: both;">
													<div class="form-group">
														<label class="control-label" for="date_added">开始日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i
																class="fa fa-calendar"></i></span><input type="text"
																class="form-control"  value="${begin_time}"
																name="begin_time" id="begin_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})">
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label class="control-label" for="date_modified">结束日期</label>
														<div class="input-group date">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input class="form-control" value="${end_time}"  name="end_time" id="end_time"
																onClick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})"
																type="text">
														</div>
													</div>
												</div>
												<div class="col-sm-1" style="width:130px">
													<div class="form-group">
														<label class="control-label" for="for_type">类型</label>
															<select class="form-control" name="type" onchange="$('#search_form').submit()">
																<option value="-1" <c:if test="${type == -1 }">selected</c:if>>全部</option>
																<option value="0" <c:if test="${type == 0 }">selected</c:if>>轮播</option>
																<option value="1" <c:if test="${type == 1 }">selected</c:if>>仅一次</option>
															</select>
													</div>
												</div>
												<div class="col-sm-1" style="width:130px">
													<div class="form-group">
														<label class="control-label" for="for_state">状态</label>
															<select class="form-control" name="state" onchange="$('#search_form').submit()">
																<option value="0"<c:if test="${state == 0 }">selected</c:if>>全部</option>
																<option value="1" <c:if test="${state == 1 }">selected</c:if>>未开始</option>
																<option value="2" <c:if test="${state == 2 }">selected</c:if>>进行中</option>
																<option value="3" <c:if test="${state == 3 }">selected</c:if>>已结束</option>
															</select>
													</div>
												</div>
												<div class="col-sm-1" style="width:130px">
													<div class="form-group">
														<label class="control-label" for="for_platform">平台</label>
															<select class="form-control" name="platform" onchange="$('#search_form').submit()">
																<option value="0" <c:if test="${platform == 0 }">selected</c:if>>全部</option>
																<option value="20" <c:if test="${platform == 20 }">selected</c:if>>安卓</option>
																<option value="10" <c:if test="${platform == 10 }">selected</c:if>>IOS</option>
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
																<a href="${BASE_PATH}/notice/add" class="btn btn-primary">添加</a>
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
																<th class="text-center">公告ID</th>
																<th class="text-center">公告内容</th>
																<th class="text-center">排序值</th>
																<th class="text-center">状态</th>
																<th class="text-center">类型</th>
																<th class="text-center">平台</th>
																<th class="text-center">版本</th>
																<th class="text-center">上线时间</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${list}" var="notice">
																<tr class="text-center">
																	<td>${notice.id }</td>
																	<td>${notice.content }</td>
																	<td>${notice.sort }</td>
																	<td>
																		<c:choose>
																			<c:when test="${notice.type2==0 }"><span class="label label-warning">未开始</span></c:when>
																			<c:when test="${notice.type2==1 }"><span class="label label-primary">进行中</span></c:when>
																			<c:when test="${notice.type2==2 }"><span class="label label-danger">已结束</span></c:when>
																		</c:choose>
																	</td>
																	<td>${notice.type==0?'轮播':'仅一次'}</td>
																	<td>
																		<c:if test="${notice.platform eq '10' }">IOS</c:if>
																		<c:if test="${notice.platform eq '20' }">安卓</c:if>
																		<c:if test="${notice.platform eq '0' }">全部</c:if>
																	</td>
																	<td>${notice.version }</td>
																	<td><fmt:formatDate value="${notice.start_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																	<td>
																		<a class="btn btn-xs btn-outline btn-primary" href="${BASE_PATH}/notice/edit?id=${notice.id}">编辑</a>
																		<a class="btn btn-xs btn-outline btn-danger" href="javascript:del(${notice.id})">删除</a>
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
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script>
function del(id) {
	deleteConfirm(id, "${BASE_PATH}/notice/delete", "该信息");
}
</script>