package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.NewNoticeService;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NewNoticeController {
	@Autowired
	private NewNoticeService newNoticeService;
	
		// 공지 목록
	@GetMapping(value="/admin/newNoticeList/{currentPage}")
	public String noticeList(Model model,
							@PathVariable(value="currentPage") int currentPage) {
		System.out.println("공지 목록페이지 실행");
		int rowPerPage = 10;
		List<Notice> noticeList = newNoticeService.getNoticeListByPage(currentPage, rowPerPage);
			
		int totalCount = newNoticeService.getCountList();
		int lastPage = 0;
			
		if((totalCount%rowPerPage) == 0) {
			lastPage = totalCount/rowPerPage;
		}else {
			lastPage = (totalCount/rowPerPage)+1;
		}
		 // 페이징 변수
		int navbarPerPage = 10;
		int navbarFirst = 0;
		int navbarLast = 0;
			
		if((currentPage / navbarPerPage) == 0) {
			navbarFirst = 1;
			navbarLast = 10;
		}else if((currentPage % navbarPerPage) == 0){
			navbarFirst = (currentPage / navbarPerPage) * 10 - 9;
			navbarLast = (currentPage / navbarPerPage) * 10 ;
		}else {
			navbarFirst = (currentPage / navbarPerPage) * 10 + 1;
			navbarLast = (currentPage / navbarPerPage) * 10 + 10;
		}
			
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("noticeList", noticeList);
			
		model.addAttribute("navbarPerPage", navbarPerPage);
		model.addAttribute("navbarFirst", navbarFirst);
		model.addAttribute("navbarLast", navbarLast);	
		// noticeService 호출
		return "newNoticeList";
	}
	
	@GetMapping("/admin/addNewNotice")
	public String addNotice() {
		// 공지 입력 폼
		return "addNewNotice";
	}
	
	@PostMapping("/admin/addNewNotice")
	public String addNotice(NoticeForm noticeForm) {
		newNoticeService.addNotice(noticeForm);
		return "redirect:/admin/newNoticeList/1";
	}
}
