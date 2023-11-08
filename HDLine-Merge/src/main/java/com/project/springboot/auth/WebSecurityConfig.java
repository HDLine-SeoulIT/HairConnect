package com.project.springboot.auth;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.project.springboot.security.PrincipalDetailService;

import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;


@EnableWebSecurity
@Configuration
public class WebSecurityConfig 
{
	@Autowired
	private PrincipalDetailService principalDetailService;
	
	@Bean  
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception 
	{  
        http.csrf((csrf) -> csrf.disable())
    		.cors((cors) -> cors.disable())
        	.authorizeHttpRequests(request -> request  
        	
        		.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
//        			/ : 모든 요청명에 대해 권한 없이 접근할 수 있다.
//        		.requestMatchers("/","/js","/user_login.jsp","/user").permitAll()
        		.requestMatchers("/","/signup","/loginForm","/user","/createmember").permitAll()
        		//		정적 리소스(static하위) 에는 권한없이 접근할 수 있다.
                .requestMatchers("/css/**", "/js/**", "/img/**").permitAll()
                //		권한없이 접근할 수 있다.
                .requestMatchers("/guest/**").permitAll()  // 모두에게 허용.
                //		USER,ADMIN 권한 중 하나가 있어야 접근할 수 있다.
                .requestMatchers("/member/**").hasAnyRole("USER", "ADMIN") // 두권한 허용
                .requestMatchers("/modelboard/**").hasAnyRole("USER", "ADMIN") // 두권한 허용
                .requestMatchers("/freeboard/**").hasAnyRole("USER", "ADMIN") // 두권한 허용
                //	 	ADMIN 권한 만 접근할 수 있다.
                .requestMatchers("/admin/**").hasRole("ADMIN") // ADMIN만 허용
                .requestMatchers("/freeboard/boardlist/update/{no}").hasRole("ADMIN")
                .requestMatchers("/freeboard/boardlist/delete/{no}").hasRole("ADMIN")
                .anyRequest().authenticated()	// 어떠한 요청이라도 인증 필요
            );
        
        // 로그인 페이지 설정(세큐리티의 디폴트 페이지를 사용한다.)
        http.formLogin((formLogin) ->
        // 이게없으면 기본폼이 출현함.
        	formLogin.loginPage("/loginForm")	// 로그인폼으로 가는 경로
        	// 로그인처리(폼전송)를 위한 요청명
        	.loginProcessingUrl("/j_spring_security_check")
        	// 실패시 이동할 경로
//        	.failureUrl("/loginError?error")
        	// 로그인 성공시 이동할 경로
        	.defaultSuccessUrl("/")
        	// 아이디 입력상자의 name 속성
        	.usernameParameter("j_username")
        	// 패스워드 입력상자에 name 속성
        	.passwordParameter("j_password")
        	.permitAll());
 
        // 로그 아웃 기본 설정 (/logout으로 인증 해제)
        http.logout((logout) ->
    				logout.logoutUrl("/logout")
    				.logoutSuccessUrl("/")
    				.permitAll()
        		);	
        
		return http.build(); 
    }
	
	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() throws Exception{
		DaoAuthenticationProvider daopuAuthenticationProvider = new DaoAuthenticationProvider();
		
		daopuAuthenticationProvider.setUserDetailsService(principalDetailService);
		daopuAuthenticationProvider.setPasswordEncoder(bCryptPasswordEncoder());
		
		return daopuAuthenticationProvider;
	}
	
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
