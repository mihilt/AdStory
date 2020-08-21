package member.model.vo;

public class MemberWishList {
	private int key;
	private int userKey;
	private int cUserKey;
	
	private String refCUserName;
	private String refPhoneNum;
	private String refEmail;
	private String refAddress;
	public MemberWishList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberWishList(int key, int userKey, int cUserKey) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.cUserKey = cUserKey;
	}
	
	
	public MemberWishList(int key, int userKey, int cUserKey, String refCUserName, String refPhoneNum, String refEmail,
			String refAddress) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.cUserKey = cUserKey;
		this.refCUserName = refCUserName;
		this.refPhoneNum = refPhoneNum;
		this.refEmail = refEmail;
		this.refAddress = refAddress;
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
	public int getCUserKey() {
		return cUserKey;
	}
	public void setCUserKey(int cUserKey) {
		this.cUserKey = cUserKey;
	}
	
	public String getRefCUserName() {
		return refCUserName;
	}
	public void setRefCUserName(String refCUserName) {
		this.refCUserName = refCUserName;
	}
	
	public String getRefPhoneNum() {
		return refPhoneNum;
	}
	public void setRefPhoneNum(String refPhoneNum) {
		this.refPhoneNum = refPhoneNum;
	}
	public String getRefEmail() {
		return refEmail;
	}
	public void setRefEmail(String refEmail) {
		this.refEmail = refEmail;
	}
	public String getRefAddress() {
		return refAddress;
	}
	public void setRefAddress(String refAddress) {
		this.refAddress = refAddress;
	}
	@Override
	public String toString() {
		return "MemberWishList [key=" + key + ", userKey=" + userKey + ", cUserKey=" + cUserKey + ", refCUserName="
				+ refCUserName + ", refPhoneNum=" + refPhoneNum + ", refEmail=" + refEmail + ", refAddress="
				+ refAddress + "]";
	}

	
}
