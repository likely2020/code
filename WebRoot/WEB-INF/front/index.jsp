<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<%@ include file="/WEB-INF/front/common.jspf"  %>
<link href="${pageContext.request.contextPath}/front/plugin/slider/slider.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/front/plugin/slider/slider.js" type="application/javascript" charset="UTF-8"></script>
<script type="text/javascript">
    window.onload=function(){
        moveStart(document.getElementById('banner'),1080);
    }
    function search(obj){
        window.location.href="articles.html";
    }
</script>
</head>
<body>
<!-- header -->
<s:action name="page_header" executeResult="true" ></s:action>
<div class="figure">
    <div id="banner">
        <ul>
            <li><img src="${pageContext.request.contextPath}/front/images/1.jpg" alt="第1张图片"  /></li>
            <li><img src="${pageContext.request.contextPath}/front/images/2.jpg" alt="第2张图片"  /></li>
            <li><img src="${pageContext.request.contextPath}/front/images/3.jpg" alt="第3张图片"  /></li>
            <li><img src="${pageContext.request.contextPath}/front/images/4.jpg" alt="第4张图片"  /></li>
        </ul>
        <ol>
            <li>●</li>
            <li>●</li>
            <li>●</li>
            <li>●</li>
        </ol>
        <span></span>
        <!--strong></strong-->
    </div>
</div>
<div class="article">
    <div class="left">
        <h2>公司新闻</h2>
        <ul>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">财务管理与业务模块在ERP中的集成性研究</a></li>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">采用精益生产模式，提高企业生产效率</a></li>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">财务管理与业务模块在ERP中的集成性研究</a></li>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">采用精益生产模式，提高企业生产效率</a></li>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">财务管理与业务模块在ERP中的集成性研究</a></li>
        </ul>
    </div>
    <div class="left">
        <h2>成功案例</h2>
        <ul>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">财务管理与业务模块在ERP中的集成性研究</a></li>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">采用精益生产模式，提高企业生产效率</a></li>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">财务管理与业务模块在ERP中的集成性研究</a></li>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">采用精益生产模式，提高企业生产效率</a></li>
            <li><i class="fa fa-arrow-circle-right"></i><a href="#">财务管理与业务模块在ERP中的集成性研究</a></li>
        </ul>
    </div>
    <div class="right">
        <h2>解决方案</h2>
        <p><img src="${pageContext.request.contextPath}/front/images/index-1.png" /></p>
        <div class="contact-us"><a href="#">联系我们</a></div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- footer -->
<s:action name="page_footer" executeResult="true" ></s:action>
</body>
</html>