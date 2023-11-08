package com.project.springboot.member;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;



public interface UserRepository extends JpaRepository<User, Long> { 
	Optional<User> findByUserid(String userid);
	User findByNo(Long no);
	Page<User> findByUsernameContainingOrUseridContaining(String search, String search2, PageRequest pageRequest);
	
}
