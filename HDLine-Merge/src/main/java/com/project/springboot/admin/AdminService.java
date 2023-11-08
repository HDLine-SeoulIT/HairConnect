package com.project.springboot.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.springboot.board.FreeBoardRepository;
import com.project.springboot.board.FreeboardDTO;
import com.project.springboot.mab.ModelAppealBoardRepository;
import com.project.springboot.member.User;
import com.project.springboot.member.UserRepository;
import com.project.springboot.member.UserService;

@Service
@Transactional
public class AdminService {
    
	@Autowired
    UserRepository userRepository;
	@Autowired
	UserService userService;
	
	ModelAppealBoardRepository modelAppealBoardRepository;
	
    private final FreeBoardRepository freeBoardRepository;

    public AdminService(UserRepository memberRepository, FreeBoardRepository freeBoardRepository) {
        this.userRepository = memberRepository;
        this.freeBoardRepository = freeBoardRepository;
    }
    
    @Transactional
    public List<User> getAllMembers() {
        return userRepository.findAll();
    }
    
    @Transactional
    public User getMemberByNo(Long no) {
        return userRepository.findByNo(no);
    }
    @Transactional
    public User updateMember(User member) {
        return userRepository.save(member);
    }
    
    @Transactional
    public void deleteMember(Long no) {
        userRepository.deleteById(no);
    }
    @Transactional
    public void createMember(User member) {
        userRepository.save(member);
    }
    @Transactional
    public FreeboardDTO getFreeboardPostById(Long no) {
        return freeBoardRepository.findById(no).orElse(null);
    }

    @Transactional
    public FreeboardDTO updateFreeboardPost(FreeboardDTO post) {
        return freeBoardRepository.save(post);
    }

    @Transactional
    public void deleteFreeboardPost(Long no) {
        freeBoardRepository.deleteById(no);
    }

    @Transactional
    public List<FreeboardDTO> getAllFreeboardPosts() {
	 List<FreeboardDTO> posts = freeBoardRepository.findAll();
	 return posts;
    }
    public Page<User> list(int page, int pageSize){
	PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.by(Sort.Direction.DESC, "no"));
	return userRepository.findAll(pageRequest);
    }
    @Transactional
    public Page<User> searchMembers(int page, int pageSize, String search) {
        PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.by(Sort.Direction.DESC, "no"));
        return userRepository.findByUsernameContainingOrUseridContaining(search, search, pageRequest);
    }
   
}
