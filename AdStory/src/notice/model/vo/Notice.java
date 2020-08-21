package notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable{

	private int key;
	private int categoryKey;
	private String title;
	private String content;
	private Date enrollDate;
	private String category_name;
	
	
	public Notice(int key, int categoryKey, String title, String content, Date enrollDate, String category_name) {
		super();
		this.key = key;
		this.categoryKey = categoryKey;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.category_name = category_name;
	}


	public Notice(int key, int categoryKey, String title, String content, Date enrollDate) {
		super();
		this.key = key;
		this.categoryKey = categoryKey;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
	}
	
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
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


	public String getCategory_name() {
		return category_name;
	}


	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	@Override
	public String toString() {
		return "Notice [key=" + key + ", categoryKey=" + categoryKey + ", title=" + title + ", content=" + content
				+ ", enrollDate=" + enrollDate + ", category_name=" + category_name + "]";
	}

	
	
	
	
}