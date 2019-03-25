package entity;

import java.util.Date;

public class Email {
	private Integer id;
	private String sender;
	private String reciever;
	private String title;
	private String text;
	private Date date;
	private String filePath;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "Email [id=" + id + ", sender=" + sender + ", reciever=" + reciever + ", title=" + title + ", text="
				+ text + ", date=" + date + ", filePath=" + filePath + "]";
	}
	
}
