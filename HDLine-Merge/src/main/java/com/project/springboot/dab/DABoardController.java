package com.project.springboot.dab;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import javax.swing.plaf.synth.Region;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.project.springboot.Utils.FileService;
import com.project.springboot.board.FreeBoardService;
import com.project.springboot.board.FreeboardDTO;
import com.project.springboot.member.User;
import com.project.springboot.member.UserRepository;
import com.project.springboot.member.UserSaveRequestDto;
import com.project.springboot.member.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DABoardController {
	@Autowired
	DesginerAppealBoardService modelAppealBoardService;
	@Autowired
	UserRepository userRepository;
	@Autowired
	DesignerAppealBoardRepository designerAppealBoardRepository;
	@Autowired
	FileService fileService;
	@Autowired
	UserService userService;
	
	@RequestMapping("desboard/create")
	public String create() {
//		UserSaveRequestDto user = UserSaveRequestDto.builder().userid("admin").password("1234").email("test@test.com").build();
//		userService.save(user);
		
		User user1 = userRepository.getById((long)15);
		for (int i = 0; i < 20; i++) {
			DesignerAppealBoard designerAppealBoard = DesignerAppealBoard.builder().title("tet"+i).content("테스트용 컨텐츠"+i).region("서울").user(user1).currentphoto("shor.jpg").build();
			designerAppealBoardRepository.save(designerAppealBoard);
			
		}
		return "redirect:/desboard/list/";
	}
	
	@RequestMapping("desboard/list/")
	public String MABlist(Model model, @RequestParam(defaultValue = "0") int page) {
//		model.addAttribute("MABlists",modelAppealBoardService.listAll());
	
        int pageSize = 10; // 페이지당 항목 수
        Sort sort = Sort.by(Sort.Direction.DESC, "DABno");
        Pageable pageable = PageRequest.of(page, pageSize, sort);
        Page<DesignerAppealBoard> boardPage = designerAppealBoardRepository.findAll(pageable);

        model.addAttribute("boardPage", boardPage);
        
		return "DAB/DABpagingList";
	}
	
	@GetMapping("desboard/search")
	public String MABsearch(@RequestParam(value = "searchField", required=false)String searchField,@RequestParam("keyword")String keyword, Model model, @RequestParam(defaultValue = "0") int page) {
		System.out.println("키워드:"+ keyword);
		System.out.println("컬럼:"+ searchField);
		List<DesignerAppealBoard> searchlist = modelAppealBoardService.search(searchField,keyword);
		System.out.println(searchlist.toString());
		// 원래 이 메소드는 정의해놓으면 Page를 자동반환 가능하다 지금은 Test느낌으로
//		List<User> userList = userRepotiroy.findAllByName(name);
		// 요청으로 들어온 page와 한 page당 원하는 데이터의 갯수
		int pageSize = 10; // 페이지당 항목 수
        Sort sort = Sort.by(Sort.Direction.DESC, "DABno");
		Pageable pageable = PageRequest.of(page, pageSize, sort);
		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), searchlist.size());
		Page<DesignerAppealBoard> boardPage = new PageImpl<>(searchlist.subList(start, end), pageable, searchlist.size());
		
		
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("searchField", searchField);
		model.addAttribute("keyword", keyword);
		
		return "DAB/DABpagingSearchList";
	}
	
	
	@RequestMapping("desboard/list/{region}/")
	public String MABlistRegion(Model model, @RequestParam(defaultValue = "0") int page, @PathVariable(value ="region") String region) {
		
//		model.addAttribute("MABlists",modelAppealBoardService.listAll());
		String koreanRegion;
		if (region.equals("seoul")) {
			koreanRegion = "서울";
		}else if (region.equals("IG")) {
			koreanRegion = "경기인천";
		}else if (region.equals("Gang")) {
			koreanRegion = "강원";
		}else if (region.equals("JC")) {
			koreanRegion = "충청전라";
		}else if (region.equals("GB")) {
			koreanRegion = "경상부산";
		}else if (region.equals("JEJU")) {
			koreanRegion = "제주";
		}else {
			koreanRegion = null;
		}
		
		int pageSize = 10; // 페이지당 항목 수
		Sort sort = Sort.by(Sort.Direction.DESC, "DABno");
		Pageable pageable = PageRequest.of(page, pageSize, sort);
		Page<DesignerAppealBoard> boardPage = designerAppealBoardRepository.findByRegion(koreanRegion, pageable);
//		Page<ModelAppealBoard> boardPage = modelAppealBoardRepository.findAll(pageable);
		
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("region", region);
		
		return "DAB/DABpagingListRegion";
	}
	
	
	
	
	@GetMapping("desboard/list/{region}/search")
	public String MABsearch(@RequestParam(value = "searchField", required=false)String searchField,@RequestParam(value = "keyword")String keyword, Model model, @RequestParam(defaultValue = "0") int page, @PathVariable("region") String region ) {
		String koreanRegion;
		if (region.equals("seoul")) {
			koreanRegion = "서울";
		}else if (region.equals("IG")) {
			koreanRegion = "경기인천";
		}else if (region.equals("Gang")) {
			koreanRegion = "강원";
		}else if (region.equals("JC")) {
			koreanRegion = "충청전라";
		}else if (region.equals("GB")) {
			koreanRegion = "경상부산";
		}else if (region.equals("JEJU")) {
			koreanRegion = "제주";
		}else {
			koreanRegion = null;
		}
		
		int pageSize = 10; // 페이지당 항목 수
        Sort sort = Sort.by(Sort.Direction.DESC, "DABno");
		Pageable pageable = PageRequest.of(page, pageSize, sort);
		System.out.println(searchField+ keyword+ region);
		Page<DesignerAppealBoard> boardPage = modelAppealBoardService.searchregion(searchField, keyword, koreanRegion, pageable);
		
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("region", region);
		model.addAttribute("searchField", searchField);
		model.addAttribute("keyword", keyword);
		
		return "DAB/DABpagingRegionSearchList";
	}
	
	
	
	
	@GetMapping("desboard/writeform")
	public String writeform(){
		return "DAB/DABwrite";
	}
	
	@PostMapping("desboard/write")
	public String writeProcess(@RequestParam("no")long no,
//								@ModelAttribute ModelAppealBoardDTO board,
								@RequestParam("title") String title,
								@RequestParam("content") String content,
								@RequestParam("region") String region,
//								@RequestParam("postdate") String postdate,
								@RequestPart MultipartFile file, HttpServletRequest req
								) throws IOException {
		User user = userRepository.getById(no);
		
		//파일 업로드
//		List<String> list = new ArrayList<>();
		System.out.println(file.toString());
//		for (MultipartFile file : files) {
			String originalfileName = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID(); // 랜덤으로 식별자를 생성
			String fileName = uuid + "_" + file.getOriginalFilename(); // UUID와 파일이름을 포함된 파일 이름으로 저장
			String projectPath = System.getProperty("user.dir")+"\\src\\main\\webapp\\img\\";
			File destination = new File(projectPath, fileName);
			
			//저장
			file.transferTo(destination);
//			list.add(fileName);
//		}
		//
		DesignerAppealBoard post = DesignerAppealBoard.builder()
												.content(content)
												.region(region)
												.title(title)
//												.postdate(postdate)
												.user(user)
												.currentphoto(fileName)
												.filepath(projectPath)
												.build();
		System.out.println("파일이름:"+fileName.toString());
		

		
		designerAppealBoardRepository.save(post);
		
		return "redirect:/desboard/list/";
	}
	
	@GetMapping("/desboard/detail/{no}")
	public String detailMAB(@PathVariable(value = "no") Long no, Model model) {
		model.addAttribute("post",designerAppealBoardRepository.findById(no).orElse(null));
		return "DAB/DABdetail";
	}
	
	@GetMapping("/desboard/{no}/delete")
	public String deleteMAB(@PathVariable(value = "no") Long no, Model model) {
		designerAppealBoardRepository.deleteById(no);
		
		return "redirect:/desboard/list/";
	}
	@GetMapping("/desboard/{no}/updateform")
	public String updateFormMAB(@PathVariable(value = "no") Long no, Model model) {
		model.addAttribute("post",designerAppealBoardRepository.findById(no).orElse(null));
		return "DAB/DABupdate";
	}
	
	@PostMapping("/desboard/update/{no}")
    public String updateFreeboardPost(@PathVariable Long no, @ModelAttribute DesignerAppealBoard post, Model model) {
		    
			post.setDABno(no);
	
		    designerAppealBoardRepository.save(post);
		    
	
		    return "redirect:/desboard/detail/"+no;
		
    }
	
	
}
