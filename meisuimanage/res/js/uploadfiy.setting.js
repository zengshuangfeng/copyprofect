function singleImage(id, folder, image, imageHidden, queueID, filename)
{
	if(typeof(image) == "undefined")
		image = "#image";
	if(typeof(imageHidden) == "undefined")
		imageHidden = "#imageHidden";
	if(typeof(queueID) == "undefined")
		queueID = "singleDiv";
	if(typeof(filename) == "undefined")
		filename = "";
	$(id).uploadify({
		'uploader' : '/common/upload',
		'formData' : {'folder' : folder},
		'queueID' : queueID,
		'fileSizeLimit' : 10240,
		'overrideEvents': ['onSelectError'],
		'onSelectError':function(file, errorCode, errorMsg){
	    	switch(errorCode) {
	        case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
	        	this.queueData.errorMsg = "图片大小不能超过10M";
	          break;
	    	}
	    	return false;
		},
		'onUploadStart': function (file) {    
			if(filename!='')
			{
				if($(filename).val()=='')
				{
					$(id).uploadify('stop');
					$(filename).after("<label id=\""+filename+"-error\" class=\"error\" for=\""+filename+"\">请先上传视频</label>");
				}
				else
				{
					$(filename).next(".error").remove();
				}
				$(id).uploadify("settings", "uploader", '/common/upload?f='+$(filename).val());
			}     
        },
		'onUploadSuccess' : function(file, data, response) {
			 var data = eval('(' + data + ')')
			 $(imageHidden).val(data.nname);
			 if(data.src.indexOf("webp")>0)
				 $(image).attr("src", data.src);
			 else
				 $(image).attr("src", data.src+"?imageView2/2/w/200");
			 $(image).css("margin-top","10px");
			 $(image).show();
			 $(image).removeClass("hide");
		}
	});
}
function singleVideo(id, folder, image, imageHidden, queueID, filename)
{
	if(typeof(image) == "undefined")
		image = "#image";
	if(typeof(imageHidden) == "undefined")
		imageHidden = "#imageHidden";
	if(typeof(queueID) == "undefined")
		queueID = "singleDiv";
	if(typeof(filename) == "undefined")
		filename = "";
	$(id).uploadify({
		'uploader' : '/common/uploadvideo',
		'formData' : {'folder' : folder},
		'queueID' : queueID,
		'fileSizeLimit' : 15360,
		'overrideEvents': ['onSelectError'],
		'buttonText': '点击选择视频',
		'onSelectError':function(file, errorCode, errorMsg){
			switch(errorCode) {
	        	case -110:
	        		this.queueData.errorMsg = "视频大小不能超过15M";
	        	break;
			}
			return false;
		},
		'onUploadStart': function (file) {    
			if(filename!='')
			{
				if($(filename).val()=='')
				{
					$(id).uploadify('stop');
					$(filename).after("<label id=\""+filename+"-error\" class=\"error\" for=\""+filename+"\">请先上传视频</label>");
				}
				else
				{
					$(filename).next(".error").remove();
				}
				$(id).uploadify("settings", "uploader", '/common/uploadvideo?f='+$(filename).val());
			}     
        },
		'onUploadSuccess' : function(file, data, response) {
			 var data = eval('(' + data + ')')
			 $(imageHidden).val(data.nname);
			 $(image).text("上传完成！");
		}
	});
}
function multipleImage(id, folder, name, control, queueID)
{
	 
	if(typeof(control) == "undefined")
		control = "#picControl";
	if(typeof(queueID) == "undefined")
		queueID = "queueDiv";
	$(id).uploadify({
		'uploader' : '/common/upload',
		'formData' : {'folder' : folder},
		'queueID' : queueID,
		'fileSizeLimit' : 1024,
		'overrideEvents': ['onSelectError'],
		'onSelectError':function(file, errorCode, errorMsg){
			switch(errorCode) {
	        	case -110:
	        		this.queueData.errorMsg = "图片大小不能超过1M";
	        	break;
			}
			return false;
		},
		'onUploadSuccess' : function(file, data, response) {
			var data = eval('(' + data + ')')
			$(name).val($(name).val() + "," + data.nname);
			$(control).append("<img "+(typeof(data.size)=="undefined"?"":"size=\"" +data.size+ "\"")+" data=\"" + data.nname + "\" src=\"" + data.src + "\" class=\"fl wh200-150 mr10 mt10\" /><i class=\"fl remove mtr2-18\"></i>");
			$(name).siblings(".error").remove();
		}
	});
	$(document).on("click",control+" i",function(){
		removeImg(this, name);
	});
	new Sortable(picControl, {
		group: "photo",
		draggable:"img",
		onStart:function(evt){$(evt.item).siblings("i").remove();},
		onEnd: function(evt){ 
			$(control+" img").after("<i class=\"fl remove mtr2-18\"></i>");
			$(name).val("");
			$(control+" img").each(function(index){
				$(name).val($(name).val()+(index==0?"":",")+$(this).attr("data"));
			});
		}
	});
}
function removeImg(target, input)
{
	$(target).prev("img").remove();
	$(input).val("");
	$(target).siblings("img").each(function(i){
		$(input).val((i == 0 ? "" : $(input).val() + ",") + $(this).attr("data"));
	});
	$(target).remove();
}