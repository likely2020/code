<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频</title>
<%@ include file="/WEB-INF/admin/common.jspf"  %>
<link href="${pageContext.request.contextPath}/style/css/page.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/style/plugin/ajaxUpload/ajaxfileupload.js" type="application/javascript" charset="UTF-8"></script>
<script type="text/javascript">
function clickUpload(){
	document.getElementById('file').click();
}
//上传图片
function Upload() {
    $.ajaxFileUpload({
        url:'${pageContext.request.contextPath}/upload_videoImg.action?id=${id}',//single
        type: 'post',
        secureuri: false, //
        fileElementId: 'file', 
        dataType: 'application/json', //返回值类型，一般设置为json、application/json
        success: function (data) {
            var obj=clearPre(data);
            obj=eval('('+obj+')');
            if(obj.id>0){
            	$(".video-img").attr("src","upload/"+obj.imgPath);
            	$("input[name='imageId']").val(obj.id);
            }
            var file = $("#file");
       	    file.after(file.clone().val(""));
       	    file.remove();
       	    
            return false;
        }
    });
   
    return false;
}
function deleteImages(obj){
	var id=$(obj).parent().find("input[name='imageId']").val();
	
	$.post("${pageContext.request.contextPath}/upload_deleteArticleImages.action",{id:id},function(data){
		var resObj=eval('('+data+')');
		if(resObj.id>0){
			$(obj).parent().remove();
		}
	});
}
</script>
</head>
<body>
<div class="form">
    <div class="form-title">
       	<i class="fa fa-list"></i>新闻
    </div>
	<s:form id="form1" action="video_%{ id == null ? 'add' : 'edit' }" autocomplete="off" method="post">
		<s:hidden name="id"></s:hidden>
		<div class="form-item select">
	        <label>视频类目：</label>
        	<s:select name="category_id" list="#videoCategoryList" listKey="id" listValue="name" value="%{videoCategory.id}" 
    				 cssClass="required" headerValue="请选择类别"></s:select><i class="red">*</i>
	    </div>
	    <div class="form-item">
	        <label>标题：</label><s:textfield type="text" cssClass="long required" name="title" /><i class="red">*</i>
	    </div>
	    <div class="form-item">
	        <label>优酷Url：</label><s:textfield type="text" cssClass="long" name="youkuUrl" />
	    </div>
	    <div class="form-item">
	        <label>土豆Url：</label><s:textfield type="text" cssClass="long" name="tudouUrl" />
	    </div>
	    
		<div class="form-item">
	        <label>图片：</label>
	        <s:if test="%{img!=null}">
	        	<img src="${pageContext.request.contextPath}/upload/${img}" onclick="clickUpload()" class="video-img">
	        </s:if>
	        <s:else>
	        	<img src="${pageContext.request.contextPath}/style/images/add.png" onclick="clickUpload()" class="video-img">
	        </s:else>
	        <s:hidden name="imageId"></s:hidden>
	    </div>

	    <div class="form-toolbar">
	        <a href="javascript:void(0)" onclick="formSubmit('form1')">保存</a><s:a action="video_list">取消</s:a>
	    </div>
    </s:form>
    <!-- 隐藏的上传控件 -->
	<input type="file" class="hide" onchange="Upload()" name="file" id="file" accept="image/*"  value=""  />
</div>
</body>
</html>