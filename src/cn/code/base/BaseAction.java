package cn.code.base;

import java.io.PrintWriter;
import java.lang.reflect.ParameterizedType;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.code.service.ArticleImageService;
import cn.code.service.ArticleService;
import cn.code.service.CategoryService;
import cn.code.service.FriendsService;
import cn.code.service.TempService;
import cn.code.service.UserService;
import cn.code.service.VideoCategoryService;
import cn.code.service.VideoService;
import cn.code.service.WebSettingsService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings({ "serial", "unchecked" })
public class BaseAction<T> extends ActionSupport implements ModelDriven<T> {
	// ========ModelDriven的支持===============//
	protected T model;

	public BaseAction() {
		try {
			ParameterizedType pt = (ParameterizedType) this.getClass()
			    .getGenericSuperclass();

			Class<T> clazz = (Class<T>) pt.getActualTypeArguments()[0];
			model = clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	public T getModel() {
		return model;
	}

	public void echo(Object obj) {
		System.out.println(obj.toString());
	}

	public void write(String imgPath) {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(imgPath);
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	protected int pageNum = 1;// 当前页
	protected int pageSize = 20;// 每页显示多少条

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	// ========Service实例的声明===============//
	@Resource
	protected WebSettingsService webSettingsService;
	@Resource
	protected CategoryService categoryService;
	@Resource
	protected TempService tempService;
	@Resource
	protected ArticleService articleService;
	@Resource
	protected ArticleImageService articleImageService;
	@Resource
	protected VideoCategoryService videoCategoryService;
	@Resource
	protected VideoService videoService;
	@Resource
	protected FriendsService friendsService;
	@Resource
	protected UserService userService;
}
