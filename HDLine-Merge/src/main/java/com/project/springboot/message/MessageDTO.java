package com.project.springboot.message;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MessageDTO
{
	private String sender;
	private String receiver;
	private String title;
	private String content;
	
	public Message toEntity()
	{
		return Message.builder()
				.sender(sender)
				.receiver(receiver)
				.title(title)
				.content(content)
				.build();
	}
}
