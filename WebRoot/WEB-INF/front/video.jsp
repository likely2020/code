<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教学视频</title>
<%@ include file="/WEB-INF/front/common.jspf"  %>
<link href="${pageContext.request.contextPath}/front/css/article.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/front/css/video.css" type="text/css" rel="stylesheet" />
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
		var videoCategoryId=${videoCategory.id};
		$(".article-category-list li").each(function(){
			if($(this).attr("_id")==videoCategoryId){
				$(this).siblings().removeClass("active");
				$(this).addClass("active");
				return false;
			}
		});
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
    <div class="category">
        <h2>课程分类<i class="fa fa-angle-double-down"></i></h2>
        <ul class="article-category-list">
        	<s:iterator value="#videoCategoryList">
        		<li _id="${id}"><i class="fa fa-align-justify"></i><s:a action="page_video?id=%{#category.id}&videoCategoryId=%{id}">${name}</s:a></li>
        	</s:iterator>
        </ul>
    </div>
    <div class="article-info">
        <div class="title">
            <h2 _id="${category.id }">${category.name }</h2>
            <div class="position">
                您现在的位置：<s:a action="page_index">首页</s:a>  >   ${category.name }
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="video-list">
        	<s:iterator value="#videoCategory.videos">
        		<div class="video-item">
	                <h5>${title}</h5>
	                <img src="${pageContext.request.contextPath}/upload/${img}" />
	                <div class="btn">
	                    <span class="youku"><s:a href="%{youkuUrl}" target="_blank">优酷</s:a></span><span class="tudou"><s:a href="%{tudouUrl}" target="_blank">土豆</s:a></span>
	                </div>
	            </div>
        	</s:iterator>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- footer -->
<s:action name="page_footer" executeResult="true" ></s:action>
</body>
</html>