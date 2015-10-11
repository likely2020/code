package cn.code.action;

import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.PageBean;
import cn.code.domain.User;
import cn.code.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {
	public String list() {
		this.pageSize = 16;
		QueryHelper queryHelper = new QueryHelper(User.class, "v");
		queryHelper.addOrderProperty(true, "v.id", false);

		PageBean pageBean = userService.getPageBean(pageNum, pageSize, queryHelper);
		ActionContext.getContext().getValueStack().push(pageBean);

		return "list";
	}

	public String addUI() {
		return "saveUI";
	}

	public String add() {
		User user = new User();
		user.setUserName(model.getUserName());
		user.setPassWord(DigestUtils.md5Hex(model.getPassWord()));
		echo(1);
		userService.save(user);

		return "toList";
	}

	public String editUI() {
		User user = userService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(user);

		return "saveUI";
	}

	public String edit() {
		User user = userService.getById(model.getId());
		user.setUserName(model.getUserName());
		if (!user.getPassWord().equals(model.getPassWord())) {
			user.setPassWord(DigestUtils.md5Hex(model.getPassWord()));
		}
		userService.update(user);

		return "toList";
	}

	public String delete() {
		userService.delete(model.getId());

		return "toList";
	}

	public String loginUI() {
		return "loginUI";
	}

	public String toLogin() throws IOException {
		User user = userService.loginUser(model.getUserName(), model.getPassWord());
		if (user != null) {
			ActionContext.getContext().getSession().put("user", user);
			write("success");
		} else {
			write("error");
		}
		return NONE;
	}
}
