package ad.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import ad.model.vo.AdClick;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class AdClickDAO {
	
	private Properties prop = new Properties();
	
	public AdClickDAO() {
		String fileName = "/sql/ad/ad-query.properties";
		fileName =  MemberDAO.class.getResource(fileName)
								   .getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public AdClick selectOne(Connection conn, int num) {
		AdClick a = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		
			rset = pstmt.executeQuery();

			if(rset.next()) {
				
				a = new AdClick();
				
				a.setKey(rset.getInt("key"));
				a.setUserKey(rset.getInt("user_key"));
				a.setPostKey(rset.getInt("post_key"));
				a.setRevenue(rset.getInt("revenue"));
				a.setStatus(rset.getString("status"));
				a.setURL(rset.getString("url"));
				a.setClickPrice(rset.getInt("click_price"));
					
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("AdClick@dao = " + a);
		
		return a;
	}

	public Boolean checkIP(Connection conn, int adListKey, String clientIp) {
		Boolean result = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkIP");
		
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, adListKey);
			pstmt.setString(2, clientIp);
		
			rset = pstmt.executeQuery();

			if(rset.next()) {
				System.out.println("0이냐 1이냐"+rset.getInt("check"));
				if (1 == rset.getInt("check")) {
					result = true;
				}
					
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public Boolean insertIP(Connection conn, int adListKey, String clientIp) {
		int resultPstmt = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertIP"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, adListKey);
			pstmt.setString(2, clientIp);


			resultPstmt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return (resultPstmt>0) ? true : false;
	}

	public Boolean updateUserPoint(Connection conn, int userKey, int clickPrice) {
		int resultPstmt = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserPoint"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, clickPrice);
			pstmt.setInt(2, userKey);

			resultPstmt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return (resultPstmt>0) ? true : false;
	}

	public Boolean updatePostPoint(Connection conn, int postKey, int clickPrice) {
		System.out.println("clickPrice@DAO 단가 = " + clickPrice);
		int resultPstmt = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePostPoint"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, clickPrice);
			pstmt.setInt(2, postKey);

			resultPstmt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return (resultPstmt>0) ? true : false;
	}

	public Boolean insertUserPointLog(Connection conn, int userKey, int postKey, int clickPrice) {
		int resultPstmt = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertUserPointLog"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, userKey);
			pstmt.setInt(2, postKey);
			pstmt.setInt(3, clickPrice);
			pstmt.setInt(4, userKey);


			resultPstmt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return (resultPstmt>0) ? true : false;
	}

	public Boolean updateAdListRevenue(Connection conn, int clickPrice, int userKey, int postKey) {
		int resultPstmt = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateAdListRevenue"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, clickPrice);
			pstmt.setInt(2, userKey);
			pstmt.setInt(3, postKey);



			resultPstmt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return (resultPstmt>0) ? true : false;
	}

	public int checkAdPostRemainPoint(Connection conn, int postKey) {
		int point = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkAdPostRemainPoint");

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postKey);
		
			rset = pstmt.executeQuery();

			if(rset.next()) {
				point = rset.getInt("point");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return point;
	}

	public Boolean updatePostState(Connection conn, int postKey) {
		int resultPstmt = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePostState"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, postKey);

			resultPstmt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return (resultPstmt>0) ? true : false;
	}

}
