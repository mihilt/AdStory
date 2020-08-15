package board.model.vo;

public class BoardCategory {
	int key;
	String categoryName;
	public BoardCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardCategory(int key, String categoryName) {
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
		return "BoardCategory [key=" + key + ", categoryName=" + categoryName + "]";
	}
	
}
