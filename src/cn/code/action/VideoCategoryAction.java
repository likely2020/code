package cn.code.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.PageBean;
import cn.code.domain.VideoCategory;
import cn.code.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class VideoCategoryAction extends BaseAction<VideoCategory> {
	public String list() {
		this.pageSize = 16;
		QueryHelper queryHelper = new QueryHelper(VideoCategory.class, "v");
		queryHelper.addOrderProperty(true, "v.position", true);
		queryHelper.addOrderProperty(true, "v.id", false);

		PageBean pageBean = videoCategoryService.getPageBean(pageNum, pageSize,
		    queryHelper);
		ActionContext.getContext().getValueStack().push(pageBean);

		return "list";
	}

	public String addUI() {
		return "saveUI";
	}

	public String add() {
		videoCategoryService.save(model);

		return "toList";
	}

	public String editUI() {
		VideoCategory videoCategory = videoCategoryService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(videoCategory);

		return "saveUI";
	}

	public String edit() throws Exception {
		VideoCategory videoCategory = videoCategoryService.getById(model.getId());
		videoCategory.setName(model.getName());
		videoCategory.setPosition(model.getPosition());
		videoCategoryService.update(videoCategory);

		return "toList";
	}

	public String delete() {
		videoCategoryService.delete(model.getId());

		return "toList";
	}

}
