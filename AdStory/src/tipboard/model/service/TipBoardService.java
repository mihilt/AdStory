package tipboard.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import tipboard.model.dao.TipBoardDAO;
import tipboard.model.vo.TipBoard;

public class TipBoardService {

	private TipBoardDAO tipBoardDAO = new TipBoardDAO();
	
	
	public List<TipBoard> selectTipBoardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<TipBoard> list= tipBoardDAO.selectTipBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}


	public int selectTipBoardCount() {
		Connection conn = getConnection();
		int totalBoardCount = tipBoardDAO.selectTipBoardCount(conn);
		close(conn);
		return totalBoardCount;
	}


	public int insertTipBoard(TipBoard tipBoard) {
		Connection conn = getConnection();
		
		int result = tipBoardDAO.insertTipBoard(conn, tipBoard);

		int boardNo = tipBoardDAO.selectTipBoardLastSeq(conn);
		
		tipBoard.setKey(boardNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

}
