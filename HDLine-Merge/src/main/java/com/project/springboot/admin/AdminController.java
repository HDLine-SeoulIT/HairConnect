package com.project.springboot.admin;

import java.sql.Date;
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

import com.project.springboot.board.FreeBoardService;
import com.project.springboot.board.FreeboardDTO;
import com.project.springboot.mab.ModelAppealBoardDTO;
import com.project.springboot.mab.ModelAppealBoardService;
import com.project.springboot.member.Role;
import com.project.springboot.member.User;
import com.project.springboot.member.UserRepository;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;
    
    @Autowired
    ModelAppealBoardService modelAppealBoardService;

    @Autowired
    private FreeBoardService freeBoardService; // FreeBoardService 빈 주입
    @Autowired
    UserRepository memberRepository;

    @RequestMapping("/intro")
    public String intro() {
	return "admin/intro";
    }

    @RequestMapping("/create")
    public String create() {
	User member1 = User.builder().userid("user20").password("1234").username("John Doe").gender("man")
		.phonenumber("123-456-7890").email("abcd@efg.com").address1("123 Main St").address2("Apt 4B").classify("User")
		.profileimage("user1.jpg").introduction("I'm a member of this community.").role(Role.USER)
		.linkurl("https://example.com/user1").region("New York").build();
	memberRepository.save(member1);
	User member2 = memberRepository.getById((long) 1);
//	Long authorNo = member1.getNo();
	FreeboardDTO newPost = FreeboardDTO.builder().title("새로운 게시물 제목").content("새로운 게시물 내용").members(member2)// 게시물
														// 작성자의
														// ID
		.createdate(new Date(System.currentTimeMillis())) // 현재 날짜로 설정
		.build();

	// FreeBoardService를 사용하여 새 게시물을 저장합니다.
	freeBoardService.createFreeboardPost(newPost);
	return "admin/create";
    }

    @GetMapping("/memberlist")
    public String getAllMembers(Model model,@RequestParam(name = "page", defaultValue = "0") int page) {
	int pageSize = 10; // 페이지당 보여질 멤버 수

	    // page 메서드를 호출하여 페이지 별로 멤버 목록을 가져옵니다.
	    Page<User> membersPage = adminService.list(page, pageSize);

	    List<User> members = membersPage.getContent();
	    int totalPages = membersPage.getTotalPages();

	    model.addAttribute("members", members);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "admin/memberlist";
    }
    @GetMapping("/memberlist/search")
    public String searchMembers(Model model, @RequestParam(name = "page", defaultValue = "0") int page, @RequestParam(value = "search", required = false) String search) {
        int pageSize = 10; // 페이지당 보여질 멤버 수

        // page 메서드를 호출하여 페이지 별로 멤버 목록을 가져옵니다.
        Page<User> membersPage;

        if (search != null && !search.isEmpty()) {
            // 검색어가 제공된 경우, 검색 기능을 활용하여 멤버를 찾습니다.
            membersPage = adminService.searchMembers(page, pageSize, search);
        } else {
            membersPage = adminService.list(page, pageSize);
        }

        List<User> members = membersPage.getContent();
        int totalPages = membersPage.getTotalPages();

        model.addAttribute("members", members);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("search", search);

        return "admin/memberlist";
    }
    @GetMapping("/members/updateForm/{no}")
    public String updateForm(@PathVariable Long no, Model model) {
	User member = adminService.getMemberByNo(no);
	model.addAttribute("member", member);
	return "admin/updateForm";
    }
    
    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/members/edit/{no}")
    public String editMember(@ModelAttribute User updatedUser, Model model) {
//	adminService.updateMember(member);
	
	User existingUser = adminService.getMemberByNo(updatedUser.getNo());
	updatedUser.setRole(existingUser.getRole());
	
	adminService.updateMember(updatedUser);
	model.addAttribute("message", "회원 정보가 성공적 으로 수정되었습니다.");
	return "admin/updateresult";
    }

    @GetMapping("/members/deleteForm/{no}")
    public String deleteForm(@PathVariable Long no, Model model) {
	User member = adminService.getMemberByNo(no);
	model.addAttribute("member", member);
	return "admin/deleteForm";
    }
    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/members/delete/{no}")
    public String deleteMember(@PathVariable Long no, Model model) {
	adminService.deleteMember(no);
	model.addAttribute("message", "회원 정보가 성공적으로 삭제되었습니다.");
	return "admin/deleteresult";
    }

    // 게시물 목록 전체조회
    @GetMapping("/freeboard/boardlist")
    public String getAllFreeboardPosts(Model model, @RequestParam(required = false, defaultValue = "0", value = "page") int page) {
	Page<FreeboardDTO> listPage = freeBoardService.list(page);
	
//	List<FreeboardDTO> posts = listPage.getContent();
	int totalPages = listPage.getTotalPages();
	
//	System.out.println(posts.toString());
	
	model.addAttribute("posts", listPage.getContent());
	model.addAttribute("currentPage", page);
	model.addAttribute("totalPages", totalPages);
	return "freeboard/boardlist";
    }
    // 게시물 상세 조회
    @GetMapping("/freeboard/boardlist/{no}")
    public String getFreeboardPost(@PathVariable Long no, Model model) {
	FreeboardDTO post = freeBoardService.getFreeboardPostById(no);
	model.addAttribute("post", post);
	return "freeboard/detail"; // JSP 파일 경로로 수정
    }

    
    // 수정 페이지(GET 요청)
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/freeboard/boardlist/{no}/updateForm")
    public String getFreeboardUpdateForm(@PathVariable Long no, Model model) {
	FreeboardDTO post = freeBoardService.getFreeboardPostById(no);
	model.addAttribute("post", post);
	return "freeboard/updateForm";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/freeboard/boardlist/update/{no}")
    public String updateFreeboardPost(@PathVariable Long no, @ModelAttribute FreeboardDTO post, Model model) {
	// 해당 'no' 값의 게시물이 존재하는지 확인
	FreeboardDTO existingPost = freeBoardService.getFreeboardPostById(no);
	if (existingPost != null) {
		    // 'no' 값이 유효하고 게시물이 존재하는 경우 수정 진행
		    post.setNo(no);
	
		    // 여기에서 게시물의 작성자 정보를 업데이트
		    /*
		     * existingPost.getMembers().getNo()를 사용하여 현재 수정 중인 게시물(existingPost)의
		     * 작성자(Members)의 고유 번호(no)를 가져옵니다.
		     * 
		     * 그 다음, adminService.getMemberById() 메서드를 사용하여 해당 고유 번호를 가진 회원 정보를 데이터베이스에서
		     * 가져옵니다. 이렇게 하면 현재 게시물의 작성자 정보를 업데이트하기 위한 새로운 회원 정보를 가져옵니다.
		     * 
		     * 마지막으로, post.setMembers(updatedAuthor)를 사용하여 수정 중인 게시물(post)의 작성자를 새로 가져온 회원
		     * 정보(updatedAuthor)로 업데이트합니다. 이렇게 하면 게시물의 작성자 정보가 수정되고 데이터베이스에 반영됩니다.
		     */
		    User updatedAuthor = adminService.getMemberByNo(existingPost.getMembers().getNo());
		    post.setMembers(updatedAuthor);
		    post.setCreatedate(new Date(System.currentTimeMillis()));
	
		    freeBoardService.updateFreeboardPost(post);
	
		    // 수정 후 게시물 목록을 다시 불러와 모델에 추가
		    List<FreeboardDTO> posts = freeBoardService.getAllFreeboardPosts();
		    model.addAttribute("posts", posts);
		    return "/freeboard/updateresult";
		} else {
		    return "/freeboard/errorPage?message='no'=" + no + "인 게시물이 존재하지 않습니다.";
		}
    }

    // 게시물 삭제 폼
    @GetMapping("/freeboard/boardlist/{no}/deleteForm")
    public String deleteFreeboardPostForm(@PathVariable Long no, Model model) {
	FreeboardDTO post = freeBoardService.getFreeboardPostById(no);
	model.addAttribute("post", post);
	return "/freeboard/deleteForm"; // 게시물 삭제 폼 JSP 파일 경로
    }

    // 게시물 삭제
    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/freeboard/boardlist/delete/{no}")
    public String deleteFreeboardPost(@PathVariable Long no) {
	freeBoardService.deleteFreeboardPost(no);
	return "/freeboard/deleteresult";
    }
}
