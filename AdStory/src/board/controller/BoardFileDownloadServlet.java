package board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardFileDownloadServlet
 */
@WebServlet("/board/fileDownload")
public class BoardFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.사용자입력값처리
		String rName = request.getParameter("rName");
		String oName = request.getParameter("oName");
		System.out.println("rNaame = "+rName);
		System.out.println("oName = "+oName);
		
		//2.입출력 스트림 생성
		// C:/.../WebContent/upload/board/20200803_171039_810.png
		String saveDirectory = getServletContext().getRealPath("/upload/board-images");
		File downFile = new File( saveDirectory,rName);
		//throws IOException으로 예외 던지므로 따로 예외처리 필요없음
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		//3.응답헤더작성
		String userAgent = request.getHeader("user-agent");
		//IE 브라우져엔진명 Trient
		boolean isMSIE = userAgent.indexOf("Trident") != -1;
		if(isMSIE) {
			//%인코딩처리
			//공백 + -> %20  //공백이 +로 나오므로
			oName =URLEncoder.encode(oName,"utf-8")
							 .replaceAll("\\+", "%20");
			
		}else {
			//utf-8인코딩을 iso-8859-1인코딩으로 변환
			oName = new String(oName.getBytes("utf-8"),"iso-8859-1");
		}
		System.out.println(oName);
		
		
		//utf-8 인코딩을 iso-8859-1인코딩으로 변환
//		oName = new String(oName.getBytes("utf-8"),"iso-8859-1");
		//이진데이터 전송을 위한 content(MIME) type
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachement;filename="+oName);
		
		//4.파일 입출력
		//입력 : 서버 컴퓨터의 파일(rName)
		//출력 : 응답에 쓰기
		int data = -1;
		while((data = bis.read())!= -1) {
			bos.write(data);
		}
		bis.close();
		bos.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
