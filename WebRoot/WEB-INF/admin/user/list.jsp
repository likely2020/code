<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<%@ include file="/WEB-INF/admin/common.jspf"  %>
<link href="${pageContext.request.contextPath}/style/css/page.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="info-list">
	<div class="table-responsive">
	  <table class="table">
	    <thead>
	    	<tr>
	    		<th class="hide">id</th>
	    		<th style="width:30%;">用户名</th>
	    		<th style="width:30%;">密码</th>
	    		<th style="width:35%;">操作</th>
	    	</tr>
	    </thead>
	    <tbody>
	    	<s:iterator value="recordList">
	    		<tr>
	    			<td class="hide">${id}</td>
	    			<td>${userName}</td>
	    			<td>********************************</td>
	    			<td class="operate"><s:a action="user_editUI?id=%{id}"><i class="fa fa-edit"></i>编辑</s:a><s:a action="user_delete?id=%{id}" onClick="return isSure(this,'确定要删除吗？')"><i class="fa fa-remove"></i>删除</s:a></td>
	    		</tr>
	    	</s:iterator>
	    </tbody>
	  </table>
	</div>
    <div class="grid-toolbar">
        <s:a action="user_addUI">添加</s:a>
    </div>
</div>

<div class="pager">
	<!--分页信息-->
    <%@ include file="/WEB-INF/common/pageView.jspf" %>
</div>
<s:form action="user_list" id="listForm">
	<s:hidden name="pageNum" value="1"></s:hidden>
</s:form>

<script type="text/javascript">
	function gotoPage(pageNum){
		var listForm=document.getElementById('listForm');
		listForm.pageNum.value=pageNum;
		listForm.submit();
	}
</script>
</body>
</html>