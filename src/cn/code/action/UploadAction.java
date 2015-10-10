package cn.code.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.code.domain.ArticleImage;
import cn.code.domain.Category;
import cn.code.domain.Temp;
import cn.code.domain.Video;
import cn.code.domain.WebSettings;
import cn.code.service.ArticleImageService;
import cn.code.service.CategoryService;
import cn.code.service.TempService;
import cn.code.service.VideoService;
import cn.code.service.WebSettingsService;
import cn.code.util.Common;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class UploadAction extends ActionSupport {

	private Long id;
	private File file; // 文件
	private String fileFileName; // 文件名
	private String filePath; // 文件路径
	private String fileContentType;
	private InputStream inputStream;

	@Resource
	protected WebSettingsService webSettingsService;
	@Resource
	protected CategoryService categoryService;
	@Resource
	protected TempService tempService;
	@Resource
	protected ArticleImageService articleImageService;
	@Resource
	protected VideoService videoService;

	/**
	 * 上传网站logo图
	 * 
	 * @return
	 */
	public String webLogo() {
		String path = ServletActionContext.getServletContext().getRealPath(
		    "/upload/web_logo");
		File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
		if (!file.exists()) {
			file.mkdirs();
		}
		try {
			if (this.file != null) {
				File f = this.getFile();
				String fileName = java.util.UUID.randomUUID().toString();// 采用时间+UUID的方式随即命名
				String name = fileName
				    + fileFileName.substring(fileFileName.lastIndexOf(".")); // 保存在硬盘中的文件名
				FileInputStream inputStream = new FileInputStream(f);
				FileOutputStream outputStream = new FileOutputStream(path + "\\" + name);
				byte[] buf = new byte[1024];
				int length = 0;
				while ((length = inputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, length);
				}
				inputStream.close();
				outputStream.flush();
				outputStream.close();
				// 文件保存的完整路径
				WebSettings webSettings = webSettingsService.getById((long) 1);

				if (webSettings.getWebLogo() != "" || webSettings.getWebLogo() != null) {
					filePath = path.replace("\\web_logo", "") + "\\"
					    + webSettings.getWebLogo();
					Common.deleteFile(filePath);
				}

				webSettings.setWebLogo("web_logo/" + name);
				webSettingsService.update(webSettings);
				Common.write(retunJson((long) -1, "web_logo/" + name));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NONE;
	}

	/**
	 * 分类顶部图
	 * 
	 * @return
	 */
	public String categoryImg() {
		String path = ServletActionContext.getServletContext().getRealPath(
		    "/upload/category");
		File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
		if (!file.exists()) {
			file.mkdirs();
		}
		try {
			if (this.file != null) {
				File f = this.getFile();
				String fileName = java.util.UUID.randomUUID().toString();// 采用时间+UUID的方式随即命名
				String name = fileName
				    + fileFileName.substring(fileFileName.lastIndexOf(".")); // 保存在硬盘中的文件名
				FileInputStream inputStream = new FileInputStream(f);
				FileOutputStream outputStream = new FileOutputStream(path + "\\" + name);
				byte[] buf = new byte[1024];
				int length = 0;
				while ((length = inputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, length);
				}
				inputStream.close();
				outputStream.flush();
				outputStream.close();
				// 文件保存的完整路径
				if (id == null) {
					Temp temp = new Temp();
					temp.setName("category/" + name);
					tempService.save(temp);
					Common.write(retunJson(temp.getId(), "category/" + name));
				} else {
					Category category = categoryService.getById(id);

					if (category.getImg() != "" || category.getImg() != null) {
						filePath = path.replace("\\category", "") + "\\"
						    + category.getImg();
						Common.deleteFile(filePath);

						category.setImg("category/" + name);
						categoryService.update(category);
						Common.write(retunJson((long) -1, "category/" + name));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NONE;
	}

	/**
	 * 新闻图
	 * 
	 * @return
	 */
	public String articleImg() {
		String path = ServletActionContext.getServletContext().getRealPath(
		    "/upload/article");
		File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
		if (!file.exists()) {
			file.mkdirs();
		}
		try {
			if (this.file != null) {
				File f = this.getFile();
				String fileName = java.util.UUID.randomUUID().toString();// 采用时间+UUID的方式随即命名
				String name = fileName
				    + fileFileName.substring(fileFileName.lastIndexOf(".")); // 保存在硬盘中的文件名
				FileInputStream inputStream = new FileInputStream(f);
				FileOutputStream outputStream = new FileOutputStream(path + "\\" + name);
				byte[] buf = new byte[1024];
				int length = 0;
				while ((length = inputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, length);
				}
				inputStream.close();
				outputStream.flush();
				outputStream.close();
				if (id == null) {
					Temp temp = new Temp();
					temp.setName("article/" + name);
					tempService.save(temp);
					Common.write(retunJson(temp.getId(), temp.getName()));
				} else {
					Common.write(retunJson((long) -1, "error"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return NONE;
	}

	public String deleteArticleImages() throws IOException {
		String path = ServletActionContext.getServletContext().getRealPath(
		    "/upload");
		if (id != null) {
			Temp temp = tempService.getById(id);
			if (temp != null) {
				filePath = path + "\\" + temp.getName();
				Common.deleteFile(filePath);
				tempService.delete(id);
			} else {
				ArticleImage articleImage = articleImageService.getById(id);
				if (articleImage != null) {
					filePath = path + "\\" + articleImage.getImgPath();
					Common.deleteFile(filePath);
					articleImageService.delete(id);
				}
			}
		}

		Common.write(retunJson((long) 1, "success"));

		return NONE;
	}

	public String videoImg() {
		String path = ServletActionContext.getServletContext().getRealPath(
		    "/upload/video");
		File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
		if (!file.exists()) {
			file.mkdirs();
		}
		try {
			if (this.file != null) {
				File f = this.getFile();
				String fileName = java.util.UUID.randomUUID().toString();// 采用时间+UUID的方式随即命名
				String name = fileName
				    + fileFileName.substring(fileFileName.lastIndexOf(".")); // 保存在硬盘中的文件名
				FileInputStream inputStream = new FileInputStream(f);
				FileOutputStream outputStream = new FileOutputStream(path + "\\" + name);
				byte[] buf = new byte[1024];
				int length = 0;
				while ((length = inputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, length);
				}
				inputStream.close();
				outputStream.flush();
				outputStream.close();
				// 文件保存的完整路径
				if (id == null) {
					Temp temp = new Temp();
					temp.setName("video/" + name);
					tempService.save(temp);
					Common.write(retunJson(temp.getId(), "video/" + name));
				} else {
					Video video = videoService.getById(id);

					if (video.getImg() != "" || video.getImg() != null) {
						filePath = path.replace("\\video", "") + "\\" + video.getImg();
						Common.deleteFile(filePath);

						video.setImg("video/" + name);
						videoService.update(video);
						Common.write(retunJson((long) 1, "video/" + name));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return NONE;
	}

	public String retunJson(Long id, String imgPath) {
		return "{'id':" + id + ",'imgPath':'" + imgPath + "'}";
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
