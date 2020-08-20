package tipboard.model.vo;

import java.io.Serializable;

public class TipBoardWithCommentCnt extends TipBoard implements Serializable{
	private int boardCommentCnt;

	public TipBoardWithCommentCnt() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TipBoardWithCommentCnt(int key, int userKey, String title, String content, String postDate, int readCount,
			int recommend, String memberId, String memberRole) {
		super(key, userKey, title, content, postDate, readCount, recommend, memberId, memberRole);
		// TODO Auto-generated constructor stub
	}

	public int getBoardCommentCnt() {
		return boardCommentCnt;
	}

	public void setBoardCommentCnt(int boardCommentCnt) {
		this.boardCommentCnt = boardCommentCnt;
	}

	@Override
	public String toString() {
		return "TipBoardWithCommentCnt [boardCommentCnt=" + boardCommentCnt + ", getBoardCommentCnt()="
				+ getBoardCommentCnt() + ", getKey()=" + getKey() + ", getUserKey()=" + getUserKey() + ", getTitle()="
				+ getTitle() + ", getContent()=" + getContent() + ", getPostDate()=" + getPostDate()
				+ ", getReadCount()=" + getReadCount() + ", getRecommend()=" + getRecommend() + ", getMemberId()="
				+ getMemberId() + ", getMemberRole()=" + getMemberRole() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

	

}
