package com.project.springboot.member;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {
	
	private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * 회원가입 
     */
    
    public Long save(UserSaveRequestDto dto) {
        String hashPw = bCryptPasswordEncoder.encode(dto.getPassword());
        dto.setPassword(hashPw);
        return userRepository.save(	User.builder().password(hashPw).userid(dto.getUserid()).username(dto.getUsername())
        		.address1(dto.getAddress1()).address2(dto.getAddress2()).phonenumber(dto.getPhonenumber()).profileimage(dto.getProfileimage())
        		.introduction(dto.getIntroduction()).linkurl(dto.getLinkurl()).email(dto.getEmail()).gender(dto.getGender())
        		.classify(dto.getClassify()).region(dto.getRegion()).role(dto.getRole()).build()).getNo();
    }
    


}
