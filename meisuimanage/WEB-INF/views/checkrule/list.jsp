<%@ page contentType="text/html;charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>每日签到列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li class="active"><strong>每日签到列表</strong></li>
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
																<th class="text-center">连续签到天数</th>
																<th class="text-center">获得钻石</th>
																<th class="text-center">编辑人员</th>
																<th class="text-center">生效时间</th>
																<th class="text-center">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${userCheckRuleList}" var="userCheckRule">
																<tr class="text-center">
																	<td>${userCheckRule.days}</td>
																	<td>
																		<c:choose>
																			<c:when test="${userCheckRule.days==7}">${userCheckRule.min_rand}~${userCheckRule.max_rand}</c:when>
																			<c:otherwise>${userCheckRule.reward_count}</c:otherwise>
																		</c:choose>
																	</td>															
																	<td>${userCheckRule.w_name}</td>																	
																	<td>${userCheckRule.create_time}</td>
																	<td><a
																		class="btn btn-xs btn-outline btn-primary"
																		href="javascript:editRule(${userCheckRule.id}, ${userCheckRule.days}, ${userCheckRule.reward_count}, ${userCheckRule.min_rand}, ${userCheckRule.max_rand})">编辑</a></td>
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
<div id="check-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">编辑签到</h3>
						<form class="form-horizontal" role="form" id="check_form" action="${BASE_PATH}/checkrule/save" method="post">
							<div class="form-group col-sm-12">
								<input type="hidden" name="id" />
								<input type="hidden" name="days" />
								<label class="col-sm-4 control-label text-right">连续签到天数：</label>
								<div class="col-sm-6">
									<label class="control-label" id="days"></label>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">获得钻石数：</label>
								<div class="col-sm-6" id="min_day">
									<input type="text" class="form-control" name="reward_count">
								</div>
								<div class="col-sm-2 hide" id="max_day1">
									<input type="text" class="form-control" name="min_rand">
								</div>
								<div class="col-sm-1 hide" id="max_day2">
									<label class="control-label">~</label>
								</div>
								<div class="col-sm-2 hide" id="max_day3">
									<input type="text" class="form-control" name="max_rand">
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
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<script type="text/javascript">
	function editRule(id, days, reward_count, min_rand, max_rand) {
		$("#days").text(days+"天");
		$("input[name=days]").val(days);
		$("input[name=id]").val(id);
		if(days==7)
		{
			$("input[name=min_rand]").val(min_rand);
			$("input[name=max_rand]").val(max_rand);
			$("#min_day").addClass("hide");
			$("#max_day1").removeClass("hide");
			$("#max_day2").removeClass("hide");
			$("#max_day3").removeClass("hide");
		}
		else
		{
			$("input[name=reward_count]").val(reward_count);
			$("#min_day").removeClass("hide");
			$("#max_day1").addClass("hide");
			$("#max_day2").addClass("hide");
			$("#max_day3").addClass("hide");
		}
		$("#check-modal-form").modal('show');
	}
	$().ready(function() {
		$("#check_form").validate({
			submitHandler: function(){
		        ajaxSubmit($("#check_form"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
		        		window.location.reload();
		        });
	        	return false;
	    	}
		});
	});
</script>