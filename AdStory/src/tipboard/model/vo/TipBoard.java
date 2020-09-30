package tipboard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TipBoard implements Serializable {
	private int key;
	private int userKey;
	private String title;
	private String content;
	private String postDate;
	private int readCount;
	private int recommend;
	//--------------------
	private String memberId;
	private String memberRole;
	
	public TipBoard() {
		super();
	}
	
	public TipBoard(int key, int userKey, String title, String content, String postDate, int readCount, int recommend,
			String memberId, String memberRole) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.title = title;
		this.content = content;
		this.postDate = postDate;
		this.readCount = readCount;
		this.recommend = recommend;
		this.memberId = memberId;
		this.memberRole = memberRole;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberRole() {
		return memberRole;
	}
	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}
	@Override
	public String toString() {
		return "TipBoard [key=" + key + ", userKey=" + userKey + ", title=" + title + ", content=" + content
				+ ", postDate=" + postDate + ", readCount=" + readCount + ", recommend=" + recommend + ", memberId="
				+ memberId + ", memberRole=" + memberRole + "]";
	}

}
