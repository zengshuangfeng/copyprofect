<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>主播周结列表</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>主播管理</a></li>
					<li class="active"><strong>主播周结列表</strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<c:set value="&nickname=${nickname}&uid=${uid}&f_uuid=${f_uuid}&union_id=${union_id}"
				var="query" />
			<div class="row">
				<div class="col-lg-12">
					<div class="tabs-container">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body">
									<div class="m-b-sm">
										<div class="row">
											<div class="col-sm-12">
												<form action="${BASE_PATH}/anchorweekpay/list"
													autocomplete="off" method="get" class="form-inline" id="search_form">
													<div class="form-group">
														<div class="input-group">
															<input type="text" class="form-control" value="${uid>0?uid:''}"
																name="uid" placeholder="主播uid">
														</div>
													</div>
													<div class="form-group">
														<div class="input-group">
															<input type="text" class="form-control" value="${f_uuid>0?f_uuid:''}"
																name="f_uuid" placeholder="主播数房间号">
														</div>
													</div>
													<div class="form-group">
														<div class="input-group">
															<input class="form-control" value="${nickname}" name="nickname"
																type="text" placeholder="主播昵称">
														</div>
													</div>
													<div class="form-group">
														<select name="union_id"class="form-control"
															onchange="$('#search_form').submit()">
															<option value="0">请选择工会</option>
															<c:forEach items="${anchorUnionList}" var="anchorUnion">
															<option value="${anchorUnion.id}"<c:if test="${anchorUnion.id==union_id}"> selected="selected"</c:if>>
															${anchorUnion.name}
																<c:choose>
																<c:when test="${anchorUnion.is_pay==1}">（已结算）</c:when>
																<c:otherwise><%-- ${anchorUnion.id==51?"（日结）":"（周结）"} --%></c:otherwise>
																</c:choose>
															</option>
															</c:forEach>
														</select>
													</div>
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<button type="submit" class="btn btn-primary">搜索</button>
															</span>
														</div>
													</div>													
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<c:choose>
															<c:when test="${is_show_pay==1}">
																<a href="javascript:pay(${union_id})" class="input-group">
																	<button type="button" class="btn btn-w-m btn-info">结算</button>
																</a>
															</c:when>
															<c:otherwise>
																<a href="javascript:void" class="input-group">
																	<button type="button" class="btn btn-w-m btn-default" style="background-color: #c2c2c2;border-color: #c2c2c2;color: #FFF;">结算</button>
																</a>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="form-group">
														<label class="control-label" for="status">&nbsp;</label>
														<div class="input-group">
															<span class="input-group-btn">
																<a class="btn btn-danger" href="${BASE_PATH}/anchorweekpay/exportexcel?union_id=${union_id}" <c:if test="${union_id==0||is_show_pay==1}">disabled="disabled"</c:if>>导出</a>
															</span>
														</div>
													</div>	
												</form>
											</div>
										</div>
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
																<th class="text-center">UID</th>
																<th class="text-center">房间号</th>
																<th class="text-center">昵称</th>
																<th class="text-center">工会</th>
																<th class="text-center">主播类型</th>
																<th class="text-center">收到游戏流水</th>
																<th class="text-center">游戏流水奖励（元）</th>
																<th class="text-center">总魅力值</th>
																<th class="text-center">可提现魅力值</th>
																<th class="text-center">分成占比</th>
																<th class="text-center">礼物提成（元）</th>
																<th class="text-center">直播有效天数</th>
																<th class="text-center">周奖励（元）</th>
																<th class="text-center">额外奖励（元）</th>
																<th class="text-center">总违规金额（元）</th>
																<th class="text-center">总收益</th>
																<th class="text-right footable-last-column" style="width:150px">操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${anchorPayList}" var="anchorPay">
																<tr class="text-center">
																	<td>${anchorPay.uid}</td>
																	<td>${anchorPay.f_uuid}</td>
																	<td>${anchorPay.nickname}</td>
																	<td>${anchorPay.union_name}</td>
																	<td>${anchorPay.type==1?'A/才艺类':anchorPay.type==2?'B类':''}</td>
																	<td>${anchorPay.total_stake}</td>
																	<td>${anchorPay.union_reward}</td>
																	<td>${anchorPay.total_anchor_virtual}</td>
																	<td>${anchorPay.surplus_anchor_virtual}</td>
																	<td>${anchorPay.divide}</td>
																	<td>${anchorPay.gift_money}</td>
																	<td>${anchorPay.effect_days}</td>
																	<td>${anchorPay.week_reward}</td>		
																	<td>${anchorPay.extra_money}</td>	
																	<td>${anchorPay.illegal_money}</td>
																	<td>${anchorPay.total_money}</td>
																	<td class="text-right footable-last-column"><a
																		href="javascript:showIllegal(${anchorPay.uid})" class="btn btn-xs btn-outline btn-success">设置奖惩</a>
																		<a href="${BASE_PATH}/anchorweekpay/illegallist?uid=${anchorPay.uid}" class="btn btn-xs btn-outline btn-success">备注记录</a>
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
<div id="illegal-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="m-t-none m-b">设置奖惩</h3>
						<form class="form-horizontal" role="form" id="illegal_form" action="${BASE_PATH}/anchorweekpay/saveanchorpayillegal" method="post">
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">类型</label>
								<div class="col-sm-6">
									<div class="radio radio-info radio-inline">
										<input type="radio" value="0" name="type"
											checked="checked" /> <label for="inlineRadio1">&nbsp;惩罚</label>
									</div>
									<div class="radio radio-inline">
										<input type="radio" value="1" class="ml15" name="type" />
										<label for="inlineRadio2">&nbsp;奖励</label>
									</div>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">奖惩金额</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="illegal_money">
									<input type="hidden" name="uid"/>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">日期</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="illegal_time" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label text-right">备注</label>
								<div class="col-sm-6">
									<textarea rows="3" class="form-control" name="remark"></textarea>
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
<div id="loading-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
                <div class="spiner-example">
				<div class="m-t-none m-b" style=" font-size: 22px;text-align: center;">结算中</div>
                    <div class="sk-spinner sk-spinner-wave">
                        <div class="sk-rect1"></div>
                        <div class="sk-rect2"></div>
                        <div class="sk-rect3"></div>
                        <div class="sk-rect4"></div>
                        <div class="sk-rect5"></div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<script type="text/javascript">
	function showIllegal(uid)
	{
		$("#illegal-modal-form").modal('show');
		$("#illegal-modal-form").find("input[name=uid]").val(uid);
		$("#illegal-modal-form").find("input[name=illegal_money]").val("");
		$("#illegal-modal-form").find("input[name=illegal_time]").val("");
		$("#illegal-modal-form").find("input[name=remark]").val("");
	}
	$().ready(function() {
		$("#illegal_form").validate({
			rules: {
				illegal_money: {required:true,number:true},
				illegal_time: {required:true},
				remark: {required:true,maxlength:500}
			},
			messages: {
				illegal_money: {required:"违规金额不能为空",number:"违规金额格式不对"},
				illegal_time: {required:"违规日期不能为空"},
				remark: {required:"备注不能为空",maxlength:"备注长度不能大于500个字"}
			},
			submitHandler: function(){
		        ajaxSubmit($("#illegal_form"), function(json){
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
	function pay(union_id)
	{
		$.ajax({
             type: "POST",
             url: "${BASE_PATH}/anchorweekpay/savepay",
             data: {union_id:union_id},
             dataType: "json",
             beforeSend:function(){
         		$("#loading-modal-form").modal("show");
             },
             success: function(json){
          		$("#loading-modal-form").modal("hide");
            	 swal({title: json.msg, text: "", type: "success",
         			closeOnConfirm : true}, function(isConfirm) {
         				if (isConfirm) {
         					window.location.reload();
         				}
         			})
             }
         }); 
	}
</script>