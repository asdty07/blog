package com.blog.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.blog.blog.dto.BoardDto;
import com.blog.blog.dto.UserDto;

@Mapper
public interface UserDao {

	UserDto getUserInfo(String u_id);

	String getSecurityPw(String id);
	
	boolean join(UserDto uDto);
	
	boolean login(UserDto hMap);

}
