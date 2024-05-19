package kr.spring.member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.spring.member.service.MemberService;
import kr.spring.member.service.UserSha256;
import kr.spring.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
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
	
	//회원가입 처리
	@PostMapping("/member/registerUser.do")
	public String submit(@Valid MemberVO memberVO, BindingResult result, Model model) {
		//유효성 체크 결과, 오류가 있을 시 form 호출
		if(result.hasErrors()) {
			return form();
		}
		String encryPassword = UserSha256.encrypt(memberVO.getPasswd());
		memberVO.setPasswd(encryPassword);
		
		//회원가입
		memberService.insertMember(memberVO);
		
		model.addAttribute("accessMsg", "회원가입이 완료되었습니다.");
		
		return "common/notice";
	}

}
