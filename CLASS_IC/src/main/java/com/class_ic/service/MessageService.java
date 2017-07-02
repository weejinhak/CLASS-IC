/*
* @FileName	:	MemberService_Web.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.17
* @Author		:	이현정
*/
package com.class_ic.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.MessageDAO;
import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.MessageDTO;

@Service
public class MessageService implements MessageDAO{
	

	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<MemberDTO> selectSameMemberList(String classCode) {

		MessageDAO msgDao= sqlsession.getMapper(MessageDAO.class);
		
		ArrayList<MemberDTO> msgmemberlist= msgDao.selectSameMemberList(classCode);
		
		return msgmemberlist;
	}

	@Override
	public ArrayList<MessageDTO> selectMsgContentList(String email) {
		
		MessageDAO msgDao= sqlsession.getMapper(MessageDAO.class);
		
		ArrayList<MessageDTO> msgcontentlist= msgDao.selectMsgContentList(email);
		
		return msgcontentlist;
	}


	

}
