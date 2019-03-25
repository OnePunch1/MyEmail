package Sqlconnect;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;



public class DBConnect {
	private static String Driver=null;
	private static String Url=null;
	private static String Name=null;
	private static String pwd=null;
	private static int MaxInit=0;
	private static int MaxAction=0;
	private static BasicDataSource bdSource=null;
	
	static {
		Properties pro=new Properties();
		InputStream in=DBConnect.class.getClassLoader().getResourceAsStream("driver.properties");
		try {
			pro.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Driver=pro.getProperty("jdbc.driver");
		Url=pro.getProperty("jdbc.url");
		Name=pro.getProperty("jdbc.username");
		pwd=pro.getProperty("jdbc.password");
		MaxAction=Integer.parseInt(pro.getProperty("MAX_ACTIVE"));
		MaxInit=Integer.parseInt(pro.getProperty("MAX_INI"));
		
		bdSource=new BasicDataSource();
		bdSource.setMaxActive(MaxAction);
		bdSource.setInitialSize(MaxInit);
		bdSource.setDriverClassName(Driver);
		bdSource.setPassword(pwd);
		bdSource.setUrl(Url);
		bdSource.setUsername(Name);
	}
	
	public static Connection conntion() {
		Connection conn=null;
		try {
			conn=bdSource.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return conn;
	}
	
	public static void close(Connection con) {
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
