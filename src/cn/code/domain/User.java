package cn.code.domain;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.opensymphony.xwork2.ActionContext;

@Entity
@Table(name = "user", catalog = "web")
public class User {

	private Long id;
	private String userName;
	private String passWord;
	private Role role;
	private Set<Article> articles = new HashSet<Article>();

	/**
	 * 判断本用户是否具有指定权限
	 * 
	 * @param id
	 * @return
	 */
	public boolean hasPrivilegeById(String name) {
		if (isAdmin(this.userName))
			return true;

		// 普通用户
		for (Privilege priv : role.getPrivileges()) {
			if (priv.getName().equals(name)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 判断用户是否有指定Url的权限
	 * 
	 * @param privUrl
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean hasPrivilegeByUrl(String privUrl) {
		if (isAdmin(this.userName))
			return true;

		int pos = privUrl.indexOf("?");
		if (pos > -1) {
			privUrl = privUrl.substring(0, pos);
		}

		// >> 去掉UI后缀
		if (privUrl.endsWith("UI")) {// 以UI结尾
			privUrl = privUrl.substring(0, privUrl.length() - 2);
		}

		Collection<String> allPrivileges = (Collection<String>) ActionContext
		    .getContext().getApplication().get("allPrivilegeUrls");
		if (!allPrivileges.contains(privUrl)) {
			return true;
		} else {
			// 普通用户
			for (Privilege priv : role.getPrivileges()) {
				if (privUrl.equals(priv.getUrl())) {
					return true;
				}
			}
		}
		return false;
	}

	private boolean isAdmin(String userName) {
		return "txx".equals(userName);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "userName", nullable = false, length = 50)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "passWord", nullable = false, length = 50)
	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}

}
