package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.MemberMapper;
import kr.co.gdu.cash.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	
	public Member getMemberById(Member paramMember) {
		Member member = memberMapper.selectMemberById(paramMember.getId());
		if(member != null && member.getPw().equals(paramMember.getPw()) == true) {
			// member가 공백이 아닐 경우 and 로그인의 비밀번호가 데이터베이스의 데이터와 일치할 경우
			return member;
		}
		return null;
	}
	
	public int addMember(Member member) {
		return memberMapper.insertMember(member);
	}
}
