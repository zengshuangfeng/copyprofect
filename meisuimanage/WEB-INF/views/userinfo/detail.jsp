<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<link
	href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<style type="text/css">
.product-imitation {
	padding: 0
}

.row {
	margin-left: 0;
}
</style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>用户详情</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>用户管理</a></li>
					<li><strong><a href="${BASE_PATH}/userinfo/list">用户列表</a></strong>
					</li>
					<li class="active"><strong><a>用户详情</a></strong></li>
				</ol>
			</div>
		</div>
		<div class="wrapper wrapper-content animated fadeInRight ecommerce">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox">
						<div class="ibox-content">
							<table class="footable table table-stripped toggle-arrow-tiny"
								data-page-size="15">
								<thead>
								</thead>
								<tbody
									style="border-bottom: 1px solid #e7eaec; border-left: 1px solid #e7eaec; border-right: 1px solid #e7eaec;">
									<tr>
										<td rowspan="7" class="text-center"><c:choose>
												<c:when test="${not empty tuser.head}">
													<img
														src="${fn:startsWith(tuser.head,'http')?'':uploadUrl}${tuser.head}"
														class="wd150" />
													<br>
												</c:when>
												<c:otherwise>
													<div id="singleDiv">
														<img src="${ctx}/img/default.jpg" class="wd100" />
													</div>
													<br>

												</c:otherwise>
											</c:choose> <br /> <a class="ladda-button btn btn-info"
											href="javascript:updateUserIsBlocked(${tuser.id},${tuser.is_blocked==0?1:0})">${tuser.is_blocked==0?'封号':'取消封号'}</a>
											<a class="ladda-button btn btn-info"
											href="${BASE_PATH}/userinfo/piclist?uid=${tuser.id}">修改图片</a>
										</td>
										<td bgcolor="#f3f3f4">昵称</td>
										<td>${tuser.nickname}<c:if test="${tuser.is_anchor==1}">
												<a href="${BASE_PATH}/useranchor/list?uid=${tuser.id}">（主播）</a>
											</c:if>
										</td>
										<td bgcolor="#f3f3f4">性别</td>
										<td><c:choose>
												<c:when test="${tuser.sex==0}">男</c:when>
												<c:when test="${tuser.sex==1}">女</c:when>
												<c:otherwise>未知</c:otherwise>
											</c:choose></td>
										<td bgcolor="#f3f3f4">生日</td>
										<td>${tuser.birthday}</td>
										<td bgcolor="#f3f3f4"></td>
										<td></td>
									</tr>
									<tr>
										<td bgcolor="#f3f3f4">总充值（钻石）</td>
										<td>${tuser.total_balance_virtual}</td>
										<td bgcolor="#f3f3f4">钻石余额</td>
										<td>${tuser.balance_virtual}</td>
										<td bgcolor="#f3f3f4">经验值</td>
										<td>${user_Info.score}</td>
										<td bgcolor="#f3f3f4">等级</td>
										<td>${tuser.level}</td>
									</tr>
									<tr>

										<td bgcolor="#f3f3f4">关注人数</td>
										<td>${user_Info.attention_count}</td>
										<td bgcolor="#f3f3f4">注册时间</td>
										<td>${tuser.register_time}</td>
										<td bgcolor="#f3f3f4">最后登录时间</td>
										<td>${tuser.last_login_time}</td>
										<td bgcolor="#f3f3f4">登录方式</td>
										<td style="min-width: 100px"><c:choose>
												<c:when test="${tuser.login_type==0}">微博</c:when>
												<c:when test="${tuser.login_type==1}">qq</c:when>
												<c:when test="${tuser.login_type==2}">微信</c:when>
												<c:when test="${tuser.login_type==3}">支付宝</c:when>
												<c:otherwise>手机</c:otherwise>
											</c:choose></td>
									</tr>

									<tr>
										<td bgcolor="#f3f3f4">姓名</td>
										<td>${tuser.realname}</td>
										<td bgcolor="#f3f3f4">身份证号码</td>
										<td>${userReal.card}</td>
										<td bgcolor="#f3f3f4">手机号码</td>
										<td>${tuser.tel}</td>
										<td bgcolor="#f3f3f4">QQ号</td>
										<td>${userReal.qq}</td>
									</tr>
									<tr>
										<td bgcolor="#f3f3f4">邀请所属运营中心</td>
										<td>${operateName}</td>
										<td bgcolor="#f3f3f4">邀请所属代理平台</td>
										<td>${agentName}</td>
										<td bgcolor="#f3f3f4">邀请所属推广员</td>
										<td>${proName}</td>
										<td bgcolor="#f3f3f4">用户备注</td>
										<td><input type="text" id="remark"
											class="form-control <c:if test="${empty tuser.remark}"> hide</c:if>"
											name="remark" value="${tuser.remark}"> <c:choose>
												<c:when test="${not empty tuser.remark}">
												</c:when>
												<c:otherwise>
													<a class="showRemar">填写备注</a>
												</c:otherwise>
											</c:choose></td>
									</tr>
									<tr>
									<tr>
										<td bgcolor="#f3f3f4">VIP会员</td>
										<td>${vip_remaining<0?'否':'是'}<a
											class="ladda-button btn btn-info" style="float: right"
											href="javascript:setUserVIP(${tuser.id},${tuser.is_blocked==0?1:0})">设置</a></td>
										<td bgcolor="#f3f3f4">VIP剩余天数</td>
										<td>${vip_remaining<0?'':vip_remaining}</td>
										<td bgcolor="#f3f3f4">所属推广员房间号</td>
										<td>${F_uuid>0?F_uuid:'' }</td>
										<td colspan="4"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="wrapper wrapper-content animated fadeInRight ecommerce">
				<c:set value="&id=${tuser.id}&type=${type}&select=${select}"
					var="query" />
				<div class="row">
					<div class="col-lg-12">
						<div class="tabs-container">
							<ul class="nav nav-tabs orderTab">
								<li <c:if test="${type==0}"> class="active"</c:if> data-ref="0"><a>激活信息</a></li>
								<li <c:if test="${type==1}"> class="active"</c:if> data-ref="1"><a>网络信息</a></li>
								<li <c:if test="${type==2}"> class="active"</c:if> data-ref="2"><a>关注列表</a></li>
								<li <c:if test="${type==3}"> class="active"</c:if> data-ref="3"><a>流水记录</a></li>
								<c:if test="${anchor==1}">
									<li <c:if test="${type==4}"> class="active"</c:if> data-ref="4"><a>收礼记录</a></li>
								</c:if>
								<c:if test="${result==1}">
									<li <c:if test="${type==5}"> class="active"</c:if> data-ref="5"><a>推广员魅力收益记录</a></li>
								</c:if>
								<li <c:if test="${type==6}"> class="active"</c:if> data-ref="6"><a>礼物箱</a></li>
								<c:if test="${anchor==0}">
									<li <c:if test="${type==7}"> class="active"</c:if> data-ref="7"><a>守护列表(金额)</a></li>
									<li <c:if test="${type==9}"> class="active"</c:if> data-ref="9"><a>守护列表(钻石)</a></li>
								</c:if>
								<c:if test="${anchor==1}">
									<li <c:if test="${type==8}"> class="active"</c:if> data-ref="8"><a>守护列表(金额)</a></li>
									<li <c:if test="${type==10}"> class="active"</c:if> data-ref="10"><a>守护列表(钻石)</a></li>
								</c:if>
							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<div class="panel-body">
										<c:if test="${type==3}">
											<div class="col-sm-1">
												<div class="form-group">
													<label class="control-label" for="status">&nbsp;</label> <label
														class="control-label" for="status">&nbsp;</label>
													<div class="input-group">
														<span class="input-group-btn"> <a
															class="btn btn-danger"
															href="${BASE_PATH}/userinfo/totalFLowingList/exportexcel?uid=${tuser.id}">导出</a>
														</span>
													</div>
												</div>
											</div>
										</c:if>
										<div class="row">
											<div class="col-lg-12">
												<div class="ibox">
													<div class="ibox-content">
														<div style="clear: both;"></div>
														<c:if test="${type==0}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">机型</th>
																		<th class="text-center">手机品牌</th>
																		<th class="text-center">渠道</th>
																		<th class="text-center">系统版本</th>
																		<th class="text-center">软件版本</th>
																		<th class="text-center">平台</th>
																		<th class="text-center">首次登录时间</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${extraList}" var="extra">
																		<tr>
																			<td class="text-center">${extra.mobile_model}</td>
																			<td class="text-center">${extra.mobile_brand}</td>
																			<td class="text-center">${extra.channel}</td>
																			<td class="text-center">${extra.system_version}</td>
																			<td class="text-center">${extra.software_version}</td>
																			<td class="text-center">${extra.platform==10||extra.platform==11?'IOS':'Android'}</td>
																			<td class="text-center">${extra.first_time}</td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==1}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">ip地址</th>
																		<th class="text-center">网络</th>
																		<th class="text-center">移动商</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${deviceList}" var="device">
																		<tr>
																			<td class="text-center"><c:if
																					test="${not empty device.ip_string}">${device.ip_string}<br />${device.ip_address}</c:if></td>
																			<td class="text-center">${device.network}</td>
																			<td class="text-center">${device.apn}</td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==2}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">主播ID</th>
																		<th class="text-center">主播昵称</th>
																		<th class="text-center">关注时间</th>
																		<th class="text-center">是否取关</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${attentionList}" var="attention">
																		<tr>
																			<td class="text-center">${attention.attention_uid}</td>
																			<td class="text-center">${attention.attention_nickname}</td>
																			<td class="text-center">${attention.create_time}</td>
																			<td class="text-center">${attention.is_attention==1?'是':'否'}</td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==3}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">类型</th>
																		<th class="text-center">收支</th>
																		<th class="text-center">时间</th>
																		<th class="text-center">备注</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${totalFLowingList}"
																		var="totalFLowing">
																		<tr>
																			<td class="text-center">${totalFLowing.type}</td>
																			<td class="text-center">${totalFLowing.balance_pay==0?'+':'-'}${totalFLowing.spending_virtual}</td>
																			<td class="text-center">${totalFLowing.create_time}</td>
																			<td class="text-center">${totalFLowing.remark}</td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>

														<c:if test="${type==4}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">送礼方UID</th>
																		<th class="text-center">送礼方等级</th>
																		<th class="text-center">送礼方房间号</th>
																		<th class="text-center">礼物名称</th>
																		<th class="text-center">礼物价值(钻)</th>
																		<th class="text-center">获得魅力值</th>
																		<th class="text-center">魅力值分成占比</th>
																		<th class="text-center">送礼时间</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${spendinglist}" var="spendinglist">
																		<tr>
																			<td class="text-center">${spendinglist.nickname}(
																				<a
																				href="${BASE_PATH}/userinfo/detail?id=${spendinglist.uid}">uid:
																					${spendinglist.uid}</a>)
																			</td>
																			<td class="text-center">${spendinglist.level}</td>
																			<td class="text-center">${spendinglist.f_uuid}</td>
																			<td class="text-center">
																			<c:if test="${spendinglist.is_box==0}">${spendinglist.gift_name}</c:if>
																			<c:if test="${spendinglist.is_box==1}">${spendinglist.gift_name}(宝箱)</c:if>
																			</td>
																			<td class="text-center">${spendinglist.giftprize}</td>
																			<td class="text-center">${spendinglist.giftprize*0.5}</td>
																			<td class="text-center">${spendinglist.promoter_divide }%</td>
																			<td class="text-center">${spendinglist.create_time}
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==5}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">送礼方UID</th>
																		<th class="text-center">送礼方等级</th>
																		<th class="text-center">送礼方房间号</th>
																		<th class="text-center">礼物名称</th>
																		<th class="text-center">礼物价值(钻)</th>
																		<th class="text-center">获得魅力值</th>
																		<th class="text-center">魅力值分成占比</th>
																		<th class="text-center">送礼时间</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${spendinglist}" var="spendinglist">
																		<tr>
																			<td class="text-center">
																				${spendinglist.nickname}( <a
																				href="${BASE_PATH}/userinfo/detail?id=${spendinglist.uid}">uid:
																					${spendinglist.uid}</a>)
																			</td>
																			<td class="text-center">${spendinglist.level}</td>
																			<td class="text-center">${spendinglist.f_uuid}</td>
																			<td class="text-center">
																			<c:if test="${spendinglist.is_box==0}">${spendinglist.gift_name}</c:if>
																			<c:if test="${spendinglist.is_box==1}">${spendinglist.gift_name}(宝箱)</c:if>
																			</td>
																			<td class="text-center">${spendinglist.giftprize}</td>
																			<td class="text-center">${spendinglist.giftprize*0.5}</td>
																			<td class="text-center">${spendinglist.anchor_divide}%</td>
																			<td class="text-center">${spendinglist.create_time}
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==6}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">礼物</th>
																		<th class="text-center">个数</th>
																		<th class="text-center">操作<br> <font
																			size="1" color="red">操作日志请到礼物箱管理查看</font>
																		</th>

																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${giftboxlist}" var="giftboxlist">
																		<tr>

																			<td class="text-center">${giftboxlist.gift_name}</td>
																			<td class="text-center">${giftboxlist.gift_count}</td>
																			<td class="text-center"><a
																				class="btn btn-xs btn-outline btn-danger mt10"
																				href="javascript:deleteGiftBox(${giftboxlist.id},${giftboxlist.gift_count},${giftboxlist.uid},${giftboxlist.type})">删除</a>
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==7}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">主播UID</th>
																		<th class="text-center">守护购买金额</th>
																		<th class="text-center">守护状态<br>
																		<th class="text-center">守护开始时间</th>
																		<th class="text-center">守护结束时间</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${guardlist}" var="guardlist">
																		<tr>
																			<td class="text-center">${guardlist.anchor_name}
																				( <a
																				href="${BASE_PATH}/userinfo/detail?id=${guardlist.anchor_uid}">${guardlist.anchor_uid}</a>)

																			</td>
																			<td class="text-center">${guardlist.recharge_rmb}</td>
																			<td class="text-center"><c:if
																					test="${guardlist.status==0}">
																					<span class="label label-danger">过期</span>
																				</c:if> <c:if test="${guardlist.status==1}">
																					<span class="label label-primary">正常</span>
																				</c:if></td>
																			<td class="text-center"><fmt:formatDate
																					value="${guardlist.start_time}"
																					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																			<td class="text-center"><fmt:formatDate
																					value="${guardlist.end_time}"
																					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==8}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">送礼方UID</th>
																		<th class="text-center">守护购买金额</th>
																		<th class="text-center">守护开始时间</th>
																		<th class="text-center">守护结束时间</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${guardlist}" var="guardlist">
																		<tr>
																			<td class="text-center">${guardlist.nickname}(<a
																				href="${BASE_PATH}/userinfo/detail?id=${guardlist.uid}">${guardlist.uid}</a>)

																			</td>
																			<td class="text-center">${guardlist.recharge_rmb}</td>
																			<td class="text-center"><fmt:formatDate
																					value="${guardlist.start_time}"
																					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																			<td class="text-center"><fmt:formatDate
																					value="${guardlist.end_time}"
																					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==9}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">主播UID</th>
																		<th class="text-center">守护购买金额</th>
																		<th class="text-center">守护状态<br>
																		<th class="text-center">守护开始时间</th>
																		<th class="text-center">守护结束时间</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${guardlist}" var="guardlist">
																		<tr>
																			<td class="text-center">${guardlist.anchor_name}
																				( <a
																				href="${BASE_PATH}/userinfo/detail?id=${guardlist.anchor_uid}">${guardlist.anchor_uid}</a>)

																			</td>
																			<td class="text-center">${guardlist.spending_virtual}</td>
																			<td class="text-center"><c:if
																					test="${guardlist.status==0}">
																					<span class="label label-danger">过期</span>
																				</c:if> <c:if test="${guardlist.status==1}">
																					<span class="label label-primary">正常</span>
																				</c:if></td>
																			<td class="text-center"><fmt:formatDate
																					value="${guardlist.start_time}"
																					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																			<td class="text-center"><fmt:formatDate
																					value="${guardlist.end_time}"
																					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
														<c:if test="${type==10}">
															<table
																class="footable table table-stripped toggle-arrow-tiny no-paging footable-loaded default"
																data-page-size="15">
																<thead>
																	<tr>
																		<th class="text-center">送礼方UID</th>
																		<th class="text-center">守护购买金额</th>
																		<th class="text-center">守护开始时间</th>
																		<th class="text-center">守护结束时间</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${guardlist}" var="guardlist">
																		<tr>
																			<td class="text-center">${guardlist.nickname}(<a
																				href="${BASE_PATH}/userinfo/detail?id=${guardlist.uid}">${guardlist.uid}</a>)

																			</td>
																			<td class="text-center">${guardlist.spending_virtual}</td>
																			<td class="text-center"><fmt:formatDate
																					value="${guardlist.start_time}"
																					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																			<td class="text-center"><fmt:formatDate
																					value="${guardlist.end_time}"
																					pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
																		</tr>
																	</c:forEach>
																</tbody>
																<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
															</table>
														</c:if>
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
</div>
<div id="vipchoice-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">VIP选项</h3>
						<form id="uservip" action="${BASE_PATH}/userinfo/updateuservip"
							method="post">
							<input type="hidden" name="id" value="${tuser.id}" />

							<div class="form-group col-sm-12">
								<div class="col-sm-9">
									<div class="i-checks">
										<label><input type="radio" checked="checked"
											value="30" name="vip_days"> <i></i>30天 </label>
									</div>
									<div class="i-checks">
										<label> <input type="radio" value="90" name="vip_days">
											<i></i>90天
										</label>
									</div>
									<div class="i-checks">
										<label> <input type="radio" value="180"
											name="vip_days"> <i></i>180天
										</label>
									</div>
									<div class="i-checks">
										<label> <input type="radio" value="999"
											name="vip_days"> <i></i>999天
										</label>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									onclick="cancelVIP(${tuser.id})" data-dismiss="modal">取消VIP</button>
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
<div id="update-modal-form" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h3 class="m-t-none m-b">删除礼物箱</h3>
						<form id="updateodds"
							action="${BASE_PATH}/userinfo/giftbox/delete" method="post">
							<input type="hidden" name="id" id="id" value="" /> <input
								type="hidden" name="gift_count" value="" /> <input
								type="hidden" name="uid" value="" /> <input type="hidden"
								name="type" value="" />
							<div class="form-group col-sm-12">
								<div class="col-sm-3">&nbsp;</div>
								<div class="col-sm-9" id="tipname"></div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3 control-label text-right" id="tipname2">删除数量:</label>
								<div class="col-sm-9">
									<input type="text" name="count" class="form-control" value=""
										placeholder="请输入删除数量">
								</div>
							</div>
							<div class="col-sm-6">
								<button class="btn btn-default pull-right" type="button"
									data-dismiss="modal">取消</button>
							</div>
							<span class="input-group-btn"> <a class="btn btn-primary"
								href="javascript:search();">确定</a>
							</span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/del.jsp"%>
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js?r=123300"
	type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">

