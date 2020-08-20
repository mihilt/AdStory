package tipboard.model.dao;

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

import board.model.dao.BoardDAO;
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
				
				b.setMemberId(rset.getString("name"));
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

}
