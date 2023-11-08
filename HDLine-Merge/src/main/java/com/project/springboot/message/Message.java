package com.project.springboot.message;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="Message")
@Entity
public class Message
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long message_no; // 자동생성 메세지 번호
	
	@Column(nullable = false)
	private String sender; // 보내는 사람 (이걸 어떻게 연결해야하는지?)  
	
	@Column(nullable = false)
	private String receiver; // 받는 사람 
	

	@Column(nullable = false, length = 400)
	private String title;  // 메세지 제목 
	

	@Column(nullable = false, length = 2000)
	private String content;  //메세지 내용 

	
	
}
