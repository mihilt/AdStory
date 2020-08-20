package tipboard.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

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

}
