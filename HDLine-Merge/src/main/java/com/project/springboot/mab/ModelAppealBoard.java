package com.project.springboot.mab;



import com.project.springboot.member.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "ModelAppealBoard")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ModelAppealBoard {
	@Id
	@SequenceGenerator(
			name = "MAB_SEQ_GEN",
			sequenceName = "MAB_SEQ",
			initialValue = 1,
			allocationSize = 1
	)
	@GeneratedValue(generator = "MAB_SEQ_GEN")
	private Long MABno;
	@ManyToOne
	@JoinColumn(name="Members_no")
	private User user;
	
	private String title;
	private String content;
	private String region;
	private String currentphoto;
	private String filepath;
	private String postdate;

}
