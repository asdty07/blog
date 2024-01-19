package com.blog.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.blog.blog.dao.UserDao;
import com.blog.blog.dto.BoardDto;
import com.blog.blog.dto.UserDto;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class UserService {
	@Autowired
	private UserDao uDao;

//	@Transactional : 에러 발생 시 DB에 insert, update, delete등을 롤백시키고, 에러가 안나오면 commit을 한다
//	public UserDto login(UserDto user) {
//		String encodePw = uDao.getSecurityPw(user.getU_id());
//		log.info("====encodePw:{}", encodePw);
//		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder(); // 비밀번호 암호화
//		
//		if(encodePw != null) {
//			log.info("=========================아이디 존재함");
//			if(pwEncoder.matches(user.getU_pw(), encodePw)) {
//				log.info("==================로그인 성공!");
//				
//				return uDao.getUserInfo(user.getU_id());
//			} else {
//				log.info("===================비번 오류");
//				return null;
//			}
//		} else {
//			log.info("===================아이디 오류");
//			return null;
//		}
//	}
//
	public boolean join(UserDto uDto) {
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder(); // 비밀번호 암호화
		uDto.setU_pw(pwEncoder.encode(uDto.getU_pw()));
		
		return uDao.join(uDto);
	}

}