var jumpUrl = "${BASE_PATH}/userinfo/list";


function search()
{
	var count1 = $("input[name=gift_count]").val();
	var count2 = $("input[name=count]").val();
	var uid=$("")
	var is_zzs=0;
	//判断count2是否为正整数 
	if (!(/(^[1-9]\d*$)/.test(count2))) { 
　　　　 is_zzs=1;
　　　　}	
	if(is_zzs==0){
		if(count1 - count2 >=0)
		{ 
			if(count2 <0){
				swal({ 
					  title: "", 
					  text: "数量为正整数", 
					  type:"success",
					  timer: 1500, 
					  showConfirmButton: false 
					});
			}else{		
			swal({ 
				  title: "确定删除吗？", 
				  text: "删除后将无法恢复！", 
				  type: "warning",
				  showCancelButton: true, 
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "确定删除！", 
				  closeOnConfirm: false
				},
				function(){
					$("#updateodds").submit();
				  swal("删除！", "删除成功", "success"); 
				});
			
		}
		}
		else
		{
	    	swal({ 
				  title: "", 
				  text: "删除数量不能超过拥有数量", 
				  type:"success",
				  timer: 1500, 
				  showConfirmButton: false 
				});
		}
	}else if(is_zzs=1){
		swal({ 
			  title: "", 
			  text: "数量为正整数", 
			  type:"success",
			  timer: 1500, 
			  showConfirmButton: false 
			});
	}	
}

