package dao;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Sqlconnect.DBConnect;
import entity.User;

public class UserDaoImp implements Serializable, UserDao {

	public boolean find(User user) {
		String sql="select count(*) from login where username=? and password=?;";
		Connection conn=null;
		conn=DBConnect.conntion();
		try {
			/*sta=conn.createStatement();
			sta.execute(sql);*/
			if(user.getPassWord()==null||user.getUserName()==null)return false;
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setString(1, user.getUserName());
			pre.setString(2, eccrypt(user.getPassWord()));
			ResultSet resultSet=pre.executeQuery();
			int count=-1;
			while(resultSet.next())
			{
				count=resultSet.getInt(1);
				if(count>0)return true;
				else if(count==0)return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库查找出错！！！",e);
		}finally {
			DBConnect.close(conn);
		}	
		return false;
	}

	public List<User> findAll() {
		List<User> list=new ArrayList<User>();
		String sql="select * from login;";
		Connection conn=DBConnect.conntion();
		try {
			Statement sta=conn.createStatement();
			ResultSet resultSet=sta.executeQuery(sql);
			if(!resultSet.wasNull()) {
				while (resultSet.next()) {
					User user=new User();
					user.setId(resultSet.getInt(1));
					user.setUserName(resultSet.getString(2));
					user.setPassWord(resultSet.getString(3));
					list.add(user);
				}
			}
		
		} catch (SQLException e) {
			throw new RuntimeException("数据库查找出错！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return list;
	}

	public boolean save(User user) {
		Connection conn=DBConnect.conntion();
		String sql="insert into login (id,username,password) values(?,?,?);";
		int n=-1;
		try {
			PreparedStatement pre =conn.prepareStatement(sql);
			pre.setInt(1, user.getId());
			pre.setString(2, user.getUserName());
			pre.setString(3, eccrypt(user.getPassWord()));
			n=pre.executeUpdate();
			if (1==n) {
				return true;
			} 
		} catch (SQLException e) {
			throw new RuntimeException("数据库保存出错！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return false;
	}
	
	public String eccrypt(String info) {
		//根据MD5算法生成MessageDigest对象
		MessageDigest md5=null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("MD5加密错误!!!",e);
		}
		byte[] srcBytes = info.getBytes();
		//使用srcBytes更新摘要
		md5.update(srcBytes);
		//完成哈希计算，得到result
		byte[] resultBytes = md5.digest();
		return new String(resultBytes);
	}
 
	public Integer findMaxId() {
		Connection conn=DBConnect.conntion();
		String sql="select max(id) from login;";
		
		Statement sta=null;
		Integer i = new Integer(0);
		
		try {
			sta=conn.createStatement();
			ResultSet resultSet=sta.executeQuery(sql);
			while(resultSet.next()) {
				i=resultSet.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException("查询Id出错",e);
		}finally {
			DBConnect.close(conn);
		}
		return i;
	}

	public boolean findByName(String name) {
		List<User> list=new ArrayList<User>();
		PreparedStatement pre=null;
		String sql="select * from login where username=?";
		Connection conn=DBConnect.conntion();
		try {
			pre=conn.prepareStatement(sql);
			pre.setString(1, name);
			ResultSet resultSet=pre.executeQuery();
			if(!resultSet.wasNull()) {
				while (resultSet.next()) {
					User user=new User();
					user.setId(resultSet.getInt(1));
					user.setUserName(resultSet.getString(2));
					user.setPassWord(resultSet.getString(3));
					list.add(user);
				}
			}
			if(list.isEmpty()) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("查找发件人失败！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}


}
