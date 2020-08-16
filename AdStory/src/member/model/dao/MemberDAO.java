package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import member.model.vo.Member;
import member.model.vo.MemberWithdraw;
import pointlog.vo.PointLog;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		//MemberDAO객체 생성시, 
		//resources/sql/member/member-query.properties 에 작성된 sql문을
		//필드 prop에 저장한다.
		
		//buildpath /WEB-INF/classes를 루트디렉토리로 참조한다.
		String fileName = "/sql/member/member-query.properties";
		fileName =  MemberDAO.class.getResource(fileName)
								   .getPath();
		System.out.println("fileName@dao = " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

	public Member selectOne(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		System.out.println("sql@memberDAO = " + sql);
		System.out.println("memberId@memberDAO = " + memberId);
		
		try {
			//1. PreparedStatement객체생성, 미완성쿼리 전달
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			//2. 실행 
			rset = pstmt.executeQuery();
			System.out.println("rset@memberDAO = " + rset);
			
			//3.ResultSet -> Member
			if(rset.next()) {
				System.out.println("sefsef" + rset.getDate("enroll_date"));
				
				member = new Member();
				
				member.setKey(rset.getInt("key"));
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("password"));
				member.setMemberRole(rset.getString("member_role"));
				member.setPoint(rset.getInt("point"));
				member.setPhoneNum(rset.getString("phone_num"));
				member.setAccountName(rset.getString("account_name"));
				member.setAccountNum(rset.getString("account_num"));
				member.setBussinessNum(rset.getString("business_num"));
				member.setName(rset.getString("name"));
				member.setEmail(rset.getString("email"));
				member.setAddress(rset.getString("address"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("member@dao = " + member);
		
		return member;
	}


	public int updateMemberPoint(Connection conn, String userId, int pointAmount) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMemberPoint"); 
		
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, pointAmount);
			pstmt.setString(2, userId);

			System.out.println(pstmt);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("result@DAO = " + result);
		return result;
	}


	public int insertWithdrawLog(Connection conn, String memberId, int pointAmount, String requirements) {
		int result = 0;
		pointAmount = (int)(pointAmount * 0.9);	
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertWithdrawLog");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, memberId);
			pstmt.setInt(2, pointAmount);
			pstmt.setString(3, requirements);

			System.out.println(pstmt);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int insertPointLog(Connection conn, String memberId, int pointAmount, String status) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertPointLog"); 
		
		try {

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, memberId);
			pstmt.setInt(2, pointAmount);
			pstmt.setString(3, status);
			pstmt.setString(4, memberId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public List<MemberWithdraw> selectMemberWithdrawList(Connection conn, int cPage, int numPerPage, String memberId) {
		List<MemberWithdraw> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberWithdrawList");
		
		
		System.out.println("아뭐냐구");
		System.out.println(memberId);
		System.out.println((cPage-1)*numPerPage+1);
		System.out.println(cPage*numPerPage);
		
		try{
			pstmt = conn.prepareStatement(query);
	
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);

			rset = pstmt.executeQuery();
			
			while(rset.next()){
				MemberWithdraw w = new MemberWithdraw();

				w.setKey(rset.getInt("key"));
				w.setDateTime(rset.getString("date_time"));
				w.setMemberId(rset.getString("member_id"));
				w.setAccountName(rset.getString("account_name"));
				w.setAccountNum(rset.getString("account_num"));
				w.setWithdraw(rset.getString("withdraw"));
				w.setRequirements(rset.getString("requirements"));
				w.setStatus(rset.getString("status"));
				
				System.out.println("w는"+w);
				list.add(w);
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


	public int showMemberWithdrawCount(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int totalWithdrawCount = 0;
		ResultSet rset = null;
		String query = prop.getProperty("showMemberWithdrawCount");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalWithdrawCount = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalWithdrawCount;
	}




	
	
	
	

}
