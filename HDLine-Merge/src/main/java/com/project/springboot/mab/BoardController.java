package com.project.springboot.mab;

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
public class BoardController {
	@Autowired
	ModelAppealBoardService modelAppealBoardService;
	@Autowired
	UserRepository userRepository;
	@Autowired
	ModelAppealBoardRepository modelAppealBoardRepository;
	@Autowired
	FileService fileService;
	@Autowired
	UserService userService;
	
	@RequestMapping("modelboard/create")
	public String create() {
//		UserSaveRequestDto user = UserSaveRequestDto.builder().userid("admin").password("1234").email("test@test.com").build();
//		userService.save(user);
		
		for (int i = 2; i < 22; i++) {
			User user1 = userRepository.getById((long)i);
			for(int j=1; j<2; j++) {
			ModelAppealBoard modelAppealBoard = ModelAppealBoard.builder().title("모델지원합니다~"+i).content("테스트용 컨텐츠"+i).region("서울").user(user1).currentphoto("f1b38a33-035d-4c26-9ebb-c41610c08108_02.jpg").build();
			modelAppealBoardRepository.save(modelAppealBoard);
			ModelAppealBoard modelAppealBoard2 = ModelAppealBoard.builder().title("모델지원합니다~"+i).content("테스트용 컨텐츠"+i).region("강원").user(user1).currentphoto("f1b38a33-035d-4c26-9ebb-c41610c08108_02.jpg").build();
			modelAppealBoardRepository.save(modelAppealBoard2);
			ModelAppealBoard modelAppealBoard3 = ModelAppealBoard.builder().title("모델지원합니다~"+i).content("테스트용 컨텐츠"+i).region("제주").user(user1).currentphoto("f1b38a33-035d-4c26-9ebb-c41610c08108_02.jpg").build();
			modelAppealBoardRepository.save(modelAppealBoard3);
			}
		}
		return "redirect:/modelboard/list/";
	}
	
	@RequestMapping("modelboard/list/")
	public String MABlist(Model model, @RequestParam(defaultValue = "0") int page) {
//		model.addAttribute("MABlists",modelAppealBoardService.listAll());
	
        int pageSize = 10; // 페이지당 항목 수
        Sort sort = Sort.by(Sort.Direction.DESC, "MABno");
        Pageable pageable = PageRequest.of(page, pageSize, sort);
        Page<ModelAppealBoard> boardPage = modelAppealBoardRepository.findAll(pageable);

        model.addAttribute("boardPage", boardPage);
        
		return "ModelAppealBoard/MABpagingList";
	}
	
	@GetMapping("modelboard/search")
	public String MABsearch(@RequestParam(value = "searchField", required=false)String searchField,@RequestParam("keyword")String keyword, Model model, @RequestParam(defaultValue = "0") int page) {
		System.out.println("키워드:"+ keyword);
		System.out.println("컬럼:"+ searchField);
		List<ModelAppealBoard> searchlist = modelAppealBoardService.search(searchField,keyword);
		System.out.println(searchlist.toString());
		// 원래 이 메소드는 정의해놓으면 Page를 자동반환 가능하다 지금은 Test느낌으로
//		List<User> userList = userRepotiroy.findAllByName(name);
		// 요청으로 들어온 page와 한 page당 원하는 데이터의 갯수
		int pageSize = 10; // 페이지당 항목 수
        Sort sort = Sort.by(Sort.Direction.DESC, "MABno");
		Pageable pageable = PageRequest.of(page, pageSize, sort);
		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), searchlist.size());
		Page<ModelAppealBoard> boardPage = new PageImpl<>(searchlist.subList(start, end), pageable, searchlist.size());
		
		
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("searchField", searchField);
		model.addAttribute("keyword", keyword);
		
		return "ModelAppealBoard/MABpagingSearchList";
	}
	
	
	@RequestMapping("modelboard/list/{region}/")
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
		Sort sort = Sort.by(Sort.Direction.DESC, "MABno");
		Pageable pageable = PageRequest.of(page, pageSize, sort);
		Page<ModelAppealBoard> boardPage = modelAppealBoardRepository.findByRegion(koreanRegion, pageable);
