package com.project.springboot.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
public class UserSaveRequestDto {
	private String userid; 
    private String password;
    private String username;
    private String phonenumber;
    private String email;
    private String address1;
    private String address2;
    private String classify;
    private String gender;
    private String profileimage;
    private String introduction;
    private String linkurl;
    private String region;
    private Role role;

    public User toEntity() {
        return User.builder()
                .userid(userid)
                .password(password)
                .username(username)
                .phonenumber(phonenumber)
                .email(email)
                .address1(address1)
                .address2(address2)
                .classify(classify)
                .gender(gender)
                .profileimage(profileimage)
                .introduction(introduction)
                .linkurl(linkurl)
                .region(region)
                .role(Role.USER)
                .build();
    }

}

