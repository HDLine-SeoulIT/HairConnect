package com.project.springboot.member;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import com.project.springboot.board.FreeboardDTO;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity	
@Table(name = "Members")
@AllArgsConstructor
@NoArgsConstructor // 빈 생성자 만들어줌
@Getter
@Setter
@Builder
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
    private Long no; 

    @Column(nullable = false, length = 20, unique = true)
    private String userid; //아이디

    @Column(nullable = false, length = 100)
    private String password; // 암호
    
    @Column(nullable = false, length = 20)
    private String username; //이름
    
    @Column(nullable = true, length = 20)
    private String phonenumber;
    
    @Column(nullable = true, length = 30)
    private String email;
    
    @Column(nullable = true, length = 120)
    private String address1; // 주소1
    
    @Column(nullable = true, length = 120)
    private String address2; // 주소2 상세주소
    
    @Column(nullable = true, length = 20)
    private String classify; //
    
    @Column(nullable = true, length = 20)
    private String gender; //
    
    @Column(nullable = true, length = 200)
    private String profileimage; 
    
    @Column(nullable = true, length = 600)
    private String introduction; // 간단한 자기소개(프로필)
    
    @Column(nullable = true, length = 300)
    private String linkurl; // 인스타, 페북, 블로그 등
    
    @Column(nullable = false, length = 40)
    private String region; // 지역
    
    @Enumerated(EnumType.STRING)	
    @Column(nullable = false)
    private Role role;	
    public void setPassword(String password) {
        this.password = password;
    }
    
   
//    권한 메소드
    
    @OneToMany(mappedBy = "members", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<FreeboardDTO> freeboardList;
    
    
    public String getRoleKey() {
        return this.role.getKey();
    }

//    회원수정
    public void update(String password, String email, String address1) {
        this.password = password;
        this.email = email;
        this.address1 = address1;
    }
}
