package com.exam.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.exam.dto.MemberDTO;
import com.exam.service.AuthenticationService;
//https://docs.spring.io/spring-security/site/docs/6.2.8/api/org/springframework/security/authentication/AuthenticationProvider.html#authenticate(org.springframework.security.core.Authentication)
@Component
public class AuthProvider implements AuthenticationProvider {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	AuthenticationService service;
	
	public AuthProvider(AuthenticationService service) {
		this.service = service;
	}

	// 사용자가 입력된 userid와 passwd 이용해서 DB 연동해서 체크
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		logger.info("LOGGER:AuthProvider.authenticate 호출");
		
		String userid = (String)authentication.getPrincipal();
		String passwd = (String)authentication.getCredentials(); //1234
		
		//DB 연동해서 체크. userid에 해당하는 MemberDTO 얻기
		MemberDTO dto = service.findByUserid(userid);
		
		// passwd 와 encodedPasswd 비교
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		UsernamePasswordAuthenticationToken token = null;
		
		if( dto != null && passwordEncoder.matches(passwd, dto.getPasswd())) {

			// UsernamePasswordAuthenticationToken(Object principal, Object credentials, 
			//                           Collection<? extends GrantedAuthority> authorities)
			
			MemberDTO new_dto = new MemberDTO();
			new_dto.setUserid(userid);
			new_dto.setPasswd(passwd); // 1234
			new_dto.setUsername(dto.getUsername());
			
			List<GrantedAuthority> authorities = new ArrayList<>();
			authorities.add(new  SimpleGrantedAuthority("USER")); // 현재는 모든 사용자의 role은 USER임.
			//authorities.add(new  SimpleGrantedAuthority("ADMIN")); // 필요시 ADMIN 추가 가능
			
			
			// 다음 token 정보가 세션에 저장된다.
			token = new UsernamePasswordAuthenticationToken(new_dto, null, authorities);
			
			return token;
		}
			throw new BadCredentialsException("비밀번호가 일치하지 않음");
		
	}// end authenticate 메서드

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
