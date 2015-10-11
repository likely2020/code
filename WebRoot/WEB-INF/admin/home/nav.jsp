<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="nav-bar">
    <h6>导航菜单<i class="fa fa-angle-double-down"></i></h6>
    <dl>
        <dt><i class="fa fa-th"></i>基础设置</dt>
        <dd><i class="fa fa-list"></i><a href="${pageContext.request.contextPath}/user_list.action" target="pageContent">用户管理</a></dd>
        <dd><i class="fa fa-list"></i><a href="${pageContext.request.contextPath}/webSettings_editUI.action" target="pageContent">网站设置</a></dd>
    </dl>
    <dl>
        <dt><i class="fa fa-th"></i>内容管理</dt>
        <dd><i class="fa fa-sellsy"></i><a href="${pageContext.request.contextPath}/category_list.action" target="pageContent">新闻类目</a></dd>
        <dd><i class="fa fa-list"></i><a href="${pageContext.request.contextPath}/article_list.action" target="pageContent">新闻管理</a></dd>
        <dd><i class="fa fa-square"></i><a href="${pageContext.request.contextPath}/videoCategory_list.action" target="pageContent">视频类目</a></dd>
        <dd><i class="fa fa-video-camera"></i><a href="${pageContext.request.contextPath}/video_list.action" target="pageContent">视频管理</a></dd>
    </dl>
    <dl>
        <dt><i class="fa fa-th"></i>其他</dt>
        <dd><i class="fa fa-sellsy"></i><a href="${pageContext.request.contextPath}/friends_list.action" target="pageContent">友情链接</a></dd>
    </dl>
    <div class="clearfix"></div>
</nav>