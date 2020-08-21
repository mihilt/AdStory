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
import java.util.Map;
import java.util.Properties;

import board.model.dao.BoardDAO;
import member.model.vo.Member;
import tipboard.model.vo.TipBoard;
import tipboard.model.vo.TipBoardComment;
import tipboard.model.vo.TipBoardWithCommentCnt;

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
				TipBoardWithCommentCnt b = new TipBoardWithCommentCnt();
				
				b.setKey(rset.getInt("key"));
				b.setUserKey(rset.getInt("user_key"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setPostDate(rset.getString("post_date"));
				b.setReadCount(rset.getInt("read_count"));
				b.setRecommend(rset.getInt("recommend"));
				
				b.setMemberId(rset.getString("member_id"));
				b.setMemberRole(rset.getString("member_role"));

				b.setBoardCommentCnt(rset.getInt("comm_cnt"));
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

	public int recommend(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("recommend");
		
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

	public int insertTipBoardComment(Connection conn, TipBoardComment tipBoardComment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertTipBoardComment"); 
		try {
			
			String boardCommentRef = 
					tipBoardComment.getCommRef() == 0 ? null : String.valueOf(tipBoardComment.getCommRef());
	
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, tipBoardComment.getUserKey()); 
			pstmt.setInt(2, tipBoardComment.getPostKey()); 
			pstmt.setString(3, tipBoardComment.getContent()); 
			pstmt.setInt(4, tipBoardComment.getCommLevel());
			pstmt.setString(5, boardCommentRef);
			pstmt.setString(6, tipBoardComment.getStatus());
	
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
	
			
		} finally  {
			close(pstmt);
		} 
		
		return result;
	}

	public List<TipBoardComment> selectCommentList(Connection conn, int boardNo) {
		List<TipBoardComment> commentList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			commentList = new ArrayList<>();
			while(rset.next()) {
				TipBoardComment bc = new TipBoardComment();
				bc.setKey(rset.getInt("key"));
				bc.setUserKey(rset.getInt("user_key"));
				bc.setPostKey(rset.getInt("post_key"));
				bc.setContent(rset.getString("content"));
				bc.setPostDate(rset.getString("post_date"));
				bc.setCommLevel(rset.getInt("comm_level"));
				bc.setCommRef(rset.getInt("comm_ref"));
				bc.setStatus(rset.getString("status"));
				bc.setMemberId(rset.getString("member_id"));
				bc.setMemberRole(rset.getString("member_role"));
				
				commentList.add(bc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return commentList;
	}

	public int deleteTipBoardComment(Connection conn, int boardCommentNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteTipBoardComment"); 
		
		try {

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, boardCommentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteTipBoard(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteTipBoard"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateTipBoard(Connection conn, TipBoard b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateTipBoard"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());;
			pstmt.setInt(3, b.getKey());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<TipBoard> selectTipBoardListRecommended(Connection conn, int cPage, int numPerPage) {
		List<TipBoard> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectTipBoardListRecommended");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rset = pstmt.executeQuery();
			while(rset.next()){
				TipBoardWithCommentCnt b = new TipBoardWithCommentCnt();
				b.setKey(rset.getInt("key"));
				b.setUserKey(rset.getInt("user_key"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setPostDate(rset.getString("post_date"));
				b.setReadCount(rset.getInt("read_count"));
				b.setRecommend(rset.getInt("recommend"));
				
				b.setMemberId(rset.getString("member_id"));
				b.setMemberRole(rset.getString("member_role"));
				
				b.setBoardCommentCnt(rset.getInt("comm_cnt"));
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

	public int selectTipBoardListRecommendedCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalMember = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectTipBoardListRecommendedCount");
		
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

	public List<TipBoard> searchPost(Connection conn, Map<String, Object> param) {
		List<TipBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("searchPost");
		String col = "";
		
		switch(String.valueOf(param.get("searchType"))) {
		case "memberId" : col = "member_id"; break;
		case "title" : col = "title"; break;
		}
		sql = sql.replace("●", col);
		
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
				TipBoardWithCommentCnt b = new TipBoardWithCommentCnt();
				
				b.setKey(rset.getInt("key"));
				b.setUserKey(rset.getInt("user_key"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setPostDate(rset.getString("post_date"));
				b.setReadCount(rset.getInt("read_count"));
				b.setRecommend(rset.getInt("recommend"));
				
				b.setMemberId(rset.getString("member_id"));
				b.setMemberRole(rset.getString("member_role"));
				
				b.setBoardCommentCnt(rset.getInt("comm_cnt"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int searchPostCount(Connection conn, Map<String, Object> param) {
		int totalContents = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchPostCount");
		System.out.println(sql);
		String col = "";
		switch(String.valueOf(param.get("searchType"))) {
		case "memberId" : col = "member_id"; break;
		case "title" : col = "title"; break;
		}
		sql = sql.replace("●", col);
		System.out.println(sql);
		System.out.println(param.get("searchKeyword"));
		
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

}
