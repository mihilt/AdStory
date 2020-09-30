package tipboard.model.vo;

public class TipBoardComment {
	private int key;
	private int userKey;
	private int postKey;
	private String content;
	private String postDate;
	private int commLevel;
	private int commRef;
	private String status;
	
	private String memberId;
	private String memberRole;
	
	public TipBoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TipBoardComment(int key, int userKey, int postKey, String content, String postDate, int commLevel,
			int commRef, String status, String memberId, String memberRole) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.postKey = postKey;
		this.content = content;
		this.postDate = postDate;
		this.commLevel = commLevel;
		this.commRef = commRef;
		this.status = status;
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

	public int getPostKey() {
		return postKey;
	}

	public void setPostKey(int postKey) {
		this.postKey = postKey;
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

	public int getCommLevel() {
		return commLevel;
	}

	public void setCommLevel(int commLevel) {
		this.commLevel = commLevel;
	}

	public int getCommRef() {
		return commRef;
	}

	public void setCommRef(int commRef) {
		this.commRef = commRef;
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

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	@Override
	public String toString() {
		return "TipBoardComment [key=" + key + ", userKey=" + userKey + ", postKey=" + postKey + ", content=" + content
				+ ", postDate=" + postDate + ", commLevel=" + commLevel + ", commRef=" + commRef + ", status=" + status
				+ ", memberId=" + memberId + ", memberRole=" + memberRole + "]";
	}
	
}
