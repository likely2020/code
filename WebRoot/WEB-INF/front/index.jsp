<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
</script>
</head>
<body style="padding:0">
<!-- header -->
<s:action name="page_header" executeResult="true" ></s:action>
<div class="figure">
    <div id="banner">
        <ul>
            <li><img src="${pageContext.request.contextPath}/front/images/1.jpg"   /></li>
            <li><img src="${pageContext.request.contextPath}/front/images/2.jpg"   /></li>
            <li><img src="${pageContext.request.contextPath}/front/images/3.jpg"   /></li>
            <li><img src="${pageContext.request.contextPath}/front/images/4.jpg"   /></li>
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
        	<s:iterator value="#companyArticleList">
           		<li><i class="fa fa-arrow-circle-right"></i><s:a action="page_article?id=%{id}">
           			<c:choose>
		           		<c:when test="${fn:length(title) > 24}">  
					        <c:out value="${fn:substring(title, 0, 24)}......" />  
					    </c:when>  
					    <c:otherwise>  
					      	<c:out value="${title}" />  
					    </c:otherwise>  
				    </c:choose>
           		</s:a></li>
	    	</s:iterator>
        </ul>
    </div>
    <div class="left">
        <h2>成功案例</h2>
        <ul>
            <s:iterator value="#casusArticleList">
           		<li><i class="fa fa-arrow-circle-right"></i><s:a action="page_article?id=%{id}">
           			<c:choose>
		           		<c:when test="${fn:length(title) > 24}">  
					        <c:out value="${fn:substring(title, 0, 24)}......" />  
					    </c:when>  
					    <c:otherwise>  
					      	<c:out value="${title}" />  
					    </c:otherwise>  
				    </c:choose>
           		</s:a></li>
	    	</s:iterator>
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
<script type="text/javascript">
$(function(){
    $(".nav-wrap .nav ul li").each(function(){
		if($(this).find("a").text()=="联系我们"){
			$(".article .right div.contact-us a").attr("href",$(this).find("a").attr("href"));
			return false;
		}
	});
});
</script>
</html>