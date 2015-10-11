package cn.code.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.domain.WebSettings;
import cn.code.service.WebSettingsService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class HomeAction extends ActionSupport {
	@Resource
	private WebSettingsService webSettingsService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String header() {
		WebSettings webSettings = webSettingsService.getById((long) 1);
		ActionContext.getContext().put("webSettings", webSettings);

		return "header";
	}

	public String nav() {
		return "nav";
	}

	public String index() {
		return "index";
	}
}
