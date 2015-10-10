package cn.code.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class Common {
	public static void deleteFile(String filePath) {
		File file = new File(getDiskPath(filePath));
		if (file.exists()) {
			// System.out.println(file.getPath() + "--" + file.getName());
			file.delete();
		}
	}

	public static String getDiskPath(String sqlPath) {
		return sqlPath.replace("/", "\\");
	}

	public static void write(String imgPath) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(imgPath);
		out.flush();
		out.close();
	}
}
