function Login(){
    this.oWindow=null;
    this.oMark=null;
    this.settings={//默认参数
        dir:'center',
        mark:true
    };
}
Login.prototype.init=function(opt){
    extend(this.settings,opt);
    this.create();
    this.fnClose();
    if(this.settings.mark){
		this.createMark();
	}
};

Login.prototype.create=function(){
    this.oWindow=document.createElement('div');
    this.oWindow.id='txx-login';
    this.oWindow.innerHTML="<div class='title'>"+
						    "<span>用户登录</span><a href='javascript:void(0)' class='login-close'>×</a>"+
						    "</div>"+
						    "<div class='content'>"+
						    " <dl>"+
						    "<dt>"+
						    "<span>用户名：</span>"+
						    "</dt>"+
						    "<dd>"+
						    "<input type='text' name='login_userName' value='' onblur='isnull(this)' />"+
						    "</dd>"+
						    "</dl>"+
						    "<dl>"+
						    "<dt>"+
						    "<span>密码：</span>"+
						    "</dt>"+
						    "<dd>"+
						    "<input type='password' name='login_passWord' value='' onblur='isnull(this)' />"+
						    "</dd>"+
						    "</dl>"+
						    "</div>"+
						    "<div class='operation'>"+
						    "<a href='javascript:toLogin()' onclick='return loginInfo();' >登录</a><a  href='javascript:void(0)' onclick='toRegister(this)'>注册</a>"+
						    "</div>";

    document.body.appendChild(this.oWindow);
    this.setData();
   
};

Login.prototype.createMark = function(){
	this.oMark = document.createElement('div');
	this.oMark.id = 'txx-login-mark';
	document.body.appendChild(this.oMark);
	this.oMark.style.width = viewWidth() + 'px';
	this.oMark.style.height = viewHeight() + 'px';
};


Login.prototype.setData=function(){
    this.oWindow.style.width=this.settings.w+'px';
    this.oWindow.style.height=this.settings.h+'px';

    if(this.settings.dir=='center'){
		this.oWindow.style.left=(viewWidth()-this.oWindow.offsetWidth)/2+'px';
		this.oWindow.style.top=(viewHeight()-this.oWindow.offsetHeight)/2+'px';
    }
};

Login.prototype.fnClose = function(){
    var aClose = this.oWindow.getElementsByClassName('login-close');
    var This = this;
    for(var i=0;i<aClose.length;i++){
        aClose[i].onclick = function(){
        	if(This.settings.mark){
    			document.body.removeChild(This.oMark);
    		}
            document.body.removeChild(This.oWindow);
        };
    }
};

function viewWidth(){
    return document.documentElement.clientWidth;
}
function viewHeight(){
    return document.documentElement.clientHeight;
}

function extend(obj1,obj2){
    for(var attr in obj2){
        obj1[attr]=obj2[attr];
    }
}
/**
 * 非空验证
 * @param obj
 * @returns {Boolean}
 */
function isnull(obj){
	var this_value=obj.value;
	this_value=this_value.replace(/\s+/g,'');
	if(this_value==""){
		obj.style.borderColor="red";
		obj.focus();
		return false;
	}else{
		obj.style.borderColor="#ace4fd";
		return true;
	}
}

/**
 * 打开登录窗口
 * @param width
 * @param mark
 */
function openLogin(width,mark){
	var dl=new Login();
    dl.init({
        w:width==null?358:width,//弹窗的宽度
        mark:mark==null?true:mark//是否显示遮罩层
    });
}
/**
 * 关闭登录窗口
 */
function closeLogin(){
	var login=document.getElementById('txx-login');
	var mark=document.getElementById('txx-login-mark');
	document.body.removeChild(login);
	document.body.removeChild(mark);
}


function loginInfo(){
	var userName=document.getElementsByName('login_userName')[0];
	var passWord=document.getElementsByName('login_passWord')[0];
	if(!isnull(userName)){return false;}
	if(!isnull(passWord)){return false;}
	
	return {"userName":userName.value,"passWord":passWord.value};
}