function deleteGiftBox(id,count,uid,type)
{
	$("input[name=id]").val(id);
	$("input[name=gift_count]").val(count);
	$("input[name=uid]").val(uid);
	$("input[name=type]").val(type);
	$("#update-modal-form").modal();
}




$(function(){
	$("#remark").blur(
		function() {
			var remark= $("#remark").val();			
			$.ajax( {  
			     url:'${BASE_PATH}/userinfo/saveremark',
			     data:{'remark':remark,'id':${tuser.id} }, 
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
	
	$("#uservip").validate({
		submitHandler : function() {
			ajaxSubmit($("#uservip"),
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
	
	
	$(".orderTab li").click(function() {
		window.location.href = '/userinfo/detail?id=${tuser.id}&type='+ $(this).attr("data-ref");});
	$(".showRemar").click(function () {
		$("#remark").removeClass("hide");
	});	

    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
	$("input[name=select]").click(function(){
		window.location.href = '/userinfo/detail?id=${tuser.id}&type=${type}&select='+$(this).val();
	});

});	

function cancelVIP(id){
	 $.ajax({
		 type:"POST",
		 url:"${BASE_PATH}/userinfo/canceluservip",
		 data:{id:id},
		 success:function(){
			 window.location.reload(true);
		 }
	 });
}

function updateUserIsBlocked(id, is_blocked)
{
	swal({
		title : "",
		text : "确定要"+(is_blocked==1?"封号":"取消封号"),
		type : "warning",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "确定",
		cancelButtonText : "取消",
		closeOnConfirm : true,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			$.ajax({type: "POST",url:"${BASE_PATH}/userinfo/updateisblocked",data:{id:id,is_blocked:is_blocked},success:function(){
					window.location.reload(true);	
			}});

		}
	});
}

function setUserVIP(){
	$('#vipchoice-modal-form').modal('show');
}

singleImage("#fileInput", "peipei", "#image", "input[name=head]", "singleDiv");


</script>