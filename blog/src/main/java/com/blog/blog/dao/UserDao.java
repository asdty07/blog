package com.blog.blog.dao;

import org.apache.ibatis.annotations.Mapper;

import com.blog.blog.dto.UserDto;

@Mapper
public interface UserDao {

	UserDto getUserInfo(String id);

	String getSecurityPw(String id);
	
	boolean join(UserDto uDto);
	
	boolean login(UserDto hMap);
}
