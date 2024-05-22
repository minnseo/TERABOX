package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberService;
import kr.spring.member.service.UserSha256;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	//아이디 중복 체크
	@RequestMapping("/member/confirmId.do")
	@ResponseBody // JSON 사용 (Map or 자바빈을 넘기면 됨)
	public Map<String,String> confirmId(@RequestParam String id){
		log.debug("<<아이디 중복 체크>> : " + id);
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO member = memberService.selectCheckMember(id);
		log.debug("<<member>> : " + member);
		if(member!=null) { //아이디 중복
			mapAjax.put("result", "idDuplicated");
		}else { //아이디 중복
			if(!Pattern.matches("^[A-Za-z0-9]{4,12}$", id)) {
				//패턴 불일치
				mapAjax.put("result","notMatchPattern");
			}else {
				//패턴 일치 + 아이디 미중복
				mapAjax.put("result", "idNotFound");
			}
		}
		
		return mapAjax;
	}

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
