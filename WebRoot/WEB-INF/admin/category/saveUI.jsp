<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻类目</title>
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
        url:'${pageContext.request.contextPath}/upload_categoryImg.action?id=${id}',//single
        type: 'post',
        secureuri: false, //
        fileElementId: 'file', 
        dataType: 'application/json', //返回值类型，一般设置为json、application/json
        success: function (data) {
            var obj=clearPre(data);
            obj=eval('('+obj+')');
            if(obj.id>0){
            	$("img.category-img").attr("src","upload/"+obj.imgPath);
            	$("input[name='imageId']").val(obj.id);
            }else{
            	$("img.category-img").attr("src","upload/"+obj.imgPath);
            	$("input[name='img']").val(obj.imgPath);
            }
            var file = $("#file");
       	    file.after(file.clone().val(""));
       	    file.remove();
       	    
            return false;
        }
    });
   
    return false;
}
</script>
</head>
<body>
<div class="form">
    <div class="form-title">
        	<i class="fa fa-list"></i>新闻类目
    </div>
	<s:form id="form1" action="category_%{ id == null ? 'add' : 'edit' }" autocomplete="off">
		<s:hidden name="id"></s:hidden>
	    <div class="form-item">
	        <label>类目名称：</label><s:textfield type="text"  readOnly="true" cssClass="long required" name="name" /><i class="red">*</i>
	    </div>
	    <div class="form-item">
	        <label>排序：</label><s:textfield type="number" cssClass="short" name="position" onkeyup="mustNumber(this)" />
	    </div>
	    <div class="form-item table-img">
	        <label>顶部类目图：</label>
	        <s:if test="%{img!=null}">
	        	<img src="${pageContext.request.contextPath}/upload/${img}" onclick="clickUpload()" class="category-img">
	        </s:if>
	        <s:else>
	        	<img src="${pageContext.request.contextPath}/style/images/blank.png" onclick="clickUpload()" class="category-img">
	        </s:else>
	    </div>
	    
	    <s:hidden name="img"></s:hidden>
	    <s:hidden name="imageId"></s:hidden>
		
	    <div class="form-toolbar">
	        <a href="javascript:void(0)" onclick="formSubmit('form1')">保存</a><s:a action="category_list">取消</s:a>
	    </div>
    </s:form>
    <!-- 隐藏的上传控件 -->
	<input type="file" class="hide" onchange="Upload()" name="file" id="file" accept="image/*"  value=""  />
</div>
</body>
</html>