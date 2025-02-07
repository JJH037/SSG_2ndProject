package com.exam.security;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityFilterChainConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		//csrf 비활성화
		http.csrf((csrf) -> csrf.disable());
		
		//요청맵핑값 허용
		http.authorizeHttpRequests(auth->
		                           auth.requestMatchers("/main","/signup","/idCheck","/login","/goodsRetrieve","/WEB-INF/**").permitAll()  
//		                               .requestMatchers("/**").permitAll()
		                               .anyRequest()
		                               .authenticated()
				                  );
		
		//사용자 만든 로그인 정보 설정
		// requestMatchers에서 permitAll() 지정한 요청맵핑값을 제외한 모든 요청은 login화면으로 리다이렉트됨.
		http.formLogin(formLogin->
		                  formLogin.loginPage("/login") //LoginController 의 @GetMapping(value={"/login"}) 값
				                   .loginProcessingUrl("/auth") // loginForm.jsp 의 <form action="auth"> 값
				                   .usernameParameter("userid") // loginForm.jsp 의 <input type="text" name="userid"  />
				                   .passwordParameter("passwd") // loginForm.jsp 의 <input type="password" name="passwd"  />
				                   .failureUrl("/login") //로그인 실패시 redirect 된 요청매핑값
				                   .defaultSuccessUrl("/main", true) //로그인 성공시 redirect 된 요청매핑값
				      );
		
		// 로그아웃 설정
		http.logout((logout) ->
				        logout.deleteCookies("remove")
				        .invalidateHttpSession(true)
				        .logoutUrl("/logout")  // SpringSecurity가 자동으로 로그아웃 처리해줄 요청매핑값
				        .logoutSuccessUrl("/main") // logout 성공시 redirect 된 요청매핑값
                   );
		
		return http.build();
	}
	
	// 정적 리소스 spring security 대상에서 제외
	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {
	  return (web) ->
	                  web
	                      .ignoring()
	                      .requestMatchers(
	                        PathRequest.toStaticResources().atCommonLocations()
	                      );
	}
}
