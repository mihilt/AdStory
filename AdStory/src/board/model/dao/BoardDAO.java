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
import java.util.Properties;
import board.model.vo.Board;
import board.model.vo.BoardCategory;
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
				b.setMainImage(rset.getString("main_image"));
				
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
}