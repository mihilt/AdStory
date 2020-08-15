package ad.model.vo;

import java.io.Serializable;

public class AdClick implements Serializable{
	private int key;
	private int userKey;
	private int postKey;
	private int revenue;
	private String status;
	private String URL;
	private int clickPrice;
	
	public AdClick() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AdClick(int key, int userKey, int postKey, int revenue, String status, String uRL, int clickPrice) {
		super();
		this.key = key;
		this.userKey = userKey;
		this.postKey = postKey;
		this.revenue = revenue;
		this.status = status;
		URL = uRL;
		this.clickPrice = clickPrice;
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

	public int getRevenue() {
		return revenue;
	}

	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public int getClickPrice() {
		return clickPrice;
	}

	public void setClickPrice(int clickPrice) {
		this.clickPrice = clickPrice;
	}

	@Override
	public String toString() {
		return "AdClick [key=" + key + ", userKey=" + userKey + ", postKey=" + postKey + ", revenue=" + revenue
				+ ", status=" + status + ", URL=" + URL + ", clickPrice=" + clickPrice + "]";
	}
	
}
