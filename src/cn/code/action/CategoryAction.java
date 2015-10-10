package cn.code.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.Category;
import cn.code.domain.PageBean;
import cn.code.domain.Temp;
import cn.code.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class CategoryAction extends BaseAction<Category> {
	private Long imageId;

	public String list() {
		this.pageSize = 16;
		QueryHelper queryHelper = new QueryHelper(Category.class, "c");
		queryHelper.addOrderProperty(true, "c.position", true);
		queryHelper.addOrderProperty(true, "c.id", false);

		PageBean pageBean = categoryService.getPageBean(pageNum, pageSize,
		    queryHelper);
		ActionContext.getContext().getValueStack().push(pageBean);

		return "list";
	}

	public String addUI() {
		tempService.cleanTemp();
		return "saveUI";
	}

	public String add() {
		Category category = new Category();
		category.setName(model.getName());
		category.setPosition(model.getPosition());
		category.setUrl(model.getUrl());
		if (imageId != null) {
			Temp temp = tempService.getById(imageId);
			category.setImg(temp.getName());
		}
		categoryService.save(category);

		return "toList";
	}

	public String editUI() {
		Category category = categoryService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(category);

		return "saveUI";
	}

	public String edit() throws Exception {
		Category category = categoryService.getById(model.getId());
		category.setName(model.getName());
		category.setImg(model.getImg());
		category.setUrl(model.getUrl());
		category.setPosition(model.getPosition());
		categoryService.update(category);

		return "toList";
	}

	public String delete() {
		categoryService.delete(model.getId());

		return "toList";
	}

	public Long getImageId() {
		return imageId;
	}

	public void setImageId(Long imageId) {
		this.imageId = imageId;
	}

}
