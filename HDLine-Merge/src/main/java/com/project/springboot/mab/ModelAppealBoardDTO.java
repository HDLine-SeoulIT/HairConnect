package com.project.springboot.mab;

import com.project.springboot.member.User;

import lombok.Builder;
import lombok.Getter;

@Getter
public class ModelAppealBoardDTO {
	private User user;
	private String title;
	private String content;
	private String region;
	private String currentphoto;
	private String postdate;
	
	@Builder
	public ModelAppealBoardDTO(ModelAppealBoard entity) {
		this.user = entity.getUser();
		this.title = entity.getTitle();
		this.content = entity.getContent();
		this.region = entity.getRegion();
		this.currentphoto = entity.getCurrentphoto();
		this.postdate = entity.getPostdate();
		
	}
}
