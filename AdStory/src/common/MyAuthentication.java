package common;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	
	PasswordAuthentication pa;
	
	public MyAuthentication() {
		
		String id = "adstory.kh@gmail.com";
		String password = "!adstory123";
		
		//아이디와 비밀번호를 입력한다.
		pa = new PasswordAuthentication(id,password);
			
	}
	//시스템에 사용
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

}
