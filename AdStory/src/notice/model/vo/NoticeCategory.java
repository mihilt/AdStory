package notice.model.vo;

public class NoticeCategory {

	private int key;
	private String categoryName;
	public NoticeCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeCategory(int key, String categoryName) {
		super();
		this.key = key;
		this.categoryName = categoryName;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "NoticeCategory [key=" + key + ", categoryName=" + categoryName + "]";
	}
	
}
