package kw.user;

public class UserVO {
	private String id;
	private String pw;
	private String email;
	private String name;
	private String postNum;
	private String address;
	private String phoneNum;
	private String grade;
	private int point;
	
	public UserVO() {
		super();
	}
	
	public UserVO(String id, String pw, String email,
			String name, String postNum, String address,
			String phoneNum, String grade, int point) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.postNum = postNum;
		this.address = address;
		this.phoneNum = phoneNum;
		this.grade = grade;
		this.point = point;
	}
	
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getEmail() {
		return email;
	}
	public String getName() {
		return name;
	}
	public String getPostNum() {
		return postNum;
	}
	public String getAddress() {
		return address;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public String getGrade() {
		return grade;
	}
	public int getPoint() {
		return point;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
