<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻类目</title>
<%@ include file="/WEB-INF/admin/common.jspf"  %>
<link href="${pageContext.request.contextPath}/style/css/page.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="form">
    <div class="form-title">
        	<i class="fa fa-list"></i>视频类目
    </div>
	<s:form id="form1" action="videoCategory_%{ id == null ? 'add' : 'edit' }" autocomplete="off">
		<s:hidden name="id"></s:hidden>
	    <div class="form-item">
	        <label>类目名称：</label><s:textfield type="text" cssClass="long required" name="name" /><i class="red">*</i>
	    </div>
	    <div class="form-item">
	        <label>排序：</label><s:textfield type="number" cssClass="short" name="position" onkeyup="mustNumber(this)" />
	    </div>
	    
	    <div class="form-toolbar">
	        <a href="javascript:void(0)" onclick="formSubmit('form1')">保存</a><s:a action="videoCategory_list">取消</s:a>
	    </div>
    </s:form>
</div>
</body>
</html>