package pointlog.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import pointlog.DAO.PointLogDAO;
import pointlog.vo.PointLog;
import pointlog.vo.PointLogRanking;

public class PointLogService {
	private PointLogDAO pointLogDAO = new PointLogDAO();

	public List<PointLog> selectPointLogList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<PointLog> list= pointLogDAO.selectPointLogList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectPointLogCount() {
		Connection conn = getConnection();
		int totalBoardCount = pointLogDAO.selectPointLogCount(conn);
		close(conn);
		return totalBoardCount;
	}

	public List<PointLogRanking> PointLogRankingTodayList() {
		Connection conn = getConnection();
		List<PointLogRanking> list= pointLogDAO.PointLogRankingTodayList(conn);
		close(conn);
		return list;
	}

}
