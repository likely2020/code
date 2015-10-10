package cn.code.util;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

public class Json {
	/**
	 * 往页面写数据
	 * 
	 * @param res
	 * @throws IOException
	 */
	public static void write(String res) throws IOException {
		ServletActionContext.getResponse().setContentType(
				"text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(res);
	}
}
