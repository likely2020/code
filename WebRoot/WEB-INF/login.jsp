<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<%@ include file="/WEB-INF/admin/common.jspf"  %>
<link href="${pageContext.request.contextPath}/style/plugin/login/login.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/style/plugin/login/login.js" type="application/javascript" charset="UTF-8"></script>
<script type="text/javascript">
window.onload=function(){
	openLogin();
}
function toLogin(){
	var login=loginInfo();
	$.post("${pageContext.request.contextPath}/user_toLogin.action",{userName:login.userName,passWord:login.passWord},function(data){
		if(data.match(/success/g)){
			layer.msg('登录成功',{icon: 6});
			window.location.href="${pageContext.request.contextPath}/home_index.action";
		}else{
			layer.msg('用户名或密码错误',{icon: 7});
		}
	})
}

function toRegister(){
	layer.msg('请到管理后台添加用户',{icon: 7});
}
</script>
</head>
<body>

</body>
</html>