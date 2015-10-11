<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Articles</title>
<%@ include file="/WEB-INF/front/common.jspf"  %>
<link href="${pageContext.request.contextPath}/front/css/article.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	$(function(){
		var id = $(".article-info .title>h2").attr("_id");
		if(id){
			$(".nav-wrap .nav ul li").each(function(){
				if($(this).attr("_id")==id){
					$(this).siblings().find("a").removeClass("active");
					$(this).find("a").addClass("active");
					return false;
				}
			});
		}
	});
</script>
</head>
<body style="padding:0">
<!-- header -->
<s:action name="page_header" executeResult="true" ></s:action>
<div class="top-figure">
    <img src="${pageContext.request.contextPath}/upload/${category.img}" />
</div>
<div class="article-content">
    <!-- header -->
	<s:action name="page_leftNav" executeResult="true" ></s:action>
    <div class="article-info">
        <div class="title">
            <h2 _id="${category.id}">${category.name }</h2>
            <div class="position">
                您现在的位置：<s:a action="page_index">首页</s:a>  >   ${category.name }
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="detail">
        	<!-- 
            <div class="article-title">
                <h3>${article.title}</h3>
                <p><span class="date">日期：</span><span>${article.createDate}</span></p>
            </div>
             -->
            <div class="article-text">
                ${article.content}
            </div>
            <div class="article-img">
            	<s:iterator value="#article.articleImages">
            		<img src="${pageContext.request.contextPath}/upload/${imgPath}" />
            	</s:iterator>
            </div> 
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- footer -->
<s:action name="page_footer" executeResult="true" ></s:action>
</body>
</html>