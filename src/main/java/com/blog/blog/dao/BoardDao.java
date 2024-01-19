package com.blog.blog.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.blog.blog.dto.BoardDto;

@Mapper
public interface BoardDao {

	List<HashMap<String, BoardDto>> boardList();

	BoardDto boardDtail(int bNum);

}
