package com.blog.blog.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.blog.dto.UserDto;
import com.blog.blog.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	@Autowired
	private UserService uSer;
	
	@GetMapping("/user/loginfrm")
	public String lofinFrm() {
		log.info("==================================a");
		return "/user/loginfrm";
	}
	
	@GetMapping("/user/joinfrm")
	public String joinFrm() {
		log.info("==================================b");
		return "/user/joinfrm";
	}
	
	@PostMapping("/login")
	public String login(UserDto user, Model model, HttpSession session, RedirectAttributes rttr) {
		// user = HashMap 사용시 어노테이션 @RequestParam 사용하자
		UserDto uDto = uSer.login(user);
		log.info("ud{} : " + uDto);
		
		if(uDto != null) {
			session.setAttribute("uDto", uDto);
			
			rttr.addFlashAttribute("msg", "로그인에 성공하셨습니다.");
			
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msg", "로그인에 실패하셨습니다.");
			
			return "redirect:/user/loginfrm";
		}
		
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
			
			return "redirect:/user/joinfrm";
		}
	}
	
	
}
