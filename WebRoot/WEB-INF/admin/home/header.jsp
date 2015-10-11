<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="main-header">
    <div class="container">
        <div class="row">
            <div class="col-md-11">
                <h1 class="header-title">${webSettings.webName}</h1>
            </div>
            <div class="col-md-1">
                <div class="login-out">
                	<a href="${pageContext.request.contextPath}/user_loginUI.action">退出</a>
                </div>
            </div>
        </div>
    </div>
</header>
