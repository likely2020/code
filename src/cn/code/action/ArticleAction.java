package cn.code.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.Article;
import cn.code.domain.ArticleImage;
import cn.code.domain.Category;
import cn.code.domain.PageBean;
import cn.code.domain.Temp;
import cn.code.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class ArticleAction extends BaseAction<Article> {

	private Long[] imageId;
	private Long category_id;

	public String list() {
		this.pageSize = 16;
		QueryHelper queryHelper = new QueryHelper(Article.class, "a");
		queryHelper.addOrderProperty(true, "a.id", true);

		PageBean pageBean = articleService.getPageBean(pageNum, pageSize,
		    queryHelper);
		ActionContext.getContext().getValueStack().push(pageBean);

		return "list";
	}

	public String editUI() {
		tempService.cleanTemp();
		List<Category> categoryList = categoryService.findAll();
		ActionContext.getContext().put("categoryList", categoryList);

		Article article = articleService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(article);

		return "saveUI";
	}

	public String addUI() {
		// 清空临时表
		tempService.cleanTemp();
		List<Category> categoryList = categoryService.findAll();
		ActionContext.getContext().put("categoryList", categoryList);

		return "saveUI";
	}

	public String add() {
		Article article = new Article();
		Category category = categoryService.getById(category_id);
		article.setCategory(category);
		article.setContent(model.getContent());
		article.setTitle(model.getTitle());
		articleService.save(article);
		// 获取临时表中的图片
		List<Temp> tempList = tempService.getByIds(imageId);
		for (Temp t : tempList) {
			ArticleImage articleImage = new ArticleImage();
			articleImage.setImgPath(t.getName());
			articleImage.setArticle(article);
			articleImageService.save(articleImage);
		}

		return "toList";
	}

	public String edit() {
		Article article = articleService.getById(model.getId());
		Category category = categoryService.getById(category_id);
		article.setCategory(category);
		article.setContent(model.getContent());
		article.setTitle(model.getTitle());
		articleService.update(article);
		// 临时表中的图片
		List<Temp> tempList = tempService.getByIds(imageId);
		for (Temp t : tempList) {
			ArticleImage articleImage = new ArticleImage();
			articleImage.setImgPath(t.getName());
			articleImage.setArticle(article);
			articleImageService.save(articleImage);
		}

		return "toList";
	}

	public String delete() {
		articleService.delete(model.getId());

		return "toList";
	}

	public Long[] getImageId() {
		return imageId;
	}

	public void setImageId(Long[] imageId) {
		this.imageId = imageId;
	}

	public Long getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Long category_id) {
		this.category_id = category_id;
	}

}
