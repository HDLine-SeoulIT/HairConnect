package com.project.springboot.mab;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ModelAppealBoardRepository extends JpaRepository<ModelAppealBoard, Long>{
	List<ModelAppealBoard> findByTitleContaining(String keyword);
	List<ModelAppealBoard> findByContentContaining(String keyword);
	Page<ModelAppealBoard> findByRegion(String region,Pageable pageable);
	@Query(value="select * from (select  * from model_appeal_board where region = :region ) where :searchField like %:content%", nativeQuery =true)
	Page<ModelAppealBoard> findByRegionKeyword(@Param("region") String region,@Param("searchField")String searchField,@Param("content") String content,Pageable pageable);
	
	Page<ModelAppealBoard> findByRegionAndContentContaining(String region, String keyword, Pageable pageable);
	Page<ModelAppealBoard> findByRegionAndTitleContaining(String region, String keyword, Pageable pageable);
}

