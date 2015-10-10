<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<div class="footer">
    <div class="friends-link">
        <ul>
        	<s:iterator value="#friendList">
       			<li><a href="${url}" target="_blank" >${name}</a></li>
	    	</s:iterator>
        </ul>
    </div>
    <div class="copyright">
        <p class="row">版权信息</p>
        <p class="row">公司地址：${webSettings.address } ${webSettings.copyRight} </p>
    </div>
</div>