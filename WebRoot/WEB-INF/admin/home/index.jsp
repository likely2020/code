<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin</title>
<linkrel="shortcut icon" href="${pageContext.request.contextPath}/style/images/favicon.ico">
<linkrel="Bookmark" href="${pageContext.request.contextPath}/style/images/favicon.ico">
<%@ include file="/WEB-INF/admin/common.jspf"  %>
</head>
<body id="index">
<!-- header -->
<s:action name="home_header" executeResult="true" ></s:action>
<!-- section -->
<section class="main-content">
    <div class="container">
        <div class="row">
            <aside class="col-md-2 main-left">
                <!-- nav -->
				<s:action name="home_nav" executeResult="true" ></s:action>
            </aside>
            <main class="col-md-10 main-right">
                <div class="page-wrapper">
					<!-- page content -->
					<iframe frameborder="no" width="100%" border="0" name="pageContent" id="pageContent" scrolling="no" ></iframe>
                </div>
            </main>
        </div>
    </div>
</section>
</body>
   	<script>
	    $("#pageContent").load(function () {
	    	var parentHeight=$(window).height();
	        $(this).css("min-height",parentHeight-100);

	        var ifm= document.getElementById("pageContent");
	        var subWeb = document.frames ? document.frames["pageContent"].document:ifm.contentDocument;
            if(ifm != null && subWeb != null) {
            	ifm.height = subWeb.body.scrollHeight;
            }
	    });
	    function reinitIframe(){
	    	var iframe = document.getElementById("pageContent");
	    	try{
		    	var bHeight = iframe.contentWindow.document.body.scrollHeight;
		    	var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
		    	var height = Math.max(bHeight, dHeight);
		    	iframe.height = height;
	    	}catch (ex){}
    	}
	    
	    $(function(){
	    	$(".nav-bar dl dd a").click(function(){
	    		$(".nav-bar dl dd").removeClass('active');
	    		$(this).parent().addClass('active');
	    	});
	    });
   	</script>
</html>