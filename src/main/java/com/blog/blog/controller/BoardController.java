package com.blog.blog.controller;

import java.security.Principal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.blog.dto.BoardDto;
import com.blog.blog.service.BoardService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	@Autowired
	private BoardService bSer;

	@GetMapping("/user/board")
	public String board(Model m, RedirectAttributes rttr, HttpSession s) {
		List<HashMap<String, BoardDto>> boardList = bSer.allBoardList();

		log.info("==================================board");
		log.info("board: {}", boardList);

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonBoardList = null;

		try {
			jsonBoardList = objectMapper.writeValueAsString(boardList);
		} catch (JsonProcessingException e) {
			log.error("Error converting boardList to JSON", e);
		}

		if (jsonBoardList != null) {
			m.addAttribute("jsonBoardList", jsonBoardList);
			return "board/board";
		} else {
			return "redirect:login";
		}
	}

	@GetMapping("/board/details")
	public String boardDtails(Model m, @RequestParam("bNum") int bNum, Principal principal) {

		BoardDto bDto = bSer.boardDtail(bNum);

		if (principal != null) {
			if (bDto != null) {
				// 시큐리티 로그인 확인 여부
				String name = principal.getName();
				log.info("name : {}", name);

				m.addAttribute("bDto", bDto);
				return "board/boardDetails";
			} else {
				// 이동하기 전 url로 리다이렉트
				return "redirect:/user/board";
			}
		} else {
			return "redirect:/user/board";
		}
	}

	@GetMapping("/board/write")
	public String boardWrite(Model m, Principal principal) {

		if (principal != null) {
			String uId = principal.getName();
			log.info("uId: {}", uId);
			return "board/boardWrite";
		} else {
			return "redirect:/user/board";
		}
	}

	@PostMapping("/board/boardInsert")
	public String boardInsert(Model m, BoardDto bDto, Principal principal, HttpSession s) {
		bDto.setB_name((String) s.getAttribute("name"));

	    // 현재 날짜를 java.util.Date로 가져오기
	    java.util.Date utilDate = new java.util.Date();

	    // java.util.Date를 java.sql.Date로 변환
	    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	    
	    bDto.setB_date(sqlDate);

		log.info("bDto : {}", bDto);

		boolean rs = bSer.boardWrite(bDto);

		if (rs) {
			return "redirect:/user/board";
		} else {
			return "redirect:/board/write";
		}
	}
	
	@GetMapping("/board/delete")
	public String boardDelete(@RequestParam int d_bNum) {
		
		
		return "redirect:/user/board";
	}
	
}
