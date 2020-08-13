package pointlog.vo;

public class PointLogRanking {
	private String memberId;
	private int sumPoint;
	
	public PointLogRanking() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointLogRanking(String memberId, int sumPoint) {
		super();
		this.memberId = memberId;
		this.sumPoint = sumPoint;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getSumPoint() {
		return sumPoint;
	}

	public void setSumPoint(int sumPoint) {
		this.sumPoint = sumPoint;
	}

	@Override
	public String toString() {
		return "PointLogRanking [memberId=" + memberId + ", sumPoint=" + sumPoint + "]";
	}

}
