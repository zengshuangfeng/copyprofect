<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link
	href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>礼物编辑</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>钻石充值管理</a></li>
					<li><strong><a href="${BASE_PATH}/userinfo/list">用户列表</a></strong>
					</li>
					<li class="active"><strong><a>编辑</a></strong></li>
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
									<fieldset class="form-horizontal">
										<form id="tab" action="${BASE_PATH}/userinfo/savediamonds"
											method="post">
											<input type="hidden" name="id" value="${id}">
											<div class="form-group">
												<label class="col-sm-2 control-label">充值钻石数：</label>
												<div class="col-sm-5">
													<input type="text" name="diamondscount"
														class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">充值备注：</label>
												<div class="col-sm-5">
													<input type="text" name="diamondsremark"
														class="form-control">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label">支付类型：</label>
												<div class="col-sm-10">
													<div class="i-checks">
														<label><input type="radio" checked="checked"
															value="zftype1" name="diamondsa"> <i></i> 用户充值 </label>
													</div>
													<div class="i-checks">
														<label> <input type="radio" value="zftype2"
															name="diamondsa"> <i></i>家族充值
														</label>
													</div>
													<div class="i-checks">
														<label> <input type="radio" value="zftype3"
															name="diamondsa"> <i></i>奖励充值
														</label>
													</div>

												</div>

											</div>
											<div class="form-group" id="zhifu-form">
												<label class="col-sm-2 control-label">支付方式：</label>
												<div class="col-sm-5">
													<div class="i-checks">
														<label> <input type="radio" value="zhifu1"
															name="diamondsb"> <i></i> 支付宝
														</label> <label> <input type="radio" checked="checked"
															value="zhifu2" name="diamondsb"> <i></i>微信
														</label>

													</div>
												</div>
											</div>
											<div class="form-group" style="display: none;"
												id="jiazu-form">
												<label class="col-sm-2 control-label">家族：</label>
												<div class="col-sm-5">
													<select class="form-control m-b" name="familyselect">
														<option value="0">无</option>
														<c:forEach items="${familyList}" var="family">
															<option value="${family.id}">${family.name}</option>
														</c:forEach>

													</select>
												</div>

											</div>


											<div class="form-group">
												<div class="col-sm-4 col-sm-offset-2">
													<button class="ladda-button btn btn-info"
														data-style="slide-up">
														<i class="fa fa-check"></i>&nbsp;保存
													</button>
												</div>
											</div>
										</form>
									</fieldset>
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
<link rel="stylesheet" href="${ctx}/css/uploadify.css">

<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>

<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">
var result=${result};
if(result>0)
	{
	  swal({
          title: "",
          text: "保存成功",
          type: "success"
      }, function () {
         location.href="${BASE_PATH}/userinfo/list";
      });
	}
	$(document).ready(function() {
		
		$("#tab").validate({
			rules: {
				diamondscount: {required:true,number:true}
				 
			},
			messages: {
				diamondscount: {required:"必须输入钻石数",number:"请输入合法的数字"}
				 
			} 
		});
	 
		
		
		$('.i-checks').iCheck({
			checkboxClass : 'icheckbox_square-green',
			radioClass : 'iradio_square-green',
		});
		$("input").on('ifChecked', function(event) {

			if (event.target.defaultValue == "zftype1") {
				$("#zhifu-form").css('display', 'block');
				$("#jiazu-form").css('display', 'none');
			}
			if (event.target.defaultValue == "zftype2") {
				$("#jiazu-form").css('display', 'block');
				$("#zhifu-form").css('display', 'none');
			}
			if (event.target.defaultValue == "zftype3") {
				$("#jiazu-form").css('display', 'none');
				$("#zhifu-form").css('display', 'none');
			}
		});

	});
</script>

