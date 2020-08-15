package pointlog.DAO;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import pointlog.vo.PointLog;
import pointlog.vo.PointLogRanking;

public class PointLogDAO {
	private Properties prop = new Properties();
	
	public PointLogDAO() {
		try {
			String fileName = PointLogDAO.class.getResource("/sql/pointlog/point-log.properties").getPath();
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	public List<PointLog> selectPointLogList(Connection conn, int cPage, int numPerPage) {
		List<PointLog> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPointLogList");
		
		try{
			pstmt = conn.prepareStatement(query);
	
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);

			rset = pstmt.executeQuery();
			
			while(rset.next()){
				PointLog l = new PointLog();

				l.setKey(rset.getInt("key"));
				l.setUserKey(rset.getInt("user_key"));
				l.setPostKey(rset.getInt("post_key"));
				l.setLogDate(rset.getDate("log_date"));
				l.setPoint(rset.getInt("point"));
				l.setStatus(rset.getString("status"));
				l.setRemainPoint(rset.getInt("remain_point"));
				
				l.setRefPostTitle(rset.getString("title"));
				l.setRefMemberId(rset.getString("member_id"));
				l.setLogDateTime(rset.getString("log_date_time"));
				
				list.add(l);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("list@boardDAO = " + list);
		return list;
	}
	
	public List<PointLog> selectMemberPointLogList(Connection conn, int cPage, int numPerPage, String memberId) {
		List<PointLog> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberPointLogList");
		
		try{
			pstmt = conn.prepareStatement(query);
	
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);

			rset = pstmt.executeQuery();
			
			while(rset.next()){
				PointLog l = new PointLog();

				l.setKey(rset.getInt("key"));
				l.setUserKey(rset.getInt("user_key"));
				l.setPostKey(rset.getInt("post_key"));
				l.setLogDate(rset.getDate("log_date"));
				l.setPoint(rset.getInt("point"));
				l.setStatus(rset.getString("status"));
				l.setRemainPoint(rset.getInt("remain_point"));
				
				l.setRefPostTitle(rset.getString("title"));
				l.setRefMemberId(rset.getString("member_id"));
				l.setLogDateTime(rset.getString("log_date_time"));
				
				list.add(l);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("list@boardDAO = " + list);
		return list;
	}
	
	
	
	

	public int selectPointLogCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalLog = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectPointLogCount");
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//쿼리문실행
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalLog = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalLog;
	}
	
	public int selectMemberPointLogCount(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int totalLog = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemberPointLogCount");
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			//쿼리문실행
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalLog = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalLog;
	}

	
//	관리자 포인트 증감 로그 insert (message는 비고 게시글title에 넣어 사용)
	public int AdminInsertPointLog(Connection conn, String userId, int pointAmount) {

		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("AdminInsertSendPointLog"); 
		
		try {

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userId);
			pstmt.setInt(2, pointAmount);
			pstmt.setString(3, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}

	public List<PointLogRanking> PointLogRankingTodayList(Connection conn) {
		List<PointLogRanking> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("PointLogRankingTodayList");
		
		try{
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();
			
			while(rset.next()){
				PointLogRanking l = new PointLogRanking();

				l.setMemberId(rset.getString("member_id"));
				l.setSumPoint(rset.getInt("sum_point"));
				
				
				list.add(l);
			}
			System.out.println("list@DAO = " + list);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("list@boardDAO = " + list);
		return list;
	}






	
	
	
	
	
}
