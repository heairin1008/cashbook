package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	// 공지 목록
	@GetMapping(value="/admin/noticeList/{currentPage}")
	public String noticeList(Model model,
							@PathVariable(value="currentPage") int currentPage) {
		System.out.println("공지 목록페이지 실행");
		int rowPerPage = 10;
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		
		int totalCount = noticeService.getCountList();
		int lastPage = 0;
		
		if((totalCount%rowPerPage) == 0) {
			lastPage = totalCount%rowPerPage;
		}else {
			lastPage = (totalCount%rowPerPage)+1;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("noticeList", noticeList);
		// noticeService 호출
		return "noticeList";
	}
	
	// 공지 입력 폼
	@GetMapping(value="/admin/addNotice")
	public String addNoitce() {
		System.out.println("입력 폼 실행");
		return "addNotice";
	}
	// 공지 입력 액션
	@PostMapping(value="/admin/addNotice")
	public String addNotice(Notice notice) {
		System.out.println("입력 폼 액션 실행");
		noticeService.addNotice(notice);
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지 상세페이지
	@GetMapping(value="/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model, 
							@PathVariable(value="noticeId") int noticeId) {
		System.out.println("상세페이지 실행");
		Notice noticeOne = noticeService.getNoticeOne(noticeId);
		model.addAttribute("noticeOne", noticeOne);
		
		return "noticeOne";
	}

	// 공지 삭제
	@GetMapping(value="/admin/removeNotice/{noticeId}")
	public String removeNotice(@PathVariable(value = "noticeId") int noticeId) {
		System.out.println("삭제 실행");
		noticeService.removeNotice(noticeId);
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지 수정 폼
	@GetMapping(value="/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model, @PathVariable(value="noticeId") int noticeId) {
		System.out.println("modifyNotice 폼 실행");
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "modifyNotice";
	}
	
	// 공지 수정 액션
	@PostMapping(value="/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		System.out.println("modifyNotice 실행");
		noticeService.modifyNotice(notice);
		return "redirect:/admin/noticeOne/"+notice.getNoticeId();
	}
}
