package cn.code.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.WebSettings;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class WebSettingsAction extends BaseAction<WebSettings> {

	public String editUI() {
		WebSettings webSettings = webSettingsService.getById((long) 1);
		ActionContext.getContext().getValueStack().push(webSettings);

		return "saveUI";
	}

	public String edit() {
		WebSettings webSettings = webSettingsService.getById(model.getId());
		webSettings.setWebName(model.getWebName());
		webSettings.setAddress(model.getAddress());
		webSettings.setCopyRight(model.getCopyRight());
		webSettings.setWebLogo(model.getWebLogo());
		webSettingsService.update(webSettings);

		return "success";
	}
}
