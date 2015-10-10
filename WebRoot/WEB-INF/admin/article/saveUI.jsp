<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻</title>
<%@ include file="/WEB-INF/admin/common.jspf"  %>
<link href="${pageContext.request.contextPath}/style/css/page.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/style/plugin/ajaxUpload/ajaxfileupload.js" type="application/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/style/plugin/ckeditor/ckeditor.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
function clickUpload(){
	document.getElementById('file').click();
}
//上传图片
function Upload() {
    $.ajaxFileUpload({
        url:'${pageContext.request.contextPath}/upload_articleImg.action',//single
        type: 'post',
        secureuri: false, //
        fileElementId: 'file', 
        dataType: 'application/json', //返回值类型，一般设置为json、application/json
        success: function (data) {
            var obj=clearPre(data);
            obj=eval('('+obj+')');
            if(obj.id>0){
            	var txt="";
            	txt+="<li>";
            	txt+="<img src='${pageContext.request.contextPath}/upload/"+obj.imgPath+"' >";
           		txt+="<a href='javascript:void(0)' onclick='deleteImages(this)'><i class='fa fa-remove'></i></a>";
       			txt+="<input type='text' name='imageId' class='hide' value="+obj.id+" />";
  				txt+="</li>";
            	$(".images-list ul").append(txt);
            	
            	window.parent.reinitIframe();
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
	<s:form id="form1" action="article_%{ id == null ? 'add' : 'edit' }" autocomplete="off" method="post">
		<s:hidden name="id"></s:hidden>
		<div class="form-item select">
	        <label>新闻类目：</label>
        	<s:select name="category_id" list="#categoryList" listKey="id" listValue="name" value="%{category.id}"
      				 cssClass="required" headerValue="请选择类别"></s:select><i class="red">*</i>
	    </div>
	    <div class="form-item">
	        <label>标题：</label><s:textfield type="text" cssClass="long required" name="title" /><i class="red">*</i>
	    </div>
	    
	    <div class="form-item textArea">
	        <label>新闻内容：</label>
	        <div class="ck">
	        	<s:textarea id="TextArea1" name="content" cols="16" rows="2" cssClass="ckeditor"></s:textarea>
	        	<script type="text/javascript">
					CKEDITOR.replace('TextArea1');
				</script>
			</div>
	    </div>
	    <div class="images-list">
	    	<ul>
				<s:iterator value="articleImages">
					<li>
		            	<img src='${pageContext.request.contextPath}/upload/${imgPath}' >
		           		<a href='javascript:void(0)' onclick='deleteImages(this)'><i class='fa fa-remove'></i></a>
		       			<input type='text' name='imageId' class='hide' value="${id}" />
	  				</li>
				</s:iterator>
	        </ul>
	    </div>

	    <div class="form-toolbar">
	        <a href="javascript:void(0)" onclick="formSubmit('form1')">保存</a><s:a action="article_list">取消</s:a><a href="javascript:void(0)" onclick="clickUpload()">上传图片</a>
	    </div>
    </s:form>
    <!-- 隐藏的上传控件 -->
	<input type="file" class="hide" onchange="Upload()" name="file" id="file" accept="image/*"  value=""  />
</div>
</body>
</html>