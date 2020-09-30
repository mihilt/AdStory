package notice.model.dao;

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

import notice.model.vo.Notice;
import notice.model.vo.NoticeCategory;

public class NoticeDAO {
	
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		try {
			//클래스객체 위치찾기 : 절대경로를 반환한다. 
			String fileName = NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalMember = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectNoticeCount");
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//쿼리문실행
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalMember = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalMember;
	}

	public List<Notice> selectNoticeList(Connection conn, int cPage, int numPerPage) {
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectNoticeList");
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//시작 rownum과 마지막 rownum 구하는 공식
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Notice n = new Notice();
				
				n.setKey(rset.getInt("key"));
				n.setCategory_name(rset.getString("CATEGORY_NAME"));
				n.setTitle(rset.getString("title"));		
				n.setEnrollDate(rset.getDate("date"));
				
				
				
				list.add(n);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertNotice(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice.getCategoryKey());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
						
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Notice selectOne(Connection conn, int noticeNo) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOneNotice");
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, noticeNo);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				notice = new Notice();
				notice.setKey(rset.getInt("key"));
				notice.setTitle(rset.getString("title"));
				notice.setContent(rset.getString("CONTENT"));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return notice;
	}

	public int deleteNotice(Connection conn, int notice_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteNotice"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, notice_no);
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateNotice"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, n.getCategoryKey());
			pstmt.setString(2, n.getTitle());
			pstmt.setString(3, n.getContent());
			pstmt.setInt(4, n.getKey());
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<NoticeCategory> selectCategoryList(Connection conn) {
		List<NoticeCategory> categoryList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectCatogoryList");

		try {
			// 미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			// 쿼리문실행
			// 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();

			while (rset.next()) {
				NoticeCategory n = new NoticeCategory();
				
			
				n.setKey(rset.getInt("key"));
				n.setCategoryName(rset.getString("category_name"));

//				System.out.println("n = "+n);

				categoryList.add(n);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
//		System.out.println("categorylist@boardDAO = " + categoryList);
		return categoryList;
	}


}
