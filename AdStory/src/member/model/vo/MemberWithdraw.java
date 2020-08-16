package member.model.vo;

import java.io.Serializable;

public class MemberWithdraw implements Serializable{
	
	private int key;
	private String dateTime;
	private String memberId;
	private String accountName;
	private String accountNum;
	private String withdraw;
	private String requirements;
	private String status;
	
	public MemberWithdraw() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberWithdraw(int key, String dateTime, String memberId, String accountName, String accountNum,
			String withdraw, String requirements, String status) {
		super();
		this.key = key;
		this.dateTime = dateTime;
		this.memberId = memberId;
		this.accountName = accountName;
		this.accountNum = accountNum;
		this.withdraw = withdraw;
		this.requirements = requirements;
		this.status = status;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MemberWithdraw [key=" + key + ", dateTime=" + dateTime + ", memberId=" + memberId + ", accountName="
				+ accountName + ", accountNum=" + accountNum + ", withdraw=" + withdraw + ", requirements="
				+ requirements + ", status=" + status + "]";
	}

	

}
