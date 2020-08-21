package enquiry.model.dao;

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


import enquiry.model.vo.Enquiry;


public class EnquiryDAO {
	
	private Properties prop = new Properties();
	
	public EnquiryDAO() {
		try {
			
			String fileName = EnquiryDAO.class.getResource("/sql/enquiry/enquiry-query.properties").getPath();
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	public List<Enquiry> selectEnquiryList(Connection conn, int cPage, int numPerPage) {
		List<Enquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectEnquiryList");
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//시작 rownum과 마지막 rownum 구하는 공식
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Enquiry eq = new Enquiry();
				
				eq.setKey(rset.getInt("key"));
				eq.setTitle(rset.getString("title"));
				eq.setMemberId(rset.getString("member_id"));
				eq.setEnrollDate(rset.getDate("enquiry_date"));
				eq.setStatus(rset.getString("status"));
				
				
				
				list.add(eq);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("list@dao = " + list);
		
		return list;
	}

	public int selectEnquiryCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalMember = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectEnquiryCount");
		
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

	public int insertEnquiry(Connection conn, Enquiry enquiry) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEnquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
//			pstmt.setInt(1, enquiry.getKey());
			pstmt.setInt(1, enquiry.getUserKey());
			pstmt.setString(2, enquiry.getTitle());
			pstmt.setString(3, enquiry.getContent());
//			pstmt.setString(4, enquiry.getMemberId());
//			pstmt.setString(4, enquiry.getAnswer());
//			pstmt.setString(7, enquiry.getStatus());
			
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Enquiry selectOne(Connection conn, int enquiryNo) {
		Enquiry enquiry = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String q = prop.getProperty("selectOneEnquiry");
		
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(q);
			//쿼리문미완성
			pstmt.setInt(1, enquiryNo);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				enquiry = new Enquiry();
				enquiry.setKey(rset.getInt("key"));
				enquiry.setUserKey(rset.getInt("user_key"));
				enquiry.setTitle(rset.getString("title"));
				enquiry.setContent(rset.getString("content"));
				enquiry.setAnswer(rset.getString("answer"));
				enquiry.setMemberId(rset.getString("member_id"));
				
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
			System.out.println("enquiry@dao = " + enquiry);
		}
		
		return enquiry;
	}

	public int deleteEnquiry(Connection conn, int enquiry_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteEnquiry"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, enquiry_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateEnquiry(Connection conn, Enquiry eq) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateEnquiry"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			
			
			pstmt.setString(1, eq.getTitle());
			pstmt.setString(2, eq.getContent());
			pstmt.setInt(3, eq.getKey());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int answerEnquiry(Connection conn, Enquiry enquiry) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("answerEnquiry"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			
			
			pstmt.setString(1, enquiry.getAnswer());
			pstmt.setInt(2, enquiry.getKey());
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



}
