package com.project.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.springboot.member.Role;
import com.project.springboot.member.User;
import com.project.springboot.member.UserRepository;
import com.project.springboot.member.UserSaveRequestDto;
import com.project.springboot.member.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller
public class MainController {
	@Autowired
	UserService userService;
	@Autowired
	UserRepository userpRepository;
	
	
	@RequestMapping("/")
	public String intro() {
		return "MainPage";
	}
	
	@RequestMapping("/home")
	public String home() {
		return "Home";
	}
	
	
	@RequestMapping("/Nav")
	public String Nav() {
		return "Navbar";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {	//	
		
		return "security/loginForm";	
//		return "LoginPage";	
	}
	
	@RequestMapping("/main")
	public String main() {	//	
		
		return "security/main";	
	}
	
	@PostMapping("/user")
	public String signuprequest(HttpServletRequest request) {
		
		
		System.out.println(request.getParameter("userid"));
		userService.save(UserSaveRequestDto
									.builder()
									.userid(request.getParameter("userid"))
									.password(request.getParameter("password"))
									.username(request.getParameter("name"))
									.phonenumber(request.getParameter("010-"+request.getParameter("phone1")+"-"+request.getParameter("phone2")))
									.email(request.getParameter("email1")+"@"+request.getParameter("email2"))
									.address1(request.getParameter("address1"))
									.address2(request.getParameter("address2"))
									.classify(request.getParameter("classify"))
									.region(request.getParameter("region"))
									.linkurl(request.getParameter("linkurl"))
									.gender(request.getParameter("gender"))
									.introduction(request.getParameter("introduction"))
									.role(Role.USER)
									.build()
									);
		return "redirect:login";
	}

	@GetMapping("/update")
    public String userUpdate(){
        return "security/update";
    }
	
	@GetMapping("/signup")
	public String signup() {
		return "security/signup";
	}
	@GetMapping("/logout")
	public String logut(HttpServletRequest request, HttpServletResponse response) {
		new SecurityContextLogoutHandler().logout(request, response, 
											SecurityContextHolder.getContext().getAuthentication());
		return "redirect:/login";
	}
	
	@GetMapping("/createmember")
	public String createmember() {
		UserSaveRequestDto admin = UserSaveRequestDto.builder().userid("admin").password("1234").username("John Doe")
				.phonenumber("123-456-7890").address1("123 Main St").address2("Apt 4B").classify("admin").gender("남")
				.profileimage("user1.jpg").introduction("I'm a member of this community.").role(Role.ADMIN)
				.linkurl("https://example.com/user1").region("제주").build();
		userService.save(admin);
		for (int i = 1; i <= 20; i++) {
			UserSaveRequestDto member1 = UserSaveRequestDto.builder().userid("model"+i).password("1234").username("모델"+i)
					.phonenumber("123-456-7890").address1("123 Main St").address2("Apt 4B").classify("model")
					.profileimage("user1.jpg").introduction("모델로 활동해요. 반가워요~").role(Role.USER).gender("여")
					.linkurl("https://example.com/user"+(i+1)).region("경기인천").email("test"+i+"@test.com").build();
			userService.save(member1);
		}
		for (int i = 1; i <= 20; i++) {
			UserSaveRequestDto member2 = UserSaveRequestDto.builder().userid("user"+i).password("1234").username("디자이너"+i)
					.phonenumber("123-456-7890").address1("123 Main St").address2("Apt 4B").classify("shop").gender("여")
					.profileimage("user1.jpg").introduction("헤어 디자이너에요. 반갑습니다!").role(Role.USER)
					.linkurl("https://example.com/user"+(i+1)).region("강원").email("test"+i+"@test.com").build();
			userService.save(member2);
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/userinfo/{no}")
    public String userinfo(Model model,@PathVariable Long no ) {

        Long userNo = no;

        User user = userpRepository.findByNo(userNo); //findByUsername

        model.addAttribute("user", user);

        return "security/userinfo";

    }	

}
