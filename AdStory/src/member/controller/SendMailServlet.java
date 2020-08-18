package member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyAuthentication;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/member/verificationCode")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//키벨류형식으로 메일보내는 상태를 저장해서 꺼내쓴다?? 이정도 인것같음 뭔가 보내야해서 입력할때 이 값을 꺼내쓸듯.
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "jmleeh819@gmail.com");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		//보안성 알고리즘인듯
		Authenticator auth = new MyAuthentication();
		
		//getDefaultInstance() 메소드를 호출하면 공유 세션 인스턴스가 반환된다. 즉, 메소드를 호출할 때마다 동일한 세션이 반환된다.
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);
		
		
		try {
			//편지보낸 시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress("jmleeh819@gmail.com");
			
			//이메일 발신자
			msg.setFrom(from);
			
			//이메일 수신자
			String email = request.getParameter("receiver"); //사용자가 입력한 이메일 받아오기
			System.out.println(email);
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			request.setAttribute("email", email);
			
			//이메일 제목
			msg.setSubject("비밀번호 인증번호", "UTF-8");
			
			//이메일 내용
			String code = request.getParameter("code_check"); //인증번호값 받기
			request.setAttribute("code", code);
			System.out.println(code);
			msg.setText(code, "UTF-8");
			
			//이메일 헤더
			msg.setHeader("content-Type", "text/html");
			
			//이메일 보내기
			System.out.println(msg);
			javax.mail.Transport.send(msg);
			System.out.println("보냄");
			
		} catch(AddressException e) {
			e.printStackTrace();
		} catch(MessagingException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/member/verificationCode.jsp");
		
		rd.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
