package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardComment implements Serializable{

	private int key;
	private int postKey;
	private int userKey;
	private String content;
	private Date commentDate;
	private int commentLevel;
	private int commentRef;
	private String status;
	
	private String refMemberName;

	public BoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardComment(int key, int postKey, int userKey, String content, Date commentDate, int commentLevel,
			int commentRef, String status) {
		super();
		this.key = key;
		this.postKey = postKey;
		this.userKey = userKey;
		this.content = content;
		this.commentDate = commentDate;
		this.commentLevel = commentLevel;
		this.commentRef = commentRef;
		this.status = status;
	}

	public BoardComment(int key, int postKey, int userKey, String content, Date commentDate, int commentLevel, int commentRef,
			String status,String refMemberName) {
		super();
		this.key = key;
		this.postKey = postKey;
		this.userKey = userKey;
		this.content = content;
		this.commentDate = commentDate;
		this.commentLevel = commentLevel;
		this.commentRef = commentRef;
		this.status = status;
		this.refMemberName = refMemberName;
		
		
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public int getPostKey() {
		return postKey;
	}

	public void setPostKey(int postKey) {
		this.postKey = postKey;
	}

	public int getUserKey() {
		return userKey;
	}

	public void setUserKey(int userKey) {
		this.userKey = userKey;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public int getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

	public String getRefMemberName() {
		return refMemberName;
	}

	public void setRefMemberName(String refMemberName) {
		this.refMemberName = refMemberName;
	}

	@Override
	public String toString() {
		return "BoardComment [key=" + key + ", postKey=" + postKey + ", userKey=" + userKey + ", content=" + content
				+ ", commentDate=" + commentDate + ", commentLevel=" + commentLevel + ", commentRef=" + commentRef
				+ ", status=" + status + ", refMemberName=" + refMemberName + "]";
	}
	

	

	
	

}
