package kr.spring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.member.vo.MemberVO;

@Controller
public class MemberController {
	
	/*
	 * ====== 자바빈 초기화 ======
	 */
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	/*
	 * ======== 회원가입 ========
	 */
	//회원가입 폼 호출
	@GetMapping("/member/registerUser.do")
	public String form() {
		return "memberRegister";
	}

}
