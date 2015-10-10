package cn.code.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.base.BaseAction;
import cn.code.domain.PageBean;
import cn.code.domain.Temp;
import cn.code.domain.Video;
import cn.code.domain.VideoCategory;
import cn.code.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class VideoAction extends BaseAction<Video> {
	private Long category_id;
	private Long imageId;

	public String list() {
		this.pageSize = 16;
		QueryHelper queryHelper = new QueryHelper(Video.class, "v");
		queryHelper.addOrderProperty(true, "v.id", true);

		PageBean pageBean = videoService
		    .getPageBean(pageNum, pageSize, queryHelper);
		ActionContext.getContext().getValueStack().push(pageBean);

		return "list";
	}

	public String editUI() {
		tempService.cleanTemp();
		List<VideoCategory> videoCategoryList = videoCategoryService.findAll();
		ActionContext.getContext().put("videoCategoryList", videoCategoryList);

		Video video = videoService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(video);

		return "saveUI";
	}

	public String addUI() {
		// 清空临时表
		tempService.cleanTemp();
		List<VideoCategory> videoCategoryList = videoCategoryService.findAll();
		ActionContext.getContext().put("videoCategoryList", videoCategoryList);

		return "saveUI";
	}

	public String add() {
		Video video = new Video();
		VideoCategory videoCategory = videoCategoryService.getById(category_id);
		video.setVideoCategory(videoCategory);
		video.setTitle(model.getTitle());
		video.setYoukuUrl(model.getYoukuUrl());
		video.setTudouUrl(model.getTudouUrl());

		// 获取临时表中的图片
		Temp temp = tempService.getById(imageId);
		if (temp != null) {
			video.setImg(temp.getName());
		}
		videoService.save(video);

		return "toList";
	}

	public String edit() {
		Video video = videoService.getById(model.getId());
		VideoCategory videoCategory = videoCategoryService.getById(category_id);
		video.setVideoCategory(videoCategory);
		video.setTitle(model.getTitle());
		video.setYoukuUrl(model.getYoukuUrl());
		video.setTudouUrl(model.getTudouUrl());
		// 临时表中的图片
		Temp temp = tempService.getById(imageId);
		if (temp != null) {
			video.setImg(temp.getName());
		}
		videoService.update(video);

		return "toList";
	}

	public String delete() {
		videoService.delete(model.getId());

		return "toList";
	}

	public Long getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Long category_id) {
		this.category_id = category_id;
	}

	public Long getImageId() {
		return imageId;
	}

	public void setImageId(Long imageId) {
		this.imageId = imageId;
	}

}
