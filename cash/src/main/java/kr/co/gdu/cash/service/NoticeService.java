package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	
	// issue : noticeList 호출 중복
	public Map<String, Object> getNoticeAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLatestNoiceList();
		List<Map<String,Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("noticeList",noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	public List<Notice> getNoticeList(){
		return noticeMapper.selectLatestNoiceList();
	}
	
	// 공지사항 목록 페이징
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage) {
		// int currentPage, int rowPerPage -> beginRow
		// noticeMapper 메서드를 호출
		int beginRow = (currentPage-1) * rowPerPage;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Notice> noticeListByPage = noticeMapper.selectNoticeListByPage(map);
		return noticeListByPage;
	}
	
	// 공지사항 입력
	public int addNotice(Notice notice) {
		return noticeMapper.addNotice(notice);
	}
	
	public Notice getNoticeOne(int noticeId){
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	
	public int modifyNotice(Notice notice) {
		return noticeMapper.modifyNotice(notice);
	}
	
	// 공지사항 삭제
	public int removeNotice(int noticeId) {
		return noticeMapper.removeNotice(noticeId);
	}
	
	public int getCountList() {
		return noticeMapper.selectCountList();
	}
}