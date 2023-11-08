package com.project.springboot.message;


import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.springboot.member.User;
import com.project.springboot.member.UserRepository;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MessageController
{
	@Autowired
	MessageService messageService;

	@Autowired
	MessageRepository messageReopository;
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("/message/messageForm")
	public String write()
	{	
		return "message/Messageform";
	}
	@GetMapping("/message/messageForm/{reciever}")
	public String write(Model model,@PathVariable String reciever)
	{	
		
		model.addAttribute("reciever",reciever);
		return "message/Messageform";
	}
	@GetMapping("/message/create")
	public String create()
	{	
		for (int i = 0; i < 30; i++) {
			MessageDTO message = MessageDTO.builder().sender("1").receiver("5").title("제목"+i).content("내용"+i).build();
			messageService.saveMessage(message);
		}
		return "redirect:/message/list";
	}
	
	 @PostMapping("/message/write")
	    public String handleFormSubmit(@RequestParam("receiver") String receiver,
	    							   @RequestParam("sender") String sender,
	                                   @RequestParam("title") String title,
	                                   @RequestParam("content") String content) 
	 {
	        MessageDTO message = new MessageDTO();
	        message.setReceiver(receiver);
	        message.setSender(sender);
	        message.setTitle(title);
	        message.setContent(content);
	        

	        messageService.saveMessage(message); // 데이터베이스에 저장

	        return "redirect:/message/messageForm"; // 성공 페이지로 리다이렉트
	    }
	 
	 @GetMapping("/message/receive/list/{reciverno}")
	 public String receiveList(Model model,@PathVariable String reciverno) {
		 List<Message> messagelist = messageReopository.findByReceiver(reciverno);
		 model.addAttribute("messagelist",messagelist);
		 return "message/messageRecieved";
	 }
	 @GetMapping("/message/send/list/{sender}")
	 public String sendList(Model model,@PathVariable String sender) {
		 List<Message> messagelist = messageReopository.findBySender(sender);
		 model.addAttribute("messagelist",messagelist);
		 return "message/messageRecieved";
	 }
	 
	 @GetMapping("message/delete/{no}")
	 public String deleteMessage(@PathVariable long no,HttpServletRequest request) {
		 //이전페이지로 돌아가기위한 url헤더
		 String referer = request.getHeader("Referer");
		 messageReopository.deleteById(no);
		 
		 return "redirect:" + referer; 
	 }
	 
	 
}
