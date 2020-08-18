package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.BoardCategory;
import board.model.vo.BoardComment;
import member.model.dao.MemberDAO;
import member.model.vo.MemberAdList;

public class BoardService {

	private BoardDAO boardDAO = new BoardDAO();

	public int selectBoardCount() {
		Connection conn = getConnection();
		int totalBoardCount = boardDAO.selectBoardCount(conn);
		close(conn);
		return totalBoardCount;
	}
	
	public Board selectOne(int boardNo) {
		Connection conn = getConnection();
		Board board = boardDAO.selectOne(conn, boardNo);
		close(conn);
		return board;
	}
	
	public List<Board> selectBoardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> list= boardDAO.selectBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public List<BoardCategory> selectCategoryList() {
		Connection conn = getConnection();
		List<BoardCategory> categoryList = boardDAO.selectCategoryList(conn);
		close(conn);
		return categoryList;
	}

	public int insertBoard(Board board,String memberId,int userKey, int point) {
		Connection conn = getConnection();

		int result = boardDAO.insertBoard(conn, board);
//		System.out.println("insertResult@service="+result);
		// 방금 추가된 게시글 번호 가져오기
		int boardNo = boardDAO.selectBoardLastSeq(conn);
		board.setKey(boardNo);
		int pointr = boardDAO.insertPointLog(conn,userKey,boardNo,-point);
//		System.out.println("point@service = "+pointr);
		int updater = new MemberDAO().updateMemberPoint(conn, memberId, -point);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;

	}

	public int insertAdList(int postKey, int userKey) {
		Connection conn = getConnection();
		int result = boardDAO.insertAdList(conn, postKey,userKey);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int selectAdList(int userKey, int postKey) {
		Connection conn = getConnection();
		int result = boardDAO.selectAdList(conn, userKey,postKey);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public List<Board> selectMemberBoardList(int cPage, int numPerPage, String memberId) {
		Connection conn = getConnection();
		List<Board> list= boardDAO.selectMemberBoardList(conn, cPage, numPerPage, memberId);
		close(conn);
		return list;
	}

	public int selectMemberBoardListCount(String memberId) {
		Connection conn = getConnection();
		int totalBoardCount = boardDAO.selectMemberBoardListCount(conn, memberId);
		close(conn);
		return totalBoardCount;
	}

	public List<Board> searchBoard(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Board> list = boardDAO.searchBoard(conn, param); 
		close(conn);
		return list;
	}

	public int getTotalContents(Map<String, Object> param) {
		Connection conn = getConnection();

		int totalContents = boardDAO.getTotalContents(conn, param);
		close(conn);
		return totalContents;
	}

	public int deleteBoardComment(int boardCommentNo) {
		Connection conn = getConnection();
		int result = boardDAO.deleteBoardComment(conn, boardCommentNo);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public int insertBoardComment(BoardComment boardComment) {
		Connection conn = getConnection();
		int result = boardDAO.insertBoardComment(conn, boardComment);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public List<BoardComment> selectCommentList(int boardNo) {
		Connection conn = getConnection();
		List<BoardComment> commentList
			= boardDAO.selectCommentList(conn, boardNo);
		close(conn);
		return commentList;
	}

	public int updateBoard(Board board) {
		Connection conn = getConnection();
		int result = boardDAO.updateBoard(conn, board);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = boardDAO.deleteBoard(conn, boardNo);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public int updateBoardApply(int postKey) {
		Connection conn = getConnection();
		int result = boardDAO.updateBoardApply(conn, postKey);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}





