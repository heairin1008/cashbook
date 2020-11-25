package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	int insertNoticefile(Noticefile noticefile);
	List<String> selectNoticefileNameList(int noticeId);
	int deleteNoticefile(int noticeId);
	int removeNoticefileOne(int noticefileId);
}
