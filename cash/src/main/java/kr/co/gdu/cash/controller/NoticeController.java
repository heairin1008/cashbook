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
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
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
		return "noticeList";
	}
	
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		// 공지 입력 폼
		return "addNotice";
	}
	
	@PostMapping("/admin/addNotice")
	public String addNotice(NoticeForm noticeForm) {
		noticeService.addNotice(noticeForm);
		System.out.println(noticeForm);
		return "redirect:/admin/noticeList/1";
	}
	
	@GetMapping("/admin/noticeOne")
	public String noticeOne(Model model, @RequestParam(value="noticeId") int noticeId) {
		Notice noticeOne = noticeService.getNoticeOne(noticeId);
		model.addAttribute("noticeOne", noticeOne);
		return "noticeOne";
	}
	
	@GetMapping("/admin/removeNotice")
	public String removeNotice(@RequestParam(value="noticeId") int noticeId) {
		System.out.println(noticeId);
		noticeService.removeNotice(noticeId);
		return "redirect:/admin/noticeList/1";
	}
	
	@GetMapping("/admin/modifyNotice")
	public String modifyNotice(Model model, @RequestParam(value="noticeId") int noticeId) {
		Notice noticeOne = noticeService.getNoticeOne(noticeId);
		model.addAttribute("noticeOne", noticeOne);
		return "modifyNotice";
	}
	
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(NoticeForm noticeForm) {
		System.out.println(noticeForm);
		noticeService.modifyNotice(noticeForm);
		return "redirect:/admin/noticeOne?noticeId="+noticeForm.getNoticeId();
	}
	
	@GetMapping("/admin/delfile")
	public String delfile(@RequestParam(value="noticefileId") int noticefileId,
						@RequestParam(value="noticeId") int noticeId) {
		noticeService.removeNoticefileOne(noticefileId);
		return "redirect:/admin/modifyNotice?noticeId="+noticeId;
	}
}
