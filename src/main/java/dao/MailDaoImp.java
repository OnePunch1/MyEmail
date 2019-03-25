package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Sqlconnect.DBConnect;
import entity.Email;
import entity.Lianxi;
import entity.User;

public class MailDaoImp implements Serializable, MailDao {

	public List<Email> findAll(String reciever) {
		Connection conn=DBConnect.conntion();
		PreparedStatement pre=null;
		List<Email> list=new ArrayList<Email>();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql="select * from reciever_mail where reciever=?;";
		try {
			pre=conn.prepareStatement(sql);
			pre.setString(1,reciever);
			ResultSet resultSet=pre.executeQuery();
			if(!resultSet.wasNull()) {
				while(resultSet.next()) {
					Email NEWemail=new Email();
					NEWemail.setId(resultSet.getInt(1));
					NEWemail.setSender(resultSet.getString(2));
					NEWemail.setReciever(resultSet.getString(3));
					NEWemail.setText(resultSet.getString(4));
					NEWemail.setTitle(resultSet.getString(5));
					try {
						NEWemail.setDate(simpleDateFormat.parse(resultSet.getString(6)));
						NEWemail.setFilePath(resultSet.getString(7));
					} catch (ParseException e) {
						e.printStackTrace();
						throw new RuntimeException("时间转换出错 ！！！",e);
					}
					list.add(NEWemail);
				}
			}else {
				throw new RuntimeException("查询当前用户邮箱为空！！！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("查询当前用户所有邮箱出错！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return list;
	}

	public Email find(Integer id) {
		Connection conn=DBConnect.conntion();
		PreparedStatement pre=null;
		Email email = new Email();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql="select * from reciever_mail where id=?;";
		try {
			pre=conn.prepareStatement(sql);
			pre.setInt(1, id);
			ResultSet resultSet=pre.executeQuery();
			if(!resultSet.wasNull()) {
				while(resultSet.next()) {
					email.setId(resultSet.getInt(1));
					email.setSender(resultSet.getString(2));
					email.setReciever(resultSet.getString(3));
					email.setText(resultSet.getString(4));
					email.setTitle(resultSet.getString(5));
					email.setDate(simpleDateFormat.parse(resultSet.getString(6)));
				}
			}else {
				throw new RuntimeException("没找到这个信封！！！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("没找到这个信封！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return email;
	}

	public boolean send(Email email) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql="insert into send_mail (id,sender,reciever,text,title,date,fujian) values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, email.getId());
			pre.setString(2, email.getSender());
			pre.setString(3, email.getReciever());
			pre.setString(4, email.getText());
			pre.setString(5, email.getTitle());
			pre.setString(6, simpleDateFormat.format(email.getDate()));
			pre.setString(7, email.getFilePath());
			n=pre.executeUpdate();
			if(1!=n) {
				return false;
			}
		} catch (SQLException e) {
			/*e.printStackTrace();*/
			throw new RuntimeException("发送失败！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}

	public boolean save(Email email) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql="insert into draft_box (id,reciever,sender,text,title,date,fujian) values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, email.getId());
			pre.setString(2, email.getReciever());
			pre.setString(3, email.getSender());
			pre.setString(4, email.getText());
			pre.setString(5, email.getTitle());
			pre.setString(6, simpleDateFormat.format(email.getDate()));
			pre.setString(7, email.getFilePath());
			n=pre.executeUpdate();
			if (1!=n) {
				return false;
			}
		} catch (SQLException e) {
			/*e.printStackTrace();*/
			throw new RuntimeException("保存草稿失败！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}

	public boolean deleteAll(String sender) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		String sql="delete from reciever_mail where sender=?;";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setString(1,sender);
			n=pre.executeUpdate();
			if(-1!=n) {
				return true;
			}
		} catch (SQLException e) {
			throw new RuntimeException("删除全部邮件失败！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return false;
	}

	public boolean delete(Integer id) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		String sql="delete from reciever_mail where id=?;";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, id);
			n=pre.executeUpdate();
			if(1!=n) {
				return false;
			}
		} catch (SQLException e) {
			throw new RuntimeException("删除单个邮件失败",e); 
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}

	public List<Email> findDraftAll(String sender/*,int startRecord,int colNum*/) {
		Connection conn=DBConnect.conntion();
		PreparedStatement pre=null;
		List<Email> list=new ArrayList<Email>();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql="select * from draft_box where sender=?;";
		/*String sql="select * from draft_box where sender=? limit ?,?;";*/
		try {
			pre=conn.prepareStatement(sql);
			pre.setString(1,sender);
		/*	pre.setInt(2, startRecord);
			pre.setInt(3, colNum);*/
			ResultSet resultSet=pre.executeQuery();
			if(!resultSet.wasNull()) {
				while(resultSet.next()) {
					Email NEWemail=new Email();
					NEWemail.setId(resultSet.getInt(1));
					NEWemail.setReciever(resultSet.getString(2));
					NEWemail.setSender(resultSet.getString(3));
					NEWemail.setText(resultSet.getString(4));
					NEWemail.setTitle(resultSet.getString(5));
					try {
						NEWemail.setDate(simpleDateFormat.parse(resultSet.getString(6)));
					} catch (ParseException e) {
						e.printStackTrace();
						throw new RuntimeException("时间转换出错 ！！！",e);
					}
					list.add(NEWemail);
				}
			}else {
				throw new RuntimeException("查询当前用户邮箱为空！！！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("查询当前用户所有邮箱出错！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return list;
	}

	public boolean deleteDraftAll(String sender) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		String sql="delete from draft_box where sender=?;";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setString(1,sender);
			n=pre.executeUpdate();
			if(-1!=n) {
				return true;
			}
		} catch (SQLException e) {
			throw new RuntimeException("删除全部邮件失败！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return false;
	}

	public Integer findMaxId() {
		Connection conn=DBConnect.conntion();
		String sql="select max(id) from send_mail;";
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

	public boolean deleteDraft(Integer id) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		String sql="delete from draft_box where id=?;";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, id);
			n=pre.executeUpdate();
			if(1!=n) {
				return false;
			}
		} catch (SQLException e) {
			throw new RuntimeException("删除单个草稿邮件失败",e); 
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}

	public Integer findDraftMaxId() {
		Connection conn=DBConnect.conntion();
		String sql="select max(id) from draft_box;";
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

	public boolean sendR(Email email) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql="insert into reciever_mail (id,sender,reciever,text,title,date,fujian) values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, email.getId());
			pre.setString(2, email.getSender());
			pre.setString(3, email.getReciever());
			pre.setString(4, email.getText());
			pre.setString(5, email.getTitle());
			pre.setString(6, simpleDateFormat.format(email.getDate()));
			pre.setString(7, email.getFilePath());
			n=pre.executeUpdate();
			if(1!=n) {
				return false;
			}
		} catch (SQLException e) {
			/*e.printStackTrace();*/
			throw new RuntimeException("发送失败！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}

	public List<Email> findAllSen(String sender) {
		Connection conn=DBConnect.conntion();
		PreparedStatement pre=null;
		List<Email> list=new ArrayList<Email>();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql="select * from send_mail where sender=?;";
		try {
			pre=conn.prepareStatement(sql);
			pre.setString(1,sender);
			ResultSet resultSet=pre.executeQuery();
			if(!resultSet.wasNull()) {
				while(resultSet.next()) {
					Email NEWemail=new Email();
					NEWemail.setId(resultSet.getInt(1));
					NEWemail.setSender(resultSet.getString(2));
					NEWemail.setReciever(resultSet.getString(3));
					NEWemail.setText(resultSet.getString(4));
					NEWemail.setTitle(resultSet.getString(5));
					try {
						NEWemail.setDate(simpleDateFormat.parse(resultSet.getString(6)));
						NEWemail.setFilePath(resultSet.getString(7));
					} catch (ParseException e) {
						e.printStackTrace();
						throw new RuntimeException("时间转换出错 ！！！",e);
					}
					list.add(NEWemail);
				}
			}else {
				throw new RuntimeException("查询当前用户邮箱为空！！！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("查询当前用户所有邮箱出错！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return list;
	}

	public boolean deleteSen(Integer id) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		String sql="delete from send_mail where id=?;";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, id);
			n=pre.executeUpdate();
			if(1!=n) {
				return false;
			}
		} catch (SQLException e) {
			throw new RuntimeException("删除单个邮件失败",e); 
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}

	public List<Lianxi> findAllLian(String zhuren) {
		Connection conn=DBConnect.conntion();
		PreparedStatement pre=null;
		List<Lianxi> list=new ArrayList<Lianxi>();
		String sql="select * from lianxiren where zhuren=?;";
		try {
			pre=conn.prepareStatement(sql);
			pre.setString(1,zhuren);
			ResultSet resultSet=pre.executeQuery();
			if(!resultSet.wasNull()) {
				while(resultSet.next()) {
					Lianxi lianxi=new Lianxi();
					lianxi.setId(resultSet.getInt(1));
					lianxi.setZhuren(resultSet.getString(2));
					lianxi.setUsername(resultSet.getString(3));
					lianxi.setFenzu(resultSet.getString(4));
					list.add(lianxi);
				}
			}else {
				throw new RuntimeException("查询当前用户联系人为空！！！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("查询当前用户所有联系人出错！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return list;
	}

	public boolean insertLian(Lianxi lianxi) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		String sql="insert into lianxiren (id,zhuren,username,fenzu) values (?,?,?,?)";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, lianxi.getId());
			pre.setString(2, lianxi.getZhuren());
			pre.setString(3, lianxi.getUsername());
			pre.setString(4, lianxi.getFenzu());
			n=pre.executeUpdate();
			if(1!=n) {
				return false;
			}
		} catch (SQLException e) {
			/*e.printStackTrace();*/
			throw new RuntimeException("发送失败！！！",e);
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}

	public boolean deleteAllLian(String zhuren) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		String sql="delete from lianxiren where zhuren=?;";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setString(1, zhuren);
			n=pre.executeUpdate();
			if(-1==n) {
				return false;
			}
		} catch (SQLException e) {
			throw new RuntimeException("删除用户联系人失败",e); 
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}

	public boolean deleteLian(Integer id) {
		Connection conn=DBConnect.conntion();
		int n=-1;
		String sql="delete from lianxiren where id=?;";
		try {
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setInt(1, id);
			n=pre.executeUpdate();
			if(1!=n) {
				return false;
			}
		} catch (SQLException e) {
			throw new RuntimeException("删除用户联系人失败",e); 
		}finally {
			DBConnect.close(conn);
		}
		return true;
	}
	
	public Integer findLianMaxId() {
		Connection conn=DBConnect.conntion();
		String sql="select max(id) from lianxiren;";
		Statement sta=null;
		Integer i = new Integer(0);
		try {
			sta=conn.createStatement();
			ResultSet resultSet=sta.executeQuery(sql);
			while(resultSet.next()) {
				i=resultSet.getInt(1);
			}
		} catch (SQLException e) {
			throw new RuntimeException("查询lianxiId出错",e);
		}finally {
			DBConnect.close(conn);
		}
		return i;
	}


/*	public Integer findCount(String sender) {
		PreparedStatement pre=null;
		Connection conn=DBConnect.conntion();
		String sql="select count(*) from draft_box where sender=?";
		
		return null;
	}*/

}
