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
		var url=window.location.href;
		var id = url.match(/\d+$/g);
		if(id){
			$(".nav-wrap .nav ul li").each(function(){
				if($(this).attr("_id")==id){
					$(this).siblings().find("a").removeClass("active");
					$(this).find("a").addClass("active");
					return false;
				}
			});
		}
		//过滤html标签
		$(".article-list .row-text").each(function(){
			$(this).html(removeHTMLTag($(this).html()));
		});
		document.title = $(".header .header-left>h1.hide").text();
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
            <h2>${category.name }</h2>
            <div class="position">
                您现在的位置：<s:a action="page_index">首页</s:a>  >   ${category.name }
            </div>
            <div class="clearfix"></div>
        </div>
        <ul class="article-list">
        	<s:iterator value="recordList">
        		<li>
	                <div class="row-title">
	                    <i class="fa fa-angle-double-right"></i><s:a action="page_article?id=%{id}">${title}</s:a><span>${createDate}</span>
	                </div>
	                <div class="row-text">
	                <c:choose>
		           		<c:when test="${fn:length(content) > 100}">  
					        <c:out value="${fn:substring(content, 0, 100)}......" />  
					    </c:when>  
					    <c:otherwise>  
					      	<c:out value="${content}" />  
					    </c:otherwise>  
				    </c:choose>
	                </div>
	            </li>
        	</s:iterator>
        </ul>
        <div class="pager">
			<!--分页信息-->
    		<%@ include file="/WEB-INF/common/pageView.jspf" %>
		</div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- footer -->
<s:action name="page_footer" executeResult="true" ></s:action>
<s:form action="page_articles?id=%{#category.id}" id="listForm">
	<s:hidden name="pageNum" value="1"></s:hidden>
</s:form>
</body>
<script type="text/javascript">
	function gotoPage(pageNum){
		var listForm=document.getElementById('listForm');
		listForm.pageNum.value=pageNum;
		listForm.submit();
	}
</script>
</html>