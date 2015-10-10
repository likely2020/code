<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站设置</title>
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
        url:'${pageContext.request.contextPath}/upload_webLogo.action',//single
        type: 'post',
        secureuri: false, //
        fileElementId: 'file', 
        dataType: 'application/json', //返回值类型，一般设置为json、application/json
        success: function (data) {
            var obj=clearPre(data);
            obj=eval('('+obj+')');
            if(obj.imgPath){
            	$("img.web-logo").attr("src","upload/"+obj.imgPath);
            	$("input[name='webLogo']").val(obj.imgPath);
            	
            	 var file = $("#file");
           	    file.after(file.clone().val(""));
           	    file.remove();
            }
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
        	<i class="fa fa-list"></i>网站设置
    </div>
	<s:form id="form1" action="webSettings_edit" autocomplete="off">
		<s:hidden name="id"></s:hidden>
	    <div class="form-item">
	        <label>网站名称：</label><s:textfield type="text" cssClass="long required" name="webName" /><i class="red">*</i>
	    </div>
	    <div class="form-item">
	        <label>公司地址：</label><s:textfield type="text" cssClass="long" name="address" />
	    </div>
	    <div class="form-item">
	        <label>版权信息：</label><s:textfield type="text" cssClass="long" name="copyRight" />
	    </div>
	    <div class="form-images">
        	<label>网站LOGO：</label>
        	<s:if test="%{webLogo!=null&&webLogo!=''}">
        		<img class="web-logo" src="${pageContext.request.contextPath}/upload/${webLogo}" onclick="clickUpload()" />
        	</s:if>
        	<s:else>
            	<img class="web-logo" src="${pageContext.request.contextPath}/style/images/add.png" onclick="clickUpload()" />
        	</s:else>
        	
        	<s:hidden name="webLogo"></s:hidden>
        	
        	<!-- 隐藏的控件主图 -->
       		<input type="file" class="hide" onchange="Upload()" name="file" id="file" accept="image/*"  value=""  />

    	</div>
	    <div class="form-toolbar">
	        <a href="javascript:void(0)" onclick="formSubmit('form1')">保存</a><a href="javascript:void(0)">取消</a>
	    </div>
    </s:form>
</div>
</body>
</html>