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


	
	public List<MemberWithdraw> selectAllWithdraw(Connection conn, int cPage, int numPerPage) {
		List<MemberWithdraw> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllWithdraw");
		
		try{
			pstmt = conn.prepareStatement(query);
	
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);

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
				w.setName(rset.getString("name"));

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


	public int showAllWithdrawCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalWithdrawCount = 0;
		ResultSet rset = null;
		String query = prop.getProperty("showAllWithdrawCount");
		
		try{
			pstmt = conn.prepareStatement(query);
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


	public int updateWithdrawStatus(Connection conn, int key) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;
		String query = prop.getProperty("updateWithdrawStatus");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, key);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public List<Member> selectAll(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Member> list = null;
		String sql = prop.getProperty("selectAllPaging");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			int startRnum = (cPage-1) * numPerPage + 1;
			int endRnum = cPage * numPerPage;
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			

			rset = pstmt.executeQuery();

			list = new ArrayList<>();
			while(rset.next()) {
				Member member = new Member();
				
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

				list.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(rset);
			close(pstmt);
		}

		return list;
	}


	public int getTotalContents(Connection conn) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getTotalContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContents = rset.getInt("total_contents");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}


	public List<Member> searchMember(Connection conn, Map<String, Object> param) {
		List<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("searchMemberPaging");
		String col = "";
		switch(String.valueOf(param.get("searchType"))) {
		case "memberId" : col = "member_id"; break;
		case "memberName" : col = "name"; break;
		}
		sql = sql.replace("●", col);
		System.out.println("sql@dao = " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + param.get("searchKeyword") + "%");
			
			int cPage = (int)param.get("cPage");
			int numPerPage = (int)param.get("numPerPage");			
			pstmt.setInt(2, (cPage-1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				Member member = new Member();
				
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
				
				list.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("list@dao = " + list);
		return list;
	}


	public int getTotalContents(Connection conn, Map<String, Object> param) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSearchTotalContents");
		System.out.println(sql);
		String col = "";
		switch(String.valueOf(param.get("searchType"))) {
		case "memberId" : col = "member_id"; break;
		case "memberName" : col = "name"; break;
		}
		sql = sql.replace("●", col);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + param.get("searchKeyword") + "%");
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContents = rset.getInt("total_contents");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}
	
	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMember"); 
		System.out.println(member);
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getPhoneNum());
			pstmt.setString(4, member.getAccountName());
			pstmt.setString(5, member.getAccountNum());
			pstmt.setString(6, member.getBussinessNum());
			pstmt.setString(7, member.getName());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertNomalMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertNomalMember"); 
		System.out.println(member);
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getPhoneNum());
			pstmt.setString(4, member.getAccountName());
			pstmt.setString(5, member.getAccountNum());
			pstmt.setString(6, member.getName());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember"); 

		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPhoneNum());
			pstmt.setString(3, member.getAccountName());
			pstmt.setString(4, member.getAccountNum());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getMemberId());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updatePassword(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePassword"); 

		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMemberId());
			
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


	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember"); 

		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, memberId);
			
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


	public Member selectMail(Connection conn, String email) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMail");
		System.out.println("sql@memberDAO = " + sql);
		System.out.println("email@memberDAO = " + email);
		
		try {
			//1. PreparedStatement객체생성, 미완성쿼리 전달
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
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


	public Member selectPW(Connection conn, String memberId, String name, String email) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPW");
		System.out.println("sql@memberDAO = " + sql);
		System.out.println("email@memberDAO = " + email);
		
		try {
			//1. PreparedStatement객체생성, 미완성쿼리 전달
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);
			pstmt.setString(2, name);
			pstmt.setString(3, email);

			
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

	

}
