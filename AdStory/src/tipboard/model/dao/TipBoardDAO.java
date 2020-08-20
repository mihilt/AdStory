package tipboard.model.dao;

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
import tipboard.model.vo.TipBoard;

public class TipBoardDAO {
	private Properties prop = new Properties();
	
	public TipBoardDAO() {
		try {
			String fileName = BoardDAO.class.getResource("/sql/tipboard/tip-board.properties").getPath();
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	public List<TipBoard> selectTipBoardList(Connection conn, int cPage, int numPerPage) {
		List<TipBoard> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectTipBoardList");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rset = pstmt.executeQuery();
			while(rset.next()){
				TipBoard b = new TipBoard();
				b.setKey(rset.getInt("key"));
				b.setUserKey(rset.getInt("user_key"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setPostDate(rset.getString("post_date"));
				b.setReadCount(rset.getInt("read_count"));
				b.setRecommend(rset.getInt("recommend"));
				
				b.setMemberId(rset.getString("member_id"));
				b.setMemberRole(rset.getString("member_role"));

				list.add(b);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int selectTipBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalMember = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectTipBoardCount");
		
		try{
			pstmt = conn.prepareStatement(query);

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

	public int insertTipBoard(Connection conn, TipBoard tipBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTipBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tipBoard.getMemberId());
			pstmt.setString(2, tipBoard.getTitle());
			pstmt.setString(3, tipBoard.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectTipBoardLastSeq(Connection conn) {
		int boardNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTipBoardLastSeq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				boardNo = rset.getInt("key");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return boardNo;
	}

	public int increaseReadCount(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseReadCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public TipBoard selectOne(Connection conn, int boardNo) {
		TipBoard b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOne");
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			if(rset.next()){
				b = new TipBoard();
				
				b.setKey(rset.getInt("key"));
				b.setUserKey(rset.getInt("user_key"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setPostDate(rset.getString("post_date"));
				b.setReadCount(rset.getInt("read_count"));
				b.setRecommend(rset.getInt("recommend"));
				
				b.setMemberId(rset.getString("member_id"));
				b.setMemberRole(rset.getString("member_role"));

			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return b;
	}

}
