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
		Board board = null;
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
				Board b = new Board();
				//컬럼명은 대소문자 구분이 없다.
				
				b.setCategoryKey(rset.getInt("category_key"));
				b.setUserKey(rset.getInt("user_key"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setEnrollDate(rset.getDate("date"));
				b.setStatus(rset.getString("status"));
				b.setClickPrice(rset.getInt("click_price"));
				b.setPoint(rset.getInt("point"));
				b.setUrl(rset.getString("url"));
				b.setOriginalFileName(rset.getString("original_file_name"));
				b.setRenamedFileName(rset.getString("renamed_file_name"));
				b.setApplyNum(rset.getString("apply_num"));
				
				b.setRefMemberName(rset.getString("name"));
				b.setRefBoardCategoryName(rset.getString("category_name"));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return board;
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
				b.setApplyNum(rset.getString("apply_num"));
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


}


