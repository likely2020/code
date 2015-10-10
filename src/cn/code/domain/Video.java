package cn.code.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "video", catalog = "web")
public class Video {
	private Long id;
	private String title;
	private String img;
	private String youkuUrl;
	private String tudouUrl;
	private VideoCategory videoCategory;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getYoukuUrl() {
		return youkuUrl;
	}

	public void setYoukuUrl(String youkuUrl) {
		this.youkuUrl = youkuUrl;
	}

	public String getTudouUrl() {
		return tudouUrl;
	}

	public void setTudouUrl(String tudouUrl) {
		this.tudouUrl = tudouUrl;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "videoCategory_id", nullable = false)
	public VideoCategory getVideoCategory() {
		return videoCategory;
	}

	public void setVideoCategory(VideoCategory videoCategory) {
		this.videoCategory = videoCategory;
	}

}
