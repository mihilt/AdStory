package board.model.dao;
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
import board.model.vo.Board;
import board.model.vo.BoardCategory;
import board.model.vo.BoardComment;
import member.model.vo.MemberAdList;
public class BoardDAO {
	private Properties prop = new Properties();
	
	public BoardDAO() {
		try {
			//클래스객체 위치찾기 : 절대경로를 반환한다.
			String fileName = BoardDAO.class.getResource("/sql/board/board-query.properties").getPath();
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	public Board selectOne(Connection conn, int board_no) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOne");
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, board_no);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			if(rset.next()){
				b = new Board();
				//컬럼명은 대소문자 구분이 없다.
				b.setKey(rset.getInt("key"));
				b.setCategoryKey(rset.getInt("category_key"));
//			System.out.println("rset"+rset.getInt("category_key"));
				b.setUserKey(rset.getInt("user_key"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setEnrollDate(rset.getDate("enroll_date"));
				b.setStatus(rset.getString("status"));
				b.setClickPrice(rset.getInt("click_price"));
				b.setPoint(rset.getInt("point"));
				b.setUrl(rset.getString("url"));
				b.setOriginalFileName(rset.getString("original_file_name"));
				b.setRenamedFileName(rset.getString("renamed_file_name"));
				b.setApplyNum(rset.getInt("apply_num"));
				b.setMainImageOrigin(rset.getString("main_image_origin"));
				b.setMainImageRename(rset.getString("main_image_rename"));
				
				b.setRefMemberName(rset.getString("name"));
				b.setRefBoardCategoryName(rset.getString("category_name"));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("selectOne@dao = "+b);
		return b;
	}
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerPage) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBoardList");
		
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
				Board b = new Board();
				//컬럼명은 대소문자 구분이 없다.
				b.setKey(rset.getInt("key"));
				b.setCategoryKey(rset.getInt("category_key"));
				b.setUserKey(rset.getInt("user_key"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setEnrollDate(rset.getDate("enroll_date"));
				b.setStatus(rset.getString("status"));
				b.setClickPrice(rset.getInt("click_price"));
				b.setPoint(rset.getInt("point"));
				b.setUrl(rset.getString("url"));
				b.setOriginalFileName(rset.getString("original_file_name"));
				b.setRenamedFileName(rset.getString("renamed_file_name"));
				b.setApplyNum(rset.getInt("apply_num"));
				b.setMainImageOrigin(rset.getString("main_image_origin"));
				b.setMainImageRename(rset.getString("main_image_rename"));
				
				b.setRefMemberName(rset.getString("name"));
				b.setRefBoardCategoryName(rset.getString("category_name"));
				
//				System.out.println("b = "+b);
				
				list.add(b);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
//		System.out.println("list@boardDAO = " + list);
		return list;
	}
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalMember = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectBoardCount");
		
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
	public int insertBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		//insert into board
		//values (seq_board_no.nextval, ?, ?, ?, ?, ?, default, default)
		//(SEQ_AD_POST.NEXTVAL, 1, 1, '오렌지 상품 홍보','오렌지 어쩌구저쩌구 ㅁㄴㅇㄹ',
		//SYSDATE, DEFAULT, 500, 1000000, 'https://kr.sunkist.com/',
		//NULL, NULL, DEFAULT, NULL);
		//values (seq_ad_post.nextval,?,?,?,?,sysdate,default,?,?,?,?,?,default,default,null)
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getCategoryKey());
			pstmt.setInt(2, board.getUserKey());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getClickPrice());
			pstmt.setInt(6, board.getPoint());
			pstmt.setString(7, board.getUrl());
			pstmt.setString(8, board.getOriginalFileName());
			pstmt.setString(9, board.getRenamedFileName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
//		System.out.println("resultBoard@dao = " + board);
		
		return result;
	}
	public List<BoardCategory> selectCategoryList(Connection conn) {
		List<BoardCategory> categoryList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBoardCategoryList");
		
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				BoardCategory b = new BoardCategory();
				//컬럼명은 대소문자 구분이 없다.
				b.setKey(rset.getInt("key"));
				b.setCategoryName(rset.getString("category_name"));
				
//				System.out.println("b = "+b);
				
				categoryList.add(b);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("categorylist@boardDAO = " + categoryList);
		return categoryList;
	}
	public int insertPointLog(Connection conn, int userKey,int postKey, int point) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPointLog");
		//insert into pnt_log values (seq_pnt_log.nextval,?,?,sysdate,?,?,(select point from member where key=?)-?)
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userKey);
			pstmt.setInt(2, postKey);
			pstmt.setInt(3, point);
			pstmt.setString(4, "E");
			pstmt.setInt(5, userKey);
			pstmt.setInt(6, point);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("result@dao = " + result);
		
