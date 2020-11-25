package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	int deleteComment(int noticeId);
}
