package bao;

public class Teacher {
	// 学号
	private Long id;
	//密码
	private String password;
	// 姓名
	private String name;
	// 学院
	private String school;
	// 手机号码
	private String mb;
	// 邮箱
	private String email;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMb() {
		return mb;
	}
	public void setMb(String mb) {
		this.mb = mb;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
