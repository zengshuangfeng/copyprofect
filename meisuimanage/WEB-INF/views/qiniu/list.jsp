<%@ page contentType="text/html;charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="${ctx}/css/plugins/footable/footable.core.css"
	rel="stylesheet">
<style>
.product-box{
	width: 230px;
}
.product-imitation {
	padding:0;
	width: 230px;
    height: 230px;
    background: #000;
}
.live-monitor{
	height: 230px;
}
.product-desc {
	padding: 10px;
}
</style>
<div id="wrapper">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/common/top.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>七牛直播流管理</h2>
				<ol class="breadcrumb">
					<li><a href="javascript:void(0);"
						onclick="window.parent.location.href='/main'">Home</a></li>
					<li><a>监控管理</a></li>
					<li class="active"><strong>七牛直播流管理</strong></li>
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
												<div class="ibox-content" id="square_content">
													<c:forEach items="${keyList}" var="key">
														<div class="col-md-2 square_video">
															<div class="ibox">
																<div class="ibox-content product-box active">
																	<div class="product-imitation" id="${key}" rtmpurl="${rtmpPath}${key}"></div>
																	<div class="product-desc">															
																		<div class="m-t" style="text-align: center;">
																		    <a 
																				onclick="return disableAnchor(${key})"
																				class="btn btn-danger">禁播</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
												<div style="clear:both">
													<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
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
<link rel="stylesheet" href="${ctx}/css/uploadify.css">
<script src="${ctx}/js/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/uploadfiy.setting.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
	function disableAnchor(f_uuid) {
		deleteConfirm(0, "${BASE_PATH}/qiniu/disable", "直播", "禁止", {f_uuid:f_uuid});
	}
	$(".product-imitation").each(function(){
	    var id = $(this).attr('id');
	    var rtmpUrl = $(this).attr('rtmpUrl');
	    createPlayerList(rtmpUrl,id);
	});

	function displayProp(obj){    
	    var names="";       
	    for(var name in obj){       
	       names+=name+": "+obj[name]+", ";  
	    }  
	    alert(names);  
	} 
	function createPlayerList(rtmpUrl,id){
	    console.log(rtmpUrl)
	    console.log(id)
	    var flashvars={
	      f:rtmpUrl,
	      c:'0',
	      p:'1'
	    };
	    var params={bgcolor:'#FFF',allowFullScreen:false,allowScriptAccess:'always'};
	    var video=['http://movie.ks.js.cn/flv/other/2014/06/20-2.mp4->video/mp4'];
	    CKobject.embed('${ctx}/ckplayer/ckplayer.swf',id,'ckplayer_a1','100%','100%',false,flashvars,video,params);
	}
	var rtmpPath = '${rtmpPath}';
	$(function(){
		  setInterval(function () {
	    	 window.location.reload();
		  },30000);
	});
</script>