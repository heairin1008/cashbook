package kr.co.gdu.cash.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.MemberService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Member;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class LoginController {
	@Autowired private NoticeService noticeService;
	@Autowired private MemberService memberService;
	
	@GetMapping(value={"/","/login"})
	public String login(Model model, HttpSession session) { // 로그인 폼
		if(session.getAttribute("loginId") != null) { // 이미 로그인한 상태일 경우 로그인 페이지로 들어가면 index페이지로 넘어가도록 설정
			return "redirect:/admin/index";
		}
		List<Notice> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		// = HttpServletRequest request, request.setAttribute("noticeList", noticeList);
		
		return "login";
	}
	
	@PostMapping(value="/login")
	public String login(Member member, HttpSession session) { // 로그인 액션
		Member loginMember = memberService.getMemberById(member);
		if(loginMember == null) { // 로그인 정보가 공백일 경우 로그인 페이지로 이동
			return "redirect:/login";
		}
		session.setAttribute("loginId", loginMember.getId()); // 로그인 정보가 공백이 아닐 경우 세션에 id정보를 입력한 후 index로 이동
		return "redirect:/admin/index";
	}
	
	// 로그아웃 액션
	@GetMapping(value="/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션정보 지우기
		return "redirect:/";
	}
}

