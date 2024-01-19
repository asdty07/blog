package com.blog.blog.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.blog.dto.BoardDto;
import com.blog.blog.service.BoardService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	@Autowired
	private BoardService bSer;
	
    @GetMapping("/user/board")
    public String board(Model m, RedirectAttributes rttr) {
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
    public String boardDtails(Model m, @RequestParam("bNum") int bNum) {
    	
    	BoardDto bDto = bSer.boardDtail(bNum);
    	
    	if(bDto != null) {
    		m.addAttribute("bDto", bDto);
    		
    		return "board/boardDetails";
    	} else {
    		return "redirect:board/boardWrite";
    	}
    }
    
    @GetMapping("/board/write")
    public String boardWrite(Model m) {
    	
    	
    	
    	return "board/boardWrite";
    }
}
