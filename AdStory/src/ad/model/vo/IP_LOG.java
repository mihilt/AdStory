package ad.model.vo;

import java.io.Serializable;

public class IP_LOG implements Serializable{
	
	private int key;
	private int adListKey;
	private String ip;
	
	public IP_LOG() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public IP_LOG(int key, int adListKey, String ip) {
		super();
		this.key = key;
		this.adListKey = adListKey;
		this.ip = ip;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public int getAdListKey() {
		return adListKey;
	}

	public void setAdListKey(int adListKey) {
		this.adListKey = adListKey;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "IP_LOG [key=" + key + ", adListKey=" + adListKey + ", ip=" + ip + "]";
	}

}
