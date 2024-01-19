package com.blog.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.blog.dto.UserDto;
import com.blog.blog.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	@Autowired
	private UserService uSer;
	
	@GetMapping("/user/loginfrm")
	public String lofinFrm() {
		log.info("==================================a");
		return "user/loginfrm";
	}
	
	@GetMapping("/user/joinfrm")
	public String joinFrm() {
		log.info("==================================b");
		return "user/joinfrm";
	}	

	@PostMapping("/join")
	public String join(UserDto uDto, Model m, RedirectAttributes rttr) {
		log.info("ud {} : " + uDto);
		boolean result = uSer.join(uDto);
		
		if(result) {
			rttr.addFlashAttribute("msg", "가입에 성공하셨습니다!");
			log.info("asdf");
			return "redirect:/";
		} else {
			m.addAttribute("msg", "가입에 실패하셨습니다.");
			
			return "redirect:user/joinfrm";
		}
	}
	
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    log.info("User logged out successfully.");
	    return "redirect:/";
	}

	@GetMapping("/user/profile")
	public String profile(Model m, RedirectAttributes rttr, HttpSession session) {
		// 세션에 id를 저장하고 저장한 id를 서버에서 가져와 사용함.
		// 시큐리티 사용 시 시큐리티 서비스에 저장한 name을 가져와서 모델에 넣어 보낸다.
		String userName = (String) session.getAttribute("name");
		
	    if (userName != null) {

	        m.addAttribute("userName", userName);
	        return "profile/userProfile";
	    } else {
	        // 세션이 만료되었거나 로그인되지 않은 경우 처리
	        // ...
	        return "redirect:/login";
	    }
	}

	@GetMapping("/member/login/error")
	public String loginError(Model model) {
		model.addAttribute("msg", "로그인 실패-model");
		return "member/loginfrm";
	}
}
