package member.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import member.model.dao.MemberDAO;
import member.model.vo.Member;
import member.model.vo.MemberWishList;
import member.model.vo.MemberWithdraw;
import pointlog.DAO.PointLogDAO;
import pointlog.vo.PointLog;

import static common.JDBCTemplate.*;

public class MemberService {

	public static final String USER_MEMBER_ROLE = "U";
	public static final String ADMIN_MEMBER_ROLE = "A";
	public static final String COMPANY_MEMBER_ROLE = "C";
	
	private MemberDAO memberDAO = new MemberDAO();
	private PointLogDAO pointLogDAO = new PointLogDAO();
	
	public Member selectOne(String memberId) {
		//1. DB Connection객체 생성
		Connection conn = getConnection();
		//2. DAO 처리 요청
		Member member = memberDAO.selectOne(conn, memberId);
		
		//3. DML요청인 경우, Transaction 처리
		//4. Connection 반납(close)
		close(conn);
		
		return member; 
	}

	public int updateMemberPoint(String userId, int pointAmount) {
		//1. DB Connection객체 생성
		Connection conn = getConnection();
		//2. DAO 처리 요청
		int result = memberDAO.updateMemberPoint(conn, userId, pointAmount);
		
		int result2 = pointLogDAO.AdminInsertPointLog(conn, userId, pointAmount);
		
		//3. DML요청인 경우, Transaction 처리
		//4. Connection 반납(close)
		if(result>0 && result2>0 )
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result*result2;
	}

	public int applyWithdraw(String memberId, int pointAmount, String requirements) {
		Connection conn = getConnection();
		
		int result = memberDAO.insertWithdrawLog(conn, memberId, pointAmount, requirements);

		int result2 = memberDAO.updateMemberPoint(conn, memberId, -pointAmount);
		
		int result3 = memberDAO.insertPointLog(conn, memberId, -pointAmount,"O");
		
		if(result>0 && result2>0 && result3>0 )
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result*result2*result3;
	}

	public int memberChargePoint(String memberId, int pointAmount) {
		Connection conn = getConnection();
		
		int result = memberDAO.updateMemberPoint(conn, memberId, pointAmount);
		
		int result2 = memberDAO.insertPointLog(conn, memberId, pointAmount,"I");
		
		if(result>0 && result2>0 )
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result*result2;
	}

	public List<MemberWithdraw> showMemberWithdraw(int cPage, int numPerPage, String memberId) {
		Connection conn = getConnection();
		
		List<MemberWithdraw> list= memberDAO.selectMemberWithdrawList(conn, cPage, numPerPage,memberId);
		
		close(conn);
		return list;
	}

	public int showMemberWithdrawCount(String memberId) {
		Connection conn = getConnection();
		int totalWithdrawCount = memberDAO.showMemberWithdrawCount(conn, memberId);
		close(conn);
		return totalWithdrawCount;
	}

	public List<MemberWithdraw> showAllWithdraw(int cPage, int numPerPage) {
		Connection conn = getConnection();
		
		List<MemberWithdraw> list= memberDAO.selectAllWithdraw(conn, cPage, numPerPage);
		
		close(conn);
		return list;
	}

	public int showAllWithdrawCount() {
		Connection conn = getConnection();
		int totalWithdrawCount = memberDAO.showAllWithdrawCount(conn);
		close(conn);
		return totalWithdrawCount;
	}

	public int checkWithdraw(int key) {
		// TODO Auto-generated method stub
		
		Connection conn = getConnection();
		int result = memberDAO.updateWithdrawStatus(conn, key);
		
		if(result > 0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	public List<Member> selectAll(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = memberDAO.selectAll(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int getTotalContents() {
		Connection conn = getConnection();
		int totalContents = memberDAO.getTotalContents(conn);
		close(conn);
		return totalContents;
	}

	public List<Member> searchMember(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Member> list = memberDAO.searchMember(conn, param); 
		close(conn);
		return list;
	}

	public int getTotalContents(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalContents = memberDAO.getTotalContents(conn, param);
		close(conn);
		return totalContents;
	}
	
	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().insertMember(conn, member);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int insertNomalMember(Member member) {
		
		Connection conn = getConnection();
		int result = new MemberDAO().insertNomalMember(conn, member);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
		
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().updateMember(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	public int updatePassword(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().updatePassword(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = getConnection();
		int result = new MemberDAO().deleteMember(conn, memberId);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}


	public Member selectMail(String email) {
		//1. DB Connection객체 생성
		Connection conn = getConnection();
		//2. DAO 처리 요청
		Member member = memberDAO.selectMail(conn, email);
		
		//3. DML요청인 경우, Transaction 처리
		//4. Connection 반납(close)
		close(conn);
		
		return member; 
	}

	public Member selectPW(String memberId, String name, String email) {

		//1. DB Connection객체 생성
		Connection conn = getConnection();
		//2. DAO 처리 요청

		Member member = memberDAO.selectPW(conn, memberId,name,email);

		
		//3. DML요청인 경우, Transaction 처리
		//4. Connection 반납(close)
		close(conn);

		return member;

	}


	public Member selectId(String name, String email) {

		//1. DB Connection객체 생성
		Connection conn = getConnection();
		//2. DAO 처리 요청

		Member member = memberDAO.selectId(conn,name,email);

		
		//3. DML요청인 경우, Transaction 처리
		//4. Connection 반납(close)
		close(conn);

		return member;
	}

	public List<MemberWishList> selectWishList(int cPage, int numPerPage, int userKey) {
		Connection conn = getConnection();
		List<MemberWishList> list = memberDAO.selectWishList(conn,cPage,numPerPage,userKey);
		close(conn);
		return list;
	}

	public int insertWishList(int userKey, int cUserKey) {
		Connection conn = getConnection();
		int result = memberDAO.insertWishList(conn,userKey,cUserKey);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int deleteWishList(int userKey, int cUserKey) {
		Connection conn = getConnection();
		int result = memberDAO.deleteWishList(conn,userKey,cUserKey);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int selectWishListCount(int userKey) {
		Connection conn = getConnection();
		int totalWishListCount = memberDAO.selectWishListCount(conn, userKey);
		close(conn);
		return totalWishListCount;

	}
	
	
	
}





