package member.model.vo;

import java.io.Serializable;

public class MemberAdList implements Serializable{
	private int key;		//신청목록 키값
	private String title;	//광고게시글 제목
	private String name;	//기업명
	private String status;	//마감여부
	private int point;			//잔여 포인트
	private int revenue;	//0부터 시작해서 업데이트 이루어질 총수익  
	
	public MemberAdList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberAdList(int key, String title, String name, String status, int point, int revenue) {
		super();
		this.key = key;
		this.title = title;
		this.name = name;
		this.status = status;
		this.point = point;
		this.revenue = revenue;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getRevenue() {
		return revenue;
	}

	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}

	@Override
	public String toString() {
		return "MemberAdList [key=" + key + ", title=" + title + ", name=" + name + ", status=" + status + ", point="
				+ point + ", revenue=" + revenue + "]";
	}
	
}
