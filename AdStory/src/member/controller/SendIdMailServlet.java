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
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class SendIdMailServlet
 */
@WebServlet("/member/sendIdMail")
public class SendIdMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendIdMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("receiver");

		Member member = new MemberService().selectMail(email);
		
		boolean isUsable = member == null ? true : false;
		System.out.println("isUsable@servlet = " + isUsable);
		
		
		
		
			
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "jmleeh819@gmail.com");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator auth = new MyAuthentication();
		
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);
		
		
		try {
			//편지보낸 시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress("jmleeh819@gmail.com");
			
			//이메일 발신자
			msg.setFrom(from);
			
			//이메일 수신자
			                //사용자가 입력한 이메일 받아오기
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
		
		
		request.setAttribute("isUsable", isUsable);
		request.setAttribute("email", email);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/member/sendIdMail.jsp");
		
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
