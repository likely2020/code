package cn.code.util;

import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.code.domain.Privilege;
import cn.code.service.PrivilegeService;

/**
 * 监听器，应用程序初始化时执行
 * 
 * @author Yvan Tan
 * 
 */
public class InitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// 获取容器与相关的Service对象
		ApplicationContext ac = (ApplicationContext) WebApplicationContextUtils
		    .getWebApplicationContext(sce.getServletContext());
		PrivilegeService privilegeService = (PrivilegeService) ac
		    .getBean("privilegeServiceImpl");

		// 准备数据：topPrivilegeList
		List<Privilege> topPrivilegeList = privilegeService.findAll();
		sce.getServletContext().setAttribute("topPrivilegeList", topPrivilegeList);
		System.out.println("------------> 已准备数据topPrivilegeList <------------");

		// 准备数据：allPrivilegeUrls
		Collection<String> allPrivilegeUrls = privilegeService
		    .getAllPrivilegeUrls();
		sce.getServletContext().setAttribute("allPrivilegeUrls", allPrivilegeUrls);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
