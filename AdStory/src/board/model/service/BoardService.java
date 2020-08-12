package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import board.model.dao.BoardDAO;
import board.model.vo.Board;

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



}





