package kr.co.gdu.cash.vo;

public class Comment {
	private int commentId;
	private int noticeId;
	private String commentContent;
	private String commentDate;
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getCommentContent() {
		return commentContent.replaceAll("(?i)<script", "&lt;script");
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", noticeId=" + noticeId + ", commentContent=" + commentContent
				+ ", commentDate=" + commentDate + "]";
	}
	
}
