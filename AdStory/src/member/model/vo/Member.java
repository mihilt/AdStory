package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
	private int key;
	private String memberId;
	private String password;
	private String memberRole;
	private int point;
	private String phoneNum;
	private String accountName;
	private String accountNum;
	private String bussinessNum;
	private String name;
	private String email;
	private String address;
	private Date enrollDate;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int key, String memberId, String password, String memberRole, int point, String phoneNum,
			String accountName, String accountNum, String bussinessNum, String name, String email, String address,
			Date enrollDate) {
		super();
		this.key = key;
		this.memberId = memberId;
		this.password = password;
		this.memberRole = memberRole;
		this.point = point;
		this.phoneNum = phoneNum;
		this.accountName = accountName;
		this.accountNum = accountNum;
		this.bussinessNum = bussinessNum;
		this.name = name;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
	}
	
	

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getBussinessNum() {
		return bussinessNum;
	}

	public void setBussinessNum(String bussinessNum) {
		this.bussinessNum = bussinessNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [key=" + key + ", memberId=" + memberId + ", password=" + password + ", memberRole=" + memberRole
				+ ", point=" + point + ", phoneNum=" + phoneNum + ", accountName=" + accountName + ", accountNum="
				+ accountNum + ", bussinessNum=" + bussinessNum + ", name=" + name + ", email=" + email + ", address="
				+ address + ", enrollDate=" + enrollDate + "]";
	}

	

}
