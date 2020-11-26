package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;

@Mapper
public interface CommentMapper {
	int deleteComment(int noticeId);
	int insertComment(Comment comment);
	int removeComment(int commentId);
}
