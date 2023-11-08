package com.project.springboot.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.project.springboot.member.*;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class PrincipalDetail implements UserDetails {
	private static final long serialVersionUID = 1L;
	
	private final User user;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collection = new ArrayList<>();
        collection.add( () -> user.getRole().getKey());

        return collection;
    }

    //사용자 패스워드
    @Override
    public String getPassword() {
        return user.getPassword();
    }

    //사용자 아이디
    public String getUserid() {
        return user.getUserid();
    }
    
    //사용자 이름
    public String getUsername() {
    	return user.getUsername();
    }

    //사용자 전화
    public String getPhonenumber() {
    	return user.getPhonenumber();
    }
    
//  사용자 주소
  public String getAddress1() {
  	return user.getAddress1();
  }

  public String getAddress2() {
	  return user.getAddress2();
  }
  
    
    public String getClassify() {
    	return user.getClassify();
    }
    
    public String getGender() {
    	return user.getGender();
    }
    
    public String getProfileimage() {
    	return user.getProfileimage();
    }
    
    public String getIntroduction() {
    	return user.getIntroduction();
    }
    
    public String getLinkurl() {
    	return user.getLinkurl();
    }
    
    public String getRegion() {
    	return user.getRegion();
    }

    public Long getNo() {
        return user.getNo();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }


}