<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<div class="header">
    <div class="container">
        <div class="header-left">
            <h1 class="hide">Company Name</h1>
            <img src="images/logo.png" title="Company Name" />
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
           		<li><s:a action="%{url}">${name}</s:a></li>
	    	</s:iterator>
        </ul>
    </div>
</div>