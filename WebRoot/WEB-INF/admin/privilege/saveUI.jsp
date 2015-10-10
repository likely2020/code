<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存</title>
<%@ include file="/WEB-INF/admin/common.jspf"  %>
</head>
<body class="children-body">
<div class="page-title bold" >
	权限管理
</div>
	<s:form id="form1" action="privilege_%{ id == null ? 'add' : 'edit' }">
		<s:hidden name="id"></s:hidden>
		<div class="form-item">
            <span class="lbl">所属权限：</span>
            <span class="dfselect">
            	<s:select name="parentId" list="#privilegeList" listKey="id" listValue="name" 
            				headerKey="0" headerValue="请选择权限"></s:select>
            </span>
        </div>
        <div class="form-item">
            <span class="lbl">权限名称：</span>
            <span class="input"><s:textfield type="text" cssClass="dfinput required" name="name" /><i class="red">*</i></span>
        </div>
        <div class="form-item">
            <span class="lbl">Url：</span>
            <span class="input"><s:textfield type="text" cssClass="dfinput required" name="url" /><i class="red">*</i></span>
        </div>
        <div class="form-item">
            <span class="lbl">排序：</span>
            <span class="input"><s:textfield type="text" cssClass="dfinput" name="order_" onkeyup="mustNumber(this)" /></span>
        </div>
    </s:form>
    <div class="page-btn">
    		<span><a href="javascript:void(0)" onclick="formSubmit('form1')">保存</a></span><span><a href="privilege_list.action?parentId=${parentId}">返回</div></span>
    </div>
</body>
</html>