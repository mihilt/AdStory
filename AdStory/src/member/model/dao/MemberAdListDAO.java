package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.vo.MemberAdList;
import pointlog.DAO.PointLogDAO;
import pointlog.vo.PointLog;

public class MemberAdListDAO {
	
	private Properties prop = new Properties();
	
	public MemberAdListDAO() {
		try {
			String fileName = PointLogDAO.class.getResource("/sql/member/member-query.properties").getPath();
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}


	public List<MemberAdList> selectMemberAdList(Connection conn, int cPage, int numPerPage, String memberId) {
		List<MemberAdList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberAdList");
		
		try{
			pstmt = conn.prepareStatement(query);
	
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);

			rset = pstmt.executeQuery();
			
			while(rset.next()){
				MemberAdList l = new MemberAdList();

				l.setKey(rset.getInt("key"));
				l.setTitle(rset.getString("title"));
				l.setName(rset.getString("name"));
				l.setStatus(rset.getString("status"));
				l.setPoint(rset.getInt("point"));
				l.setRevenue(rset.getInt("revenue"));

				list.add(l);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int selectMemberAdListCount(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int totalLog = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemberAdListCount");
		
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


	public int selectWithdrawNum(Connection conn) {
		PreparedStatement pstmt = null;
		int num = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectWithdrawNum");
		
		try{
			pstmt = conn.prepareStatement(query);
	
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				num = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return num;
	}


	public int selectNumInquiry(Connection conn) {
		PreparedStatement pstmt = null;
		int num = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectNumInquiry");
		
		try{
			pstmt = conn.prepareStatement(query);
	
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				num = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return num;
	}


}
