package cn.code.util;

import java.util.Collection;

import cn.code.domain.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class CheckPrivileteInterceptor extends AbstractInterceptor {

	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// 获取信息
		User user = (User) ActionContext.getContext().getSession().get("user"); // 当前登录用户
		String namespace = invocation.getProxy().getNamespace();
		String actionName = invocation.getProxy().getActionName();
		String privUrl = namespace + actionName;
		Collection<String> allPrivileges = (Collection<String>) ActionContext
		    .getContext().getApplication().get("allPrivilegeUrls");
		if (!allPrivileges.contains(privUrl)) {
			return invocation.invoke();
		} else {
			// 如果未登录
			if (user == null) {
				return "loginUI";
			} else {
				return invocation.invoke();
			}
		}
	}
}
