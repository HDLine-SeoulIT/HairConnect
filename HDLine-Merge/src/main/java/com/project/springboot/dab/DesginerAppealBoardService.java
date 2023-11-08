package com.project.springboot.dab;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.project.springboot.member.UserRepository;

@Service
public class DesginerAppealBoardService {
	@Autowired
	DesignerAppealBoardRepository designerAppealBoardRepository;
	@Autowired
	UserRepository userRepository;
	
	public List<DesignerAppealBoard> listAll(){
		List<DesignerAppealBoard> modelAppealListAll = designerAppealBoardRepository.findAll(Sort.by(Sort.Direction.ASC,"DABno"));
		return modelAppealListAll;
	}
	
	public List<DesignerAppealBoard> search(String searchField, String keyword){
		List<DesignerAppealBoard> modelAppealsearch;
		System.out.println("서비스: searchField:"+searchField);
		System.out.println("서비스: keyword:"+keyword);
		System.out.println("if값:"+searchField.equals("title"));
		
		if (searchField.equals("title")) {
			modelAppealsearch = designerAppealBoardRepository.findByTitleContaining(keyword);
			return modelAppealsearch;
		}else if (searchField.equals("content")) {
			modelAppealsearch = designerAppealBoardRepository.findByContentContaining(keyword);
			return modelAppealsearch;
		}else {
			return null;
		}
		
	}
	public Page<DesignerAppealBoard> searchregion(String searchField, String keyword,String region, Pageable pageable){
		Page<DesignerAppealBoard> designerappealsearch;
		System.out.println("서비스: searchField:"+searchField);
		System.out.println("서비스: keyword:"+keyword);
		System.out.println("if값:"+searchField.equals("title"));
		if (searchField.equals("title")) {
			designerappealsearch = designerAppealBoardRepository.findByRegionAndTitleContaining(region,keyword,pageable);
			return designerappealsearch;
		}else if (searchField.equals("content")) {
			designerappealsearch = designerAppealBoardRepository.findByRegionAndContentContaining(region,keyword,pageable);
			return designerappealsearch;
		}else {
			return null;
		}
		
		
	}
	
	
	
	public List<DesignerAppealBoard> titlesearch(String keyowrd){
		List<DesignerAppealBoard> modelAppealsearch = designerAppealBoardRepository.findByTitleContaining(keyowrd);
		return modelAppealsearch;
	}
	
	public List<DesignerAppealBoard> contentsearch(String keyowrd){
		List<DesignerAppealBoard> modelAppealsearch = designerAppealBoardRepository.findByContentContaining(keyowrd);
		return modelAppealsearch;
	}
	
//	public Page<ModelAppealBoardDTO> paging(Pageable pageable){
//		int page = pageable.getNumberOfPages() -1;
//		int pageLimit = 10;
//		
//		Page<ModelAppealBoard> postPages = modelAppealBoardRepository.findAll(PageRequest.of(page, pageLimit,Sort.by(Direction.DESC,"id")));
//		
//		Page<ModelAppealBoardDTO> postsReponseDTOs = postPages.map(postPage -> new ModelAppealBoardDTO(postPage));
//		
//		return postsReponseDTOs;
//	}
	

}
