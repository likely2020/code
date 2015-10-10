package cn.code.base;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@SuppressWarnings("rawtypes")
public class DBUtil {

	// 定义变量
	private static Connection conn = null;
	private static PreparedStatement psm = null;
	private static ResultSet rs = null;
	private static CallableStatement cs = null;
	// 连接参数
	private static String url = "";
	private static String user = "";
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	private static String passWord = "";

	private static Properties pp = null;
	private static FileInputStream fis = null;

	/**
	 * 加载驱动
	 */
	static {
		try {
			pp = new Properties();
			fis = new FileInputStream("config/jdbc.properties");
			pp.load(fis);
			url = pp.getProperty("jdbcUrl");
			user = pp.getProperty("user");
			driver = pp.getProperty("driverClass");
			passWord = pp.getProperty("password");

			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			fis = null;
		}
	}

	/**
	 * 获取连接
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, passWord);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

	/**
	 * 释放资源
	 * 
	 * @param rs
	 * @param psm
	 * @param ct
	 */
	public static void close(ResultSet rs, Statement psm, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs = null;
		}
		if (psm != null) {
			try {
				psm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			psm = null;
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}

	/**
	 * 单dml语句
	 * 
	 * @param sql
	 * @param parameters
	 */
	public static void executeUpdate(String sql, String[] parameters) {
		try {
			conn = getConnection();
			psm = conn.prepareStatement(sql);
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					psm.setString(i + 1, parameters[i]);
				}
			}
			psm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			close(rs, psm, conn);
		}
	}

	/**
	 * 多条dml语句
	 * 
	 * @param sql
	 * @param parameters
	 */
	public static void executeUpdate(String[] sql, String[][] parameters) {
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			for (int i = 0; i < sql.length; i++) {
				if (parameters[i] != null) {
					psm = conn.prepareStatement(sql[i]);
					for (int j = 0; j < parameters[i].length; j++) {
						psm.setString(j + 1, parameters[i][j]);
					}
					psm.executeUpdate();
				}
			}
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			close(rs, psm, conn);
		}
	}

	/**
	 * 查询
	 * 
	 * @param sql
	 * @param parameters
	 */
	public static List executeQuery(String sql, String[] parameters) {
		try {
			conn = getConnection();
			psm = conn.prepareStatement(sql);
			if (parameters != null && !parameters.equals("")) {
				for (int i = 0; i < parameters.length; i++) {
					psm.setString(i + 1, parameters[i]);
				}
			}
			rs = psm.executeQuery();

			return convertList(rs);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			close(rs, psm, conn);
		}
	}

	/**
	 * 调用存储过程
	 * 
	 * @param sql
	 * @param parameters
	 */
	public static void callProcedure(String sql, String[] parameters) {
		try {
			conn = getConnection();
			cs = conn.prepareCall(sql);
			if (parameters != null && !parameters.equals("")) {
				for (int i = 0; i < parameters.length; i++) {
					cs.setObject(i + 1, parameters[i]);
				}
			}
			cs.execute();

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			close(rs, cs, conn);
		}
	}

	/**
	 * 将ResultSet转为List
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings({ "unchecked" })
	private static List convertList(ResultSet rs) throws SQLException {
		List list = new ArrayList();
		ResultSetMetaData md = rs.getMetaData();
		int columnCount = md.getColumnCount();
		while (rs.next()) {
			Map rowData = new HashMap();
			for (int i = 1; i <= columnCount; i++) {
				rowData.put(md.getColumnName(i), rs.getObject(i));
			}
			list.add(rowData);
		}
		return list;
	}

}
