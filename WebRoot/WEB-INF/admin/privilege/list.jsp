<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
<%@ include file="/WEB-INF/admin/common.jspf"  %>
</head>
<body class="children-body">
<div class="page-title bold" >
	权限管理
</div>
<div class="df-table-toolbar">
	<span><s:a action="privilege_addUI?parentId=%{parentId}">添加</s:a></span><span><s:a action="privilege_list?parentId=%{#parent.parent.id}">返回上一级</s:a></span>
</div>
<table class="df-table" border="1" >
    <thead>
    	<tr>
	    	<th width="20%">权限名称</th>
	    	<th width="20%">所属权限</th>
	    	<th width="25%">Url</th>
		    <th width="10%">排序</th>
		    <th width="25%">操作</th>
    	</tr>
    </thead>
    <tbody>
    	<s:iterator value="#privilegeList">
    		<tr>
    		<td><s:a action="privilege_list?parentId=%{id}" cssClass="underline">${name}</s:a></td>
    		<td>${parent.name}</td>
		    <td>${url}</td>
		    <td class="order">${order_}</td>
		    <td class="operate"><s:a action="privilege_delete?id=%{id}&parentId=%{parent.id}" onClick="return isSure(this,'确定要删除吗？（该操作将级联删除下属子权限）')" >删除</s:a><s:a action="privilege_editUI?id=%{id}">修改</s:a></td>
    	</tr>
    	</s:iterator>
    </tbody>
</table>

<script>
	table_init();
</script>
</body>
</html>