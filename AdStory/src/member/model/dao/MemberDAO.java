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
	
	
	
	

}
