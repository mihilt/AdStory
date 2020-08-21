package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;
import notice.model.vo.NoticeCategory;

public class NoticeService {
	
	private NoticeDAO noticeDAO = new NoticeDAO();

	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Notice> list = noticeDAO.selectNoticeList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectNoticeCount() {
		Connection conn = getConnection();
		int totalnoticeCount = noticeDAO.selectNoticeCount(conn);
		close(conn);
		return totalnoticeCount;
	}

	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int result = noticeDAO.insertNotice(conn,notice);
		
		//방금 추가된 게시글 번호 가져오기
//				int key = noticeDAO.selectBoardLastSeq(conn);
//				notice.setKey(key);
		
		if(result > 0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public Notice selectOne(int noticeNo) {
		Connection conn = getConnection();
		Notice notice = noticeDAO.selectOne(conn, noticeNo);
		close(conn);
		
		
		
		return notice;
		
	}

	public int deleteNotice(int notice_no) {
		Connection conn = getConnection();
		int result = noticeDAO.deleteNotice(conn, notice_no);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = noticeDAO.updateNotice(conn, n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<NoticeCategory> selectCategoryList() {
		Connection conn = getConnection();
		List<NoticeCategory> categoryList = noticeDAO.selectCategoryList(conn);
		close(conn);
		return categoryList;
	}

}
