<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
    function search(obj){
    	var searchText = $(".header-right .content-wrap>input[type='text']").val();
    	if(!searchText)return false;
    	
        window.location.href="${pageContext.request.contextPath}/page_articles.action?searchText="+searchText;
    };
</script>
<div class="header">
    <div class="container">
        <div class="header-left">
            <h1 class="hide">${companyInfo.webName}</h1>
            <img src="${pageContext.request.contextPath}/upload/${companyInfo.webLogo}" title="${companyInfo.webName}" />
        </div>
        <div class="header-right">
            <div class="content-wrap">
                <input type="text" class="search" placeholder="请输入搜索内容" />
                <span onclick="search(this)"><i class="fa fa-search"></i></span>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="nav-wrap">
    <div class="nav">
        <ul>
        	<li><s:a action="page_index" cssClass="active">首页</s:a></li>
           	<s:iterator value="#categoryList">
	           	<c:choose>
					<c:when test="${name=='教学视频'}">
						<li _id="${id}"><s:a action="page_video?id=%{id}">${name}</s:a></li>
					</c:when>
					<c:when test="${name=='联系我们'}">
					 	<li _id="${id}"><s:a action="page_contactus?id=%{id}">${name}</s:a></li>
					</c:when>
					<c:otherwise>
						<li _id="${id}"><s:a action="page_articles?id=%{id}">${name}</s:a></li>
					</c:otherwise>
				</c:choose>
	    	</s:iterator>
        </ul>
    </div>
</div>