<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="${ctx}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>奖品添加</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>运营管理</a></li>
					<li><a href="${BASE_PATH}/dial/list">转盘抽奖列表</a>
					</li>
					<li class="active"><strong><a>奖品添加</a></strong></li>
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
										<form id="tab" action="${BASE_PATH}/dial/save"
											method="post">
										<div class="form-group">
												<label class="col-sm-2 control-label">类型：</label>
												<div class="col-sm-5">
													<select name="type" class="form-control" id="type">
														<option value="-1">请选择类型</option>
														<option value="0">礼物</option>
														<option value="1">钻石</option>
														<option value="2">积分</option>														
													</select>
												</div>
											</div>
										<div class="form-group hide" id="giftid">
												<label class="col-sm-2 control-label">礼物选择：</label>
												<div class="col-sm-5">
													<select name="gift_id" class="form-control" id="gift_id">
													<option value="0">请选择礼物</option>
													<c:forEach items="${giftlist}" var="giftlist">
														<option value="${giftlist.id}">${giftlist.gift_name}</option>
													</c:forEach>													
													</select>
												</div>
											</div>								
												<div class="form-group">
												<label class="col-sm-2 control-label">奖品名称：</label>
												<div class="col-sm-5">
													<input type="text" id="prize_name" name="prize_name" class="form-control" readonly="readonly" value="">
												</div>
											</div>	
											
											<div class="form-group hide" id="pic">
												<label class="col-sm-2 control-label">礼物图片：</label>
												<div class="btn-group col-sm-4">
													<div class="fl">
														<input name="upload" id="fileInput" type="file" /><input
															type="hidden" id="imageHidden" name="pic" value=""/>
														<div id="singleDiv"></div>
														<img src="" class="wd200 mt10" id="image" />
													</div>
												</div>
											</div>
											
												<div class="form-group hide" id="giftpic">
												<label class="col-sm-2 control-label">礼物图片：</label>
												<div class="btn-group col-sm-4">
													<div class="fl">
														<input
															type="hidden" id="imageHidden2" name="giftpic" value=""/>
														<div id="singleDiv2"></div>
														<img src="" class="wd200 mt10" id="image2" />
													</div>
												</div>
											</div>
											
												<div class="form-group">
												<label class="col-sm-2 control-label">奖品数量：</label>
												<div class="col-sm-5">
													<input type="text" name="prize_count" class="form-control">
												</div>
											</div>	
											
												<div class="form-group">
												<label class="col-sm-2 control-label">中奖概率：</label>
												<div class="col-sm-5">
													<input type="text" name="probability" class="form-control">
												</div>
											</div>	
											
												<div class="form-group">
												<label class="col-sm-2 control-label">可供抽奖库存数：</label>
												<div class="col-sm-5">
													<input type="text" name="inventory" class="form-control">
												</div>
											</div>	
												<div class="form-group">
												<label class="col-sm-2 control-label">上线时间：</label>
												<div class="col-sm-2">
													<input type="text" class="form-control" placeholder="上线时间"
														name="start_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">下线时间：</label>
												<div class="col-sm-2">
													<input type="text" class="form-control" placeholder="下线时间"
														name="end_time"
														onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
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
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="${ctx}/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	var jumpUrl = "${BASE_PATH}/dial/list"+window.location.search;
	$().ready(function() {
		$("#tab").validate({
			rules: {
				prize_name: {required:true},
				probability: {required:true,range:[0,1]},
				inventory:{required:true,digits:true},
				start_time:{required:true},
				end_time:{required:true},
				prize_count:{required:true,digits:true}
			},
			messages: {
				prize_name: {required:"礼物名称不能为空"},
				probability: {required:"概率值不能为空",range:"概率值在0到1之间"},
				inventory:{required:"库存数不能为空",digits:"库存数为整数"},
				start_time:{required:"上线时间不能为空"},
				end_time:{required:"下线时间不能为空"},
				prize_count:{required:"奖品数量不能为空",digits:"奖品数量为整数"}				
			},
			submitHandler: function(){
		        ajaxSubmit($("#tab"), function(json){
		        	if(json.code == -3)
	        		{
		        		for(var key in json.msg)
	        			{
		        			$("*[name="+json.msg[key].name+"]").addClass("error");
		        			$("*[name="+json.msg[key].name+"]").after("<label id=\""+json.msg[key].name+"-error\" class=\"error\" for=\""+json.msg[key].name+"\">"+json.msg[key].value+"</label>");
	        			}
	        		}
		        	else 
			        	show(json, jumpUrl);
		        });
	        	return false;
	    	}
		});
	});
	$(function(){	
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
		singleImage("#fileInput", "meisui", "#image", "input[name=pic]", "singleDiv");
		
		$("select[name=type]").change(function(){
			var type = $(this).val();
			if(type==0)
			{
				$("#giftid,#giftpic").removeClass("hide");
				$("#pic").addClass("hide");
			}
			else if(type==1)
			{
				$("#pic").removeClass("hide");
				$("#giftid,#giftpic").addClass("hide");
				$("#prize_name").val("钻石");
			}else if(type==2){
				$("#pic").removeClass("hide");
				$("#giftid,#giftpic").addClass("hide");
				$("#prize_name").val("积分");
			}
		});
		
	
		
	});
	
	$("#gift_id").change(function(){
		if($("#gift_id").val() > 0 ){
			$.ajax({
				type:"get",
				dataType:"json",
				data:{
					gift_id:$("#gift_id").val()
				},			
				url:"/dial/giftnameshow",
				success:function(msg){
					if(msg.id !=null){
						
						$("#prize_name").empty();
						$("#prize_name").val(msg.gift_name);
						
						 $("#image2").empty();						
						$("#image2").attr("src",msg.uploadUrl+msg.pic);
						$("#imageHidden2").val(msg.pic);
					}		
				},
				
			});
		}
	}); 
	
	
</script>
   