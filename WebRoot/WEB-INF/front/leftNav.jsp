<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

    <div class="category">
        <h2>新闻类别<i class="fa fa-angle-double-down"></i></h2>
        <ul class="article-category-list">
        	<s:iterator value="#categoryList">
       			<li><i class="fa fa-align-justify"></i><s:a action="page_articles?id=%{id}">${name}</s:a></li>
	    	</s:iterator>
        </ul>
    </div>