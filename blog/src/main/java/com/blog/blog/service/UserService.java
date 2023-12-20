package com.blog.blog.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.blog.blog.dao.UserDao;
import com.blog.blog.dto.UserDto;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class UserService {
	@Autowired
	private UserDao uDao;

	public UserDto login(HashMap<String, String> user) {
		String encodePw = uDao.getSecurityPw(user.get("u_id"));
		log.info("====encoPwd:{}", encodePw);
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder(); // 비밀번호 암호화
		
		if(encodePw != null) {
			log.info("=========================아이디 존재함");
			if(pwEncoder.matches(user.get("u_pw"), encodePw)) {
				log.info("==================로그인 성공!");
				
				return uDao.getUserInfo(user.get("u_id"));
			} else {
				log.info("===================비번 오류");
				return null;
			}
		} else {
			log.info("===================아이디 오류");
		}
		return null;
	}

	public boolean join(UserDto uDto) {
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder(); // 비밀번호 암호화
		uDto.setU_pw(pwEncoder.encode(uDto.getU_pw()));
		
		return uDao.join(uDto);
	}
}
