package entity;

public class Lianxi {
	private Integer id;
	private String zhuren;
	private String username;
	private String fenzu;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getZhuren() {
		return zhuren;
	}
	public void setZhuren(String zhuren) {
		this.zhuren = zhuren;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFenzu() {
		return fenzu;
	}
	public void setFenzu(String fenzu) {
		this.fenzu = fenzu;
	}
	@Override
	public String toString() {
		return "Lianxi [id=" + id + ", zhuren=" + zhuren + ", username=" + username + ", fenzu=" + fenzu + "]";
	}
}
