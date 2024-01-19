package com.blog.blog.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.blog.dao.BoardDao;
import com.blog.blog.dao.UserDao;
import com.blog.blog.dto.BoardDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardService {
	@Autowired
	private BoardDao bDao;
	
	public List<HashMap<String, BoardDto>> allBoardList() {
		
		return bDao.boardList();
	}

	public BoardDto boardDtail(int bNum) {
		
		return bDao.boardDtail(bNum);
	}
}
