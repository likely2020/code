package cn.code.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.Friends;
import cn.code.domain.PageBean;
import cn.code.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class FriendsAction extends BaseAction<Friends> {

	public String list() {
		this.pageSize = 16;
		QueryHelper queryHelper = new QueryHelper(Friends.class, "v");
		queryHelper.addOrderProperty(true, "v.position", true);
		queryHelper.addOrderProperty(true, "v.id", false);

		PageBean pageBean = friendsService.getPageBean(pageNum, pageSize,
		    queryHelper);
		ActionContext.getContext().getValueStack().push(pageBean);

		return "list";
	}

	public String addUI() {
		return "saveUI";
	}

	public String add() {
		friendsService.save(model);

		return "toList";
	}

	public String editUI() {
		Friends friends = friendsService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(friends);

		return "saveUI";
	}

	public String edit() throws Exception {
		Friends friends = friendsService.getById(model.getId());
		friends.setName(model.getName());
		friends.setUrl(model.getUrl());
		friends.setPosition(model.getPosition());
		friendsService.update(friends);

		return "toList";
	}

	public String delete() {
		friendsService.delete(model.getId());

		return "toList";
	}
}
