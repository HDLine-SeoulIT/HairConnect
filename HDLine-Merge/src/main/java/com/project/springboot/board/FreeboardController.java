package com.project.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.springboot.member.User;
import com.project.springboot.member.UserRepository;

import jakarta.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
    @Autowired
    FreeBoardService freeBoardService;
    @Autowired
    UserRepository userRepository;
    

    @GetMapping("/boardlist")
    public String getAllFreeboardPosts(Model model, @RequestParam(required = false, defaultValue = "0", value = "page") int page,HttpServletRequest request) {
        Page<FreeboardDTO> listPage = freeBoardService.list(page);
        
        List<FreeboardDTO> posts = listPage.getContent();
        int totalPages = listPage.getTotalPages();
        
        model.addAttribute("contextPath", request.getContextPath());
        
        model.addAttribute("posts", posts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "freeboard/boardlist";
    }
    @GetMapping("/createForm")
    public String getCreateForm() {
        return "freeboard/createForm";
    }
    @PostMapping("/createFreeboardPost")
    public String createFreeboardPost(@ModelAttribute FreeboardDTO post,@RequestParam(value="no")Long no) {
        // 게시물을 생성하고 저장하는 로직을 구현합니다.
	User user1 =  userRepository.findByNo(no);
	post.setMembers(user1);
	post.setCreatedate(new java.sql.Date(System.currentTimeMillis()));
        freeBoardService.createFreeboardPost(post);
        return "redirect:/freeboard/boardlist"; // 생성 후 목록 페이지로 리다이렉트
    }
    @GetMapping("/boardlist/{no}")
    public String getFreeboardPost(@PathVariable Long no, Model model) {
        FreeboardDTO post = freeBoardService.getFreeboardPostById(no);
        System.out.println(post.toString());
        model.addAttribute("post", post);
        return "freeboard/detail2"; // JSP 파일 경로로 수정
    }

    @GetMapping("/boardlist/{no}/updateForm")
    public String getFreeboardUpdateForm(@PathVariable Long no, Model model) {
        FreeboardDTO post = freeBoardService.getFreeboardPostById(no);
        model.addAttribute("post", post);
        return "freeboard/updateForm2";
    }
    
    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and #post.members.no == principal.user.no)")
    @PostMapping("/boardlist/update/{no}")
    public String updateFreeboardPost(@PathVariable Long no, @ModelAttribute FreeboardDTO post, Model model) {
        // 해당 'no' 값의 게시물이 존재하는지 확인
        FreeboardDTO existingPost = freeBoardService.getFreeboardPostById(no);
        if (existingPost != null) {
            // 'no' 값이 유효하고 게시물이 존재하는 경우 수정 진행
            post.setNo(no);
            post.setCreatedate(new java.sql.Date(System.currentTimeMillis()));
            
            // 해당 게시물의 작성자를 가져옵니다.
            User user = existingPost.getMembers();
            // 사용자 ID를 게시물에 설정합니다.
            post.setMembers(user);

            FreeboardDTO updatedPost = freeBoardService.updateFreeboardPost(post);

            // 수정 후 게시물 목록을 다시 불러와 모델에 추가
            Page<FreeboardDTO> listPage = freeBoardService.list(0);
            List<FreeboardDTO> posts = listPage.getContent();
            int totalPages = listPage.getTotalPages();

            model.addAttribute("posts", posts);
            model.addAttribute("currentPage", 0);
            model.addAttribute("totalPages", totalPages);
            return "freeboard/updateresult2";
        } else {
            return "freeboard/errorPage?message='no'=" + no + "인 게시물이 존재하지 않습니다.";
        }
    }

    @GetMapping("/boardlist/{no}/deleteForm")
    public String deleteFreeboardPostForm(@PathVariable Long no, Model model) {
        FreeboardDTO post = freeBoardService.getFreeboardPostById(no);
        model.addAttribute("post", post);
        return "freeboard/deleteForm2"; // 게시물 삭제 폼 JSP 파일 경로
    }
    
    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and #post.members.no == principal.user.no)")
    @PostMapping("/boardlist/delete/{no}")
    public String deleteFreeboardPost(@PathVariable Long no, Model model) {
	userRepository.deleteById(no);
	freeBoardService.deleteFreeboardPost(no);
        return "freeboard/deleteresult2";
    }
}