		return result;
	}
	public int selectBoardLastSeq(Connection conn) {
		int boardNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardLastSeq");
		
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
//		System.out.println("boardNo@dao = " + boardNo);
		
		return boardNo;
	}
	public int insertAdList(Connection conn, int postKey, int userKey) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdList");
//		insert into pnt_log values (seq_pnt_log.nextval,?,?,sysdate,?,?,(select point from member where key=?)-?)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userKey);
			pstmt.setInt(2, postKey);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("urlresult@dao = " + result);
		
		return result;
	}

	public int selectAdList(Connection conn, int userKey, int postKey) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result=0;
		String query = prop.getProperty("selectAdList");
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, userKey);
			pstmt.setInt(2, postKey);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("selectAdList@dao = "+result);
		return result;
	}

	public List<Board> selectMemberBoardList(Connection conn, int cPage, int numPerPage, String memberId) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemberBoardList");
		
		try{
			pstmt = conn.prepareStatement(query);
	
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);

			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Board b = new Board();
				b.setKey(rset.getInt("key"));
				b.setTitle(rset.getString("title"));
				b.setStatus(rset.getString("status"));
				b.setPoint(rset.getInt("point"));

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

	public int selectMemberBoardListCount(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int totalLog = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemberBoardListCount");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
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

	public List<Board> searchBoard(Connection conn, Map<String, Object> param) {
		List<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchBoardPaging");
		String col ="";
		switch(String.valueOf(param.get("searchType"))) {
		case "title" : col = "title"; break;
		case "memberName" : col = "name"; break;
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
				Board board = new Board();
				
				board.setKey(rset.getInt("key"));
				board.setCategoryKey(rset.getInt("category_key"));
				board.setUserKey(rset.getInt("user_key"));
				board.setTitle(rset.getString("title"));
				board.setContent(rset.getString("content"));
				board.setEnrollDate(rset.getDate("enroll_date"));
				board.setStatus(rset.getString("status"));
				board.setClickPrice(rset.getInt("click_price"));
				board.setPoint(rset.getInt("point"));
				board.setUrl(rset.getString("url"));
				board.setOriginalFileName(rset.getString("original_file_name"));
				board.setRenamedFileName(rset.getString("renamed_file_name"));
				board.setApplyNum(rset.getInt("apply_num"));
				board.setMainImageOrigin(rset.getString("main_image_origin"));
				board.setMainImageRename(rset.getString("main_image_rename"));
				
				board.setRefMemberName(rset.getString("name"));
				board.setRefBoardCategoryName(rset.getString("category_name"));
				
				
				list.add(board);
			}
			
			
		}catch (SQLException e) {
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
		String col = "";
		switch(String.valueOf(param.get("searchType"))) {
		case "title" : col = "title"; break;
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

	public int deleteBoardComment(Connection conn, int boardCommentNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteBoardComment"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, boardCommentNo);
			
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

	public int insertBoardComment(Connection conn, BoardComment boardComment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertBoardComment"); 
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문 변수대입
			pstmt.setInt(1, boardComment.getPostKey()); 
			pstmt.setInt(2, boardComment.getUserKey());
			pstmt.setString(3, boardComment.getContent());
			pstmt.setInt(4, boardComment.getCommentLevel());
//			pstmt.setInt(5, boardComment.getBoardCommentRef());
			String boardCommentRef = 
					boardComment.getCommentRef() == 0 ?
							null : 
								String.valueOf(boardComment.getCommentRef());
			
			pstmt.setString(5, boardCommentRef);
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
//			throw new BoardException("댓글 등록 오류", e);
			
		} finally  {
			close(pstmt);
		} 
		
		return result;
	}

	public List<BoardComment> selectCommentList(Connection conn, int boardNo) {
		List<BoardComment> commentList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			commentList = new ArrayList<>();
			while(rset.next()) {
				BoardComment bc = new BoardComment();
				bc.setKey(rset.getInt("key"));
				bc.setPostKey(rset.getInt("post_key"));
				bc.setUserKey(rset.getInt("user_key"));
				bc.setContent(rset.getString("content"));
				bc.setCommentDate(rset.getDate("comment_date"));
				bc.setCommentLevel(rset.getInt("comment_level"));
				bc.setCommentRef(rset.getInt("comment_ref"));
				bc.setStatus(rset.getString("status"));
				bc.setRefMemberName(rset.getString("name"));

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

	public int updateBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateBoard"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getOriginalFileName());
			pstmt.setString(4, board.getRenamedFileName());
			pstmt.setInt(5, board.getKey());
			
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

	public int deleteBoard(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteBoard"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성;
			pstmt.setInt(1, boardNo);
			
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

	public int updateBoardApply(Connection conn, int postKey) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateBoardApply"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성;
			pstmt.setInt(1, postKey);
			pstmt.setInt(2, postKey);
			
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

}