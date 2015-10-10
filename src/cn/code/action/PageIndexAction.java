package cn.code.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.Category;
import cn.code.domain.Friends;
import cn.code.domain.Home;
import cn.code.domain.WebSettings;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class PageIndexAction extends BaseAction<Home> {

	public String index() {
		return "index";
	}

	public String header() {
		List<Category> categoryList = categoryService.findAllOrderByPosition();
		ActionContext.getContext().put("categoryList", categoryList);

		return "header";
	}

	public String footer() {
		List<Friends> friendList = friendsService.findAllOrderByPosition();
		ActionContext.getContext().put("friendList", friendList);

		WebSettings webSettings = webSettingsService.getById((long) 1);
		ActionContext.getContext().put("webSettings", webSettings);

		return "footer";
	}
}
