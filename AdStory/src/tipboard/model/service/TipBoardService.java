package tipboard.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import board.model.vo.Board;
import common.Utils;
import member.model.vo.Member;
import tipboard.model.dao.TipBoardDAO;
import tipboard.model.vo.TipBoard;
import tipboard.model.vo.TipBoardComment;

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


	public TipBoard selectOne(int boardNo) {
		Connection conn = getConnection();
		int result = 0;
		
		result = tipBoardDAO.increaseReadCount(conn, boardNo);		
		
		TipBoard tipBoard = tipBoardDAO.selectOne(conn, boardNo);

		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return tipBoard;
	}


	public int recommend(int boardNo) {
		Connection conn = getConnection();
		int result = 0;
		
		result =  tipBoardDAO.recommend(conn,boardNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}


	public int insertTipBoardComment(TipBoardComment tipBoardComment) {
		Connection conn = getConnection();
		int result = tipBoardDAO.insertTipBoardComment(conn, tipBoardComment);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}


	public List<TipBoardComment> selectCommentList(int boardNo) {
		Connection conn = getConnection();
		List<TipBoardComment> commentList
			= tipBoardDAO.selectCommentList(conn, boardNo);
		close(conn);
		return commentList;
	}


	public int deleteTipBoardComment(int boardCommentNo) {
		Connection conn = getConnection();
		int result = tipBoardDAO.deleteTipBoardComment(conn, boardCommentNo);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}


	public int deleteTipBoard(int boardNo) {
		Connection conn = getConnection();
		int result = tipBoardDAO.deleteTipBoard(conn, boardNo);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}


	public int updateTipBoard(TipBoard tipBoard) {
		Connection conn = getConnection();
		int result = tipBoardDAO.updateTipBoard(conn, tipBoard);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}


	public List<TipBoard> selectTipBoardListRecommended(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<TipBoard> list= tipBoardDAO.selectTipBoardListRecommended(conn, cPage, numPerPage);
		close(conn);
		return list;
	}


	public int selectTipBoardListRecommendedCount() {
		Connection conn = getConnection();
		int totalBoardCount = tipBoardDAO.selectTipBoardListRecommendedCount(conn);
		close(conn);
		return totalBoardCount;
	}


	public List<TipBoard> searchPost(Map<String, Object> param) {
		Connection conn = getConnection();
		List<TipBoard> list = tipBoardDAO.searchPost(conn, param); 
		close(conn);
		return list;
	}


	public int searchPostCount(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalContents = tipBoardDAO.searchPostCount(conn, param);
		close(conn);
		return totalContents;
	}




}
