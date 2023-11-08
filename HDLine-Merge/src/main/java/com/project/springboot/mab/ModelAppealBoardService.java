package com.project.springboot.mab;

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
public class ModelAppealBoardService {
	@Autowired
	ModelAppealBoardRepository modelAppealBoardRepository;
	@Autowired
	UserRepository userRepository;
	
	public List<ModelAppealBoard> listAll(){
		List<ModelAppealBoard> modelAppealListAll = modelAppealBoardRepository.findAll(Sort.by(Sort.Direction.ASC,"MABno"));
		return modelAppealListAll;
	}
	
	public List<ModelAppealBoard> search(String searchField, String keyword){
		List<ModelAppealBoard> modelAppealsearch;
		System.out.println("서비스: searchField:"+searchField);
		System.out.println("서비스: keyword:"+keyword);
		System.out.println("if값:"+searchField.equals("title"));
		
		if (searchField.equals("title")) {
			modelAppealsearch = modelAppealBoardRepository.findByTitleContaining(keyword);
			return modelAppealsearch;
		}else if (searchField.equals("content")) {
			modelAppealsearch = modelAppealBoardRepository.findByContentContaining(keyword);
			return modelAppealsearch;
		}else {
			return null;
		}
		
	}
	public Page<ModelAppealBoard> searchregion(String searchField, String keyword,String region, Pageable pageable){
		Page<ModelAppealBoard> modelAppealsearch;
		System.out.println("서비스: searchField:"+searchField);
		System.out.println("서비스: keyword:"+keyword);
		System.out.println("if값:"+searchField.equals("title"));
		if (searchField.equals("title")) {
			modelAppealsearch = modelAppealBoardRepository.findByRegionAndTitleContaining(region,keyword,pageable);
			return modelAppealsearch;
		}else if (searchField.equals("content")) {
			modelAppealsearch = modelAppealBoardRepository.findByRegionAndContentContaining(region,keyword,pageable);
			return modelAppealsearch;
		}else {
			return null;
		}
		
		
	}
	
	
	
	public List<ModelAppealBoard> titlesearch(String keyowrd){
		List<ModelAppealBoard> modelAppealsearch = modelAppealBoardRepository.findByTitleContaining(keyowrd);
		return modelAppealsearch;
	}
	
	public List<ModelAppealBoard> contentsearch(String keyowrd){
		List<ModelAppealBoard> modelAppealsearch = modelAppealBoardRepository.findByContentContaining(keyowrd);
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
