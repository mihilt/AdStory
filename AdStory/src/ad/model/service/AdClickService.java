package ad.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
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
		
		
		Boolean insertIP = false;
		Boolean updateUserPoint = false;
		Boolean updatePostPoint = false;
		Boolean insertUserPointLog = false;
		Boolean updateAdListRevenue = false;
		
		if("F".equals(adClick.getStatus())) {
			System.out.println("마감된 게시글이 아닙니다. IP 체크를 하겠습니다.");
			
			int adListKey = adClick.getKey();	//따간 광고들 목록 자체 키값
			Boolean checkResult = adClickDAO.checkIP(conn, adListKey ,clientIp);
			
			if(checkResult) {
				System.out.println(clientIp + " 아이피는 해당 광고에 이미 한번 이상 접속한 아이피 입니다.");
				System.out.println("광고시청으로 인한 포인트 변동은 없습니다.");
				
			} else {
				System.out.println("광고 키값 : " + adListKey + " 에 대한 새로운 IP의 광고 접속 : " + clientIp);
				
				int userKey = adClick.getUserKey(); //광고 따간 유저의 키값
				int clickPrice = adClick.getClickPrice(); //단가
				int postKey = adClick.getPostKey(); //게시글 키값
				
//				아이피 목록에 추가
				insertIP = adClickDAO.insertIP(conn, adListKey ,clientIp);
//				일단 테스트 환경을 위해 중복체크 미실시				
				
				//유저 포인트 증가
				updateUserPoint = adClickDAO.updateUserPoint(conn, userKey, clickPrice);
				
				//게시글 포인트 감소
				updatePostPoint = adClickDAO.updatePostPoint(conn, postKey, clickPrice);
						
				//유저 포인트 로그에 넣기
				insertUserPointLog = adClickDAO.insertUserPointLog(conn,userKey,postKey,clickPrice);
				
				//신청목록 테이블 수익 컬럼 업데이트
				updateAdListRevenue = adClickDAO.updateAdListRevenue(conn, clickPrice, userKey, postKey);
				
				//광고게시글 조회를 통해 잔액이 0인 경우 게시글 마감상태로 변경시키고, 아 게시글 리스트 마감게시글 안보이게 처리하자..
				int checkAdPostRemainPoint = adClickDAO.checkAdPostRemainPoint(conn, postKey);
				
				if(checkAdPostRemainPoint <= 0) {
					System.out.println("게시글 마감이 되었습니다.");
					adClickDAO.updatePostState(conn, postKey);
				}
			}
			
		} else {System.out.println("마감된 게시글입니다.");}
		
		//나중에 결과 모아서 오류시 롤백 여기 추가.
		
		if(insertIP && updateUserPoint && updatePostPoint && insertUserPointLog && updateAdListRevenue) {
				commit(conn);
			    System.out.println("광고 시청으로 인한 포인트 변동 로직처리가 완료되었습니다.");
		    }
		else 
			rollback(conn);
		close(conn);
		return adClick; 
	}
	
	

}
