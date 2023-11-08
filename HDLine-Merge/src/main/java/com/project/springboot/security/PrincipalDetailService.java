package com.project.springboot.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.springboot.member.User;
import com.project.springboot.member.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PrincipalDetailService implements UserDetailsService {
	
	private final UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        User principal =  userRepository.findByUserid(id).orElseThrow(() -> new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다. " + id));
        return new PrincipalDetail(principal);

	}
}
