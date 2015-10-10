package cn.code.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "slider_images", catalog = "web")
public class SliderImages {

	private Long id;
	private String img;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "img", nullable = false)
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
