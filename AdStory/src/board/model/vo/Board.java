package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable {
	
	private int key;
	private int categoryKey;
	private int userKey;
	private String title;
	private String content;
	private Date enrollDate;
	private String status;
	private int clickPrice;
	private int point;
	private String url;
	private String originalFileName;
	private String renamedFileName;
	private int applyNum;
	
	private String mainImageOrigin;
	private String mainImageRename;

	
	private String refMemberName;
	private String refBoardCategoryName;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Board(int key, int categoryKey, int userKey, String title, String content, Date enrollDate, String status,
			int clickPrice, int point, String url, String originalFileName, String renamedFileName, int applyNum,
			String mainImageOrigin, String mainImageRename) {
		super();
		this.key = key;
		this.categoryKey = categoryKey;
		this.userKey = userKey;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.status = status;
		this.clickPrice = clickPrice;
		this.point = point;
		this.url = url;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.applyNum = applyNum;
		this.mainImageOrigin = mainImageOrigin;
	}
	
	public Board(int key, int categoryKey, int userKey, String title, String content, Date enrollDate, String status,
			int clickPrice, int point, String url, String originalFileName, String renamedFileName, int applyNum,
			String mainImageOrigin, String mainImageRename, String refMemberName, String refBoardCategoryName) {
		
		super();
		this.key = key;
		this.categoryKey = categoryKey;
		this.userKey = userKey;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.status = status;
		this.clickPrice = clickPrice;
		this.point = point;
		this.url = url;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.applyNum = applyNum;
		this.mainImageOrigin = mainImageOrigin;
		this.mainImageRename = mainImageRename;
		this.refMemberName = refMemberName;
		this.refBoardCategoryName = refBoardCategoryName;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public int getCategoryKey() {
		return categoryKey;
	}
	public void setCategoryKey(int categoryKey) {
		this.categoryKey = categoryKey;
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
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getClickPrice() {
		return clickPrice;
	}
	public void setClickPrice(int clickPrice) {
		this.clickPrice = clickPrice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getRenamedFileName() {
		return renamedFileName;
	}
	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}
	public int getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(int applyNum) {
		this.applyNum = applyNum;
	}
	public String getMainImageOrigin() {
		return mainImageOrigin;
	}
	public void setMainImageOrigin(String mainImageOrigin) {
		this.mainImageOrigin = mainImageOrigin;
	}
	public String getMainImageRename() {
		return mainImageRename;
	}
	public void setMainImageRename(String mainImageRename) {
		this.mainImageRename = mainImageRename;
	}
	public String getRefMemberName() {
		return refMemberName;
	}
	public void setRefMemberName(String refMemberName) {
		this.refMemberName = refMemberName;
	}
	public String getRefBoardCategoryName() {
		return refBoardCategoryName;
	}
	public void setRefBoardCategoryName(String refBoardCategoryName) {
		this.refBoardCategoryName = refBoardCategoryName;
	}
	@Override
	public String toString() {
		return "Board [key=" + key + ", categoryKey=" + categoryKey + ", userKey=" + userKey + ", title=" + title
				+ ", content=" + content + ", enrollDate=" + enrollDate + ", status=" + status + ", clickPrice="
				+ clickPrice + ", point=" + point + ", url=" + url + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", applyNum=" + applyNum + ", mainImageOrigin="
				+ mainImageOrigin + ", mainImageRename=" + mainImageRename + ", refMemberName=" + refMemberName
				+ ", refBoardCategoryName=" + refBoardCategoryName + "]";
	}

	

	
	
	
}
