package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import member.model.dao.MemberAdListDAO;
import member.model.vo.MemberAdList;


public class MemberAdListService {
	private MemberAdListDAO memberAdListDAO = new MemberAdListDAO();
	
	public List<MemberAdList> selectMemberAdList(int cPage, int numPerPage, String memberId) {
		Connection conn = getConnection();
		List<MemberAdList> list= memberAdListDAO.selectMemberPointLogList(conn, cPage, numPerPage, memberId);
		close(conn);
		return list;
	}

	public int selectMemberAdListCount(String memberId) {
		Connection conn = getConnection();
		int totalBoardCount = memberAdListDAO.selectMemberAdListCount(conn, memberId);
		close(conn);
		return totalBoardCount;
	}

}
