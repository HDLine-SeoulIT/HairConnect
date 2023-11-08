package com.project.springboot.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.project.springboot.member.UserRepository;

@Service
public class MessageService
{
	@Autowired
	private MessageRepository messageRepository;

	@Autowired
	UserRepository userRepository;
	
	// 메세지 저장
	public Long saveMessage(MessageDTO messageDTO)
	{
		// MessageDTO를 Message 엔티티로 변환
		Message message = messageDTO.toEntity();

		// Message 엔티티 저장
		Message savedMessage = messageRepository.save(message);

		// 저장된 메시지의 ID 반환
		return savedMessage.getMessage_no();
	}

	// 메세지 삭제
	public void deleteMessage(Long messageNo)
	{
		messageRepository.deleteById(messageNo);
	}
}
