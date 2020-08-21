package enquiry.model.service;

import java.sql.Connection;
import java.util.List;

import enquiry.model.dao.EnquiryDAO;
import enquiry.model.vo.Enquiry;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

public class EnquiryService {
	
	private EnquiryDAO enquiryDAO = new EnquiryDAO();
	
	public List<Enquiry> selectEnquiryList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Enquiry> list = enquiryDAO.selectEnquiryList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectEnquiryCount() {
		Connection conn = getConnection();
		int totalenquiryCount = enquiryDAO.selectEnquiryCount(conn);
		close(conn);
		return totalenquiryCount;
	}

	public int insertEnquiry(Enquiry enquiry) {
		Connection conn = getConnection();
		int result = enquiryDAO.insertEnquiry(conn,enquiry);
		

		
		if(result > 0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public Enquiry selectOne(int enquiryNo) {
		Connection conn = getConnection();
		Enquiry enquiry = enquiryDAO.selectOne(conn, enquiryNo);
		close(conn);
		return enquiry;
	}

	public int deleteBoard(int enquiry_no) {
		Connection conn = getConnection();
		int result = enquiryDAO.deleteEnquiry(conn, enquiry_no);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public int updateEnquiry(Enquiry eq) {
		Connection conn = getConnection();
		int result = enquiryDAO.updateEnquiry(conn, eq);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int answerEnquiry(Enquiry enquiry) {
		Connection conn = getConnection();
		int result = enquiryDAO.answerEnquiry(conn, enquiry);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}



}
