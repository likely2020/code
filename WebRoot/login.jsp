<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>

    <style type="text/css">
        .login{width:358px;height:238px;border:1px solid #498cd0;position:fixed;}
        .login div.title{background:#498cd0;}
        .login div.title span{line-height:30px;display:inline-block;color:#fff;
            font-size:13px;font-weight:bold;padding:0 0 0 8px;
        }
        .login div.content{padding:30px 10px 10px 10px ;}
        .login div.content dl{color:#498cd0;font-size:0;line-height:23px;height:23px;margin:0 0 18px 0;}
        .login div.content dl dt{width:31%;text-align:right;float:left;font-size:12px;}
        .login div.content dl dd{width:61%;float:left;}
        .login div.content dl dd input{box-sizing: border-box;height:23px;padding:3px 3px;border:1px solid #d5e5f5;width:166px;}
        .login div.operation{height:45px;line-height:45px;text-align:center;}
        .login div.operation a{padding:5px 21px;background:#498cd0;margin:0 5px;font-size:12px;color:#fff;}
    	.disable{text-decoration:line-through;pointer-events:none;}
    </style>
    <script type="text/javascript">
    	if(window.parent!=window){
    		window.parent.location.reload(true);
    	}
    
        window.onload=function(){
            var login=document.getElementsByClassName("login")[0];
            login.style.left=(viewWidth()-login.offsetWidth)/2+'px';
            login.style.top=(viewHeight()-login.offsetHeight)/2+'px';
        }
        function viewWidth(){
            return document.documentElement.clientWidth;
        }
        function viewHeight(){
            return document.documentElement.clientHeight;
        }
        function login(){
        	var userName=$("input[name='userName']").val();
        	var passWord=$("input[name='passWord']").val();
        	$.post("${pageContext.request.contextPath}/user_login.action",{"userName":userName,"passWord":passWord},function(data){
        		if(parseInt(data)==0){
        			MessageBox("用户名或密码错误");
        		}else if(parseInt(data)==1){
        			window.location.href="${pageContext.request.contextPath}/main_index.action";
        		}else if(parseInt(data)==2){
        			MessageBox("用户已被锁定");
        		}
        	})
        }
    </script>
</head>
<body>
<div class="login">
    <div class="title">
        <span>用户登录</span>
    </div>
    <div class="content">
        <dl>
            <dt>
                <span>用户名：</span>
            </dt>
            <dd>
                <input type="text" name="userName" value="txx" />
            </dd>
        </dl>
        <dl>
            <dt>
                <span>密码：</span>
            </dt>
            <dd>
                <input type="password" name="passWord" value="888888" />
            </dd>
        </dl>
    </div>
    <div class="operation">
        <a href="javascript:void(0)" onclick="login()">登录</a><a class="disable" href="javascript:void(0)">注册</a>
    </div>
</div>
</body>
</html>