package com.project.springboot.dab;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DesignerAppealBoardRepository extends JpaRepository<DesignerAppealBoard, Long>{
	List<DesignerAppealBoard> findByTitleContaining(String keyword);
	List<DesignerAppealBoard> findByContentContaining(String keyword);
	Page<DesignerAppealBoard> findByRegion(String region,Pageable pageable);
	@Query(value="select * from (select  * from model_appeal_board where region = :region ) where :searchField like %:content%", nativeQuery =true)
	Page<DesignerAppealBoard> findByRegionKeyword(@Param("region") String region,@Param("searchField")String searchField,@Param("content") String content,Pageable pageable);
	
	Page<DesignerAppealBoard> findByRegionAndContentContaining(String region, String keyword, Pageable pageable);
	Page<DesignerAppealBoard> findByRegionAndTitleContaining(String region, String keyword, Pageable pageable);
}

