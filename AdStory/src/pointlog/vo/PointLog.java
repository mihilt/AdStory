package pointlog.vo;

import java.io.Serializable;
import java.sql.Date;

public class PointLog implements Serializable{
	private int key;
	private int userKey;
	private int postKey;
	private Date logDate;
	private int point;
	private String status;
	private int remainPoint;

	private String refMemberId;
	private String refPostTitle;
	private String logDateTime;
	
	
	public PointLog() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PointLog(int key, int userKey, int postKey, Date logDate, int point, String status, int remainPoint,
			String refMemberId, String refPostTitle, String logDateTime) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.postKey = postKey;
		this.logDate = logDate;
		this.point = point;
		this.status = status;
		this.remainPoint = remainPoint;
		this.refMemberId = refMemberId;
		this.refPostTitle = refPostTitle;
		this.logDateTime = logDateTime;
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


	public int getPostKey() {
		return postKey;
	}


	public void setPostKey(int postKey) {
		this.postKey = postKey;
	}


	public Date getLogDate() {
		return logDate;
	}


	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getRemainPoint() {
		return remainPoint;
	}


	public void setRemainPoint(int remainPoint) {
		this.remainPoint = remainPoint;
	}


	public String getRefMemberId() {
		return refMemberId;
	}


	public void setRefMemberId(String refMemberId) {
		this.refMemberId = refMemberId;
	}


	public String getRefPostTitle() {
		return refPostTitle;
	}


	public void setRefPostTitle(String refPostTitle) {
		this.refPostTitle = refPostTitle;
	}


	public String getLogDateTime() {
		return logDateTime;
	}


	public void setLogDateTime(String logDateTime) {
		this.logDateTime = logDateTime;
	}


	@Override
	public String toString() {
		return "PointLog [key=" + key + ", userKey=" + userKey + ", postKey=" + postKey + ", logDate=" + logDate
				+ ", point=" + point + ", status=" + status + ", remainPoint=" + remainPoint + ", refMemberId="
				+ refMemberId + ", refPostTitle=" + refPostTitle + ", logDateTime=" + logDateTime + "]";
	}
	


	
		
}
