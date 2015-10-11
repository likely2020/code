package cn.code.action;

import java.util.List;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.Article;
import cn.code.domain.Category;
import cn.code.domain.Friends;
import cn.code.domain.Home;
import cn.code.domain.PageBean;
import cn.code.domain.VideoCategory;
import cn.code.domain.WebSettings;
import cn.code.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class PageIndexAction extends BaseAction<Home> {
	private Long videoCategoryId;
	private String searchText;

	public String index() {
		List<Article> companyArticleList = articleService
		    .getArticleListBycategoryName("公司新闻");
		ActionContext.getContext().put("companyArticleList", companyArticleList);

		List<Article> casusArticleList = articleService
		    .getArticleListBycategoryName("成功案例");
		ActionContext.getContext().put("casusArticleList", casusArticleList);

		return "index";
	}

	public String header() {
		List<Category> categoryList = categoryService.findAllOrderByPosition();
		ActionContext.getContext().put("categoryList", categoryList);
		WebSettings companyInfo = webSettingsService.getById((long) 1);
		ActionContext.getContext().put("companyInfo", companyInfo);

		return "header";
	}

	public String leftNav() {
		List<Category> categoryList = categoryService.findAllOrderByPosition();
		ActionContext.getContext().put("categoryList", categoryList);

		return "leftNav";
	}

	public String articles() {
		// 获取category
		Category category = categoryService.getById(model.getId());
		if (category == null) {
			return "toIndex";
		}
		ActionContext.getContext().put("category", category);
		// 获取article列表
		this.pageSize = 20;
		QueryHelper queryHelper = new QueryHelper(Article.class, "a");
		queryHelper.addCondition(true, "a.category.id=?", model.getId());

		queryHelper.addOrderProperty(true, "a.createDate", false);
		PageBean pageBean = categoryService.getPageBean(pageNum, pageSize,
		    queryHelper);
		ActionContext.getContext().getValueStack().push(pageBean);

		return "articles";
	}

	public String article() {
		// 获取文章
		Article article = articleService.getById(model.getId());
		if (article == null) {
			return "toIndex";
		}
		ActionContext.getContext().put("article", article);
		// 获取category
		Category category = categoryService.getById(article.getCategory().getId());
		ActionContext.getContext().put("category", category);

		return "article";
	}

	public String video() {
		List<VideoCategory> videoCategoryList = videoCategoryService
		    .findAllOrderByPosition();
		ActionContext.getContext().put("videoCategoryList", videoCategoryList);
		Category category = categoryService.getById(model.getId());
		if (category == null) {
			return "toIndex";
		}
		ActionContext.getContext().put("category", category);

		if (videoCategoryList.size() > 0) {
			if (videoCategoryId == null) {
				videoCategoryId = videoCategoryList.get(0).getId();
			}
			VideoCategory videoCategory = videoCategoryService
			    .getById(videoCategoryId);
			ActionContext.getContext().put("videoCategory", videoCategory);
		}

		return "video";
	}

	public String contactus() {
		// 获取category
		Category category = categoryService.getById(model.getId());
		if (category == null) {
			return "toIndex";
		}
		ActionContext.getContext().put("category", category);
		Set<Article> articleList = category.getArticles();
		Article article = new Article();
		if (articleList.size() > 0) {
			for (Article a : articleList) {
				article = a;
			}
		}
		ActionContext.getContext().put("article", article);

		return "contactus";
	}

	public String footer() {
		List<Friends> friendList = friendsService.findAllOrderByPosition();
		ActionContext.getContext().put("friendList", friendList);

		WebSettings webSettings = webSettingsService.getById((long) 1);
		ActionContext.getContext().put("webSettings", webSettings);

		return "footer";
	}

	public Long getVideoCategoryId() {
		return videoCategoryId;
	}

	public void setVideoCategoryId(Long videoCategoryId) {
		this.videoCategoryId = videoCategoryId;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

}
