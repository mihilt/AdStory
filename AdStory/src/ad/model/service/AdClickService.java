package ad.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import ad.model.dao.AdClickDAO;
import ad.model.vo.AdClick;

public class AdClickService {
		AdClickDAO adClickDAO = new AdClickDAO();
	
		
		
	public AdClick click(int num, String clientIp) {
		Connection conn = getConnection();
		
		AdClick adClick = adClickDAO.selectOne(conn, num);
		
		System.out.println("떳냐?"+adClick);
		System.out.println(adClick.getStatus());
		
		if("F".equals(adClick.getStatus())) {
			System.out.println("일단 게시글 마감 아님 이제 IP 체크 하러 가자");
			
			int adListKey = adClick.getKey();	//따간 광고들 목록 자체 키값
			Boolean checkResult = adClickDAO.checkIP(conn, adListKey ,clientIp);
			
			if(checkResult) {
				System.out.println(clientIp + " 아이피는 해당 광고에 이미 한번 이상 접속한 아이피 입니다.");
				
			} else {
				System.out.println("새로운 아이피의 광고 접속!");
				
				int userKey = adClick.getUserKey(); //광고 따간 유저의 키값
				int clickPrice = adClick.getClickPrice(); //단가
				int postKey = adClick.getPostKey();
				
//				아이피 목록에 추가
//				Boolean insertIP = adClickDAO.insertIP(conn, adListKey ,clientIp);
//				System.out.println("insertIP@Service = " + insertIP);
//				일단 테스트 환경을 위해 중복체크 미실시				
				
				//유저 포인트 증가
				Boolean updateUserPoint = adClickDAO.updateUserPoint(conn, userKey, clickPrice);
				System.out.println("updateUserPoint@Service = " + updateUserPoint);
				
				//게시글 포인트 감소
				Boolean updatePostPoint = adClickDAO.updatePostPoint(conn, postKey, clickPrice);
				System.out.println("updatePostPoint@Service = " + updatePostPoint);		
						
				//유저 포인트 로그에 넣기
				Boolean insertUserPointLog = adClickDAO.insertUserPointLog(conn,userKey,postKey,clickPrice);
				System.out.println("insertUserPointLog@Service = " + insertUserPointLog);
				
				//신청목록 테이블 수익 컬럼 업데이트
				Boolean updateAdListRevenue = adClickDAO.updateAdListRevenue(conn, clickPrice, userKey, postKey);
				System.out.println("updateAdListRevenue@Service = " + updateAdListRevenue);
				
				
			}
			
		}
		
		
		close(conn);
		
		return adClick; 
	}
	
	

}
