package enquiry.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Enquiry implements Serializable{

	private int key;
	private int userKey;
	private String title;
	private Date enrollDate;
	private String content;
	private String answer;
	private String status;
	private String memberId;
	
	

	
	public Enquiry(int key, int userKey, String title, String content, String answer, String status, Date enrollDate) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.title = title;
		this.enrollDate = enrollDate;
		this.content = content;
		this.answer = answer;
		this.status = status;
	}
	
	public Enquiry(int key, int userKey, String title, String content, String memberId, Date enrollDate) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.title = title;
		this.enrollDate = enrollDate;
		this.content = content;
		this.memberId = memberId;
	}
		
	public Enquiry(int key, int userKey, String title, String content, Date enrollDate, String answer, String status,
			String memberId) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.title = title;
		this.enrollDate = enrollDate;
		this.content = content;
		this.answer = answer;
		this.status = status;
		this.memberId = memberId;
	}


	public Enquiry() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getKey() {
		return key;
	}


	public void setKey(int key) {
		this.key = key;
	}


	public int getUserKey() {
		return userKey;
	}


	public void setUserKey(int userKey) {
		this.userKey = userKey;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "Enquiry [key=" + key + ", userKey=" + userKey + ", title=" + title + ", enrollDate=" + enrollDate
				+ ", content=" + content + ", answer=" + answer + ", status=" + status + ", memberId=" + memberId + "]";
	}
	
	
	
	
	
	
}
