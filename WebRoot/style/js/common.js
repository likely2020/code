
//询问	<s:a action="role_delete?id=%{id}" onClick="return isSure(this,'确定要删除吗？')" >删除</s:a>
function isSure(obj,msg){
	layer.confirm(msg, {
	    btn: ['确定','取消'], //按钮
	    shade: [0.6,'#999']	//, //不显示遮罩
	    //offset:3
	}, function(){
		//确定
		window.location.href=obj.getAttribute('href');
	}, function(){
		//取消
	    
	});
	return false;
}

//必须输入数字	onkeyup="mustNumber(this)" 
function mustNumber(obj){
	var obj_value=obj.value;
	
	obj_value=obj_value.replace(/\D+/g,'');
	obj.value=obj_value;
}

//验证失败加上红色边框
function validate_failure(obj){
	$(obj).unbind('change');
	$(obj).change(function(){
		var obj_value=$(this).val();
		obj_value=obj_value.replace(/\s+/g,'');
		if(obj_value==''){
			$(this).css("border","1px solid red");
		}else{
			$(this).css("border","1px solid #ace4fd");
		}
	});
}

//<s:textfield type="text" cssClass="dfinput require" name="name" />
function input_validate(id){
	var flag=true;
	var form = $("#"+id);
	
	$(form).find(".required").each(function(){
		var this_value=$(this).val();
		this_value=this_value.replace(/\s+/g,'');
		if(this_value==''){
			flag=false;
			$(this).focus();
			$(this).css("border","1px solid red");
			validate_failure(this);
			return false;
		}
	});
	return flag;
}

//提交表单
function formSubmit(id){
	//表单非空验证
	if(!input_validate(id)){
		return false;
	}
	
	document.getElementById(id).submit();
}
//清除上传图片返回数据中的冗余
function clearPre(obj){
	obj = obj.replace("<PRE>", ''); 
	obj = obj.replace("</PRE>", '');
	obj = obj.replace("<pre>", '');
	obj = obj.replace("</pre>", ''); 
	
	return obj;
}