package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.vo.Comment;

@Service
@Transactional
public class CommentService {
	@Autowired private CommentMapper commentMapper;
	
	public int addComment(Comment comment) {
		Comment co = new Comment();
	    co.setCommentContent(comment.getCommentContent().replaceAll("(?i)<script", "&lt;script"));
	    co.setNoticeId(comment.getNoticeId());
		return commentMapper.insertComment(co);
	}
	
	public int removeComment(int commentId) {
		return commentMapper.removeComment(commentId);
	}
}
