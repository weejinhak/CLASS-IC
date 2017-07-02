package com.class_ic.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.MessageService;
import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.MessageDTO;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	
	@RequestMapping(value="messagememberlist.htm",method=RequestMethod.POST)
	public String messageMemberList(String classCode,Model model){
		System.out.println("메세지 컨트롤러"+classCode);
		ArrayList<MemberDTO> msgmemberlist= new ArrayList<MemberDTO>();
		
		msgmemberlist=messageService.selectSameMemberList(classCode);
		for (MemberDTO m : msgmemberlist) {
			System.out.println(m.getEmail());
			System.out.println(m.getName());
		}
		
		model.addAttribute("member", msgmemberlist);
	
		return "common/senderlist";
		
	}
	
	
	@RequestMapping(value="messagecontentlist.htm",method=RequestMethod.POST)
	public String messageContentList(String email,Model model){
		System.out.println("메세지 컨텐츠 컨트롤러"+email);
		
		ArrayList<MessageDTO> msgcontentlist= new ArrayList<MessageDTO>();
		
		msgcontentlist=messageService.selectMsgContentList(email);
		for (MessageDTO m : msgcontentlist) {
			System.out.println(m.getMessageNo());
			System.out.println(m.getMsContent());
			System.out.println(m.getEmailS());
			System.out.println(m.getMsSendTime());
		}
		
		model.addAttribute("msgcontentlist", msgcontentlist);
	
		return "common/message_data_table";
		
	}
	
	
}