//		Page<ModelAppealBoard> boardPage = modelAppealBoardRepository.findAll(pageable);
		
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("region", region);
		
		return "ModelAppealBoard/MABpagingListRegion";
	}
	
	
	
	
	@GetMapping("modelboard/list/{region}/search")
	public String MABsearch(@RequestParam(value = "searchField", required=false)String searchField,@RequestParam(value = "keyword")String keyword, Model model, @RequestParam(defaultValue = "0") int page, @PathVariable("region") String region ) {
		String koreanRegion;
//			String koreanRegion;
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
        Sort sort = Sort.by(Sort.Direction.DESC, "MABno");
		Pageable pageable = PageRequest.of(page, pageSize, sort);
		System.out.println(searchField+ keyword+ region);
		Page<ModelAppealBoard> boardPage = modelAppealBoardService.searchregion(searchField, keyword, koreanRegion, pageable);
		
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("region", region);
		model.addAttribute("searchField", searchField);
		model.addAttribute("keyword", keyword);
		
		return "ModelAppealBoard/MABpagingRegionSearchList";
	}
	
	@CrossOrigin 
	@GetMapping("/image") 
	public ResponseEntity<?> returnImage(@RequestParam String imageName) { 
	  String path = "C:\\DevData\\Project4_new\\HDLine-Boards\\src\\main\\resources\\static\\Uploads\\"; //이미지가 저장된 위치 
	  Resource resource = new FileSystemResource(path + imageName); 
	  return new ResponseEntity<>(resource, HttpStatus.OK); 
	}
	
	
	
	@GetMapping("modelboard/writeform")
	public String writeform(){
		return "ModelAppealBoard/MABwrite";
	}
	
	@PostMapping("modelboard/write")
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
		ModelAppealBoard post = ModelAppealBoard.builder()
												.content(content)
												.region(region)
												.title(title)
//												.postdate(postdate)
												.user(user)
												.currentphoto(fileName)
												.filepath(projectPath)
												.build();
		System.out.println("파일이름:"+fileName.toString());
		

		
		modelAppealBoardRepository.save(post);
		
		return "redirect:/modelboard/list/";
	}
	
	@GetMapping("/modelboard/detail/{no}")
	public String detailMAB(@PathVariable(value = "no") Long no, Model model) {
		model.addAttribute("post",modelAppealBoardRepository.findById(no).orElse(null));
		return "ModelAppealBoard/MABdetail";
	}
	
	@GetMapping("/modelboard/{no}/delete")
	public String deleteMAB(@PathVariable(value = "no") Long no, Model model) {
		modelAppealBoardRepository.deleteById(no);
		
		return "redirect:/modelboard/list/";
	}
	@GetMapping("/modelboard/{no}/updateform")
	public String updateFormMAB(@PathVariable(value = "no") Long no, Model model) {
		model.addAttribute("post",modelAppealBoardRepository.findById(no).orElse(null));
		return "ModelAppealBoard/MABupdate";
	}
	
	@PostMapping("/modelboard/update/{no}")
    public String updateFreeboardPost(@PathVariable Long no, @ModelAttribute ModelAppealBoard post, Model model) {
		    
		ModelAppealBoard existingPost = modelAppealBoardRepository.findById(no).orElse(null);

	    if (existingPost != null) {
	        // 사용자가 수정한 데이터로 기존 게시물을 업데이트합니다.
	        existingPost.setTitle(post.getTitle());
	        existingPost.setContent(post.getContent());
	        existingPost.setRegion(post.getRegion());
	        // 필요한 다른 속성들도 업데이트합니다.

	        // 업데이트된 게시물을 저장합니다.
	        modelAppealBoardRepository.save(existingPost);
	    }

	    return "redirect:/modelboard/detail/" + no;
    }
	
	
}
