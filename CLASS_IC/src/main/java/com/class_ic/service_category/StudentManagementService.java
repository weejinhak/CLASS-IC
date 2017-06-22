package com.class_ic.service_category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.StudentManagementDAO;
import com.class_ic.vo.StudentGroupDTO;
import com.class_ic.vo.StudentTableDTO;

@Service
public class StudentManagementService {
	@Autowired
	private SqlSession sqlsession;
	
	//학적부 setting
	public ModelAndView studentTableSetting(ModelAndView mv, StudentTableDTO stable){
		
		return mv;
	}
	
	//조편성 setting (과제 카테고리)
	public String groupSetting(StudentTableDTO stable){

		StudentManagementDAO student_dao = sqlsession.getMapper(StudentManagementDAO.class);
		int result = student_dao.studentGroupSetting(stable);
		
		return null;
	}
	
	//조편성 setting 정보 가져와서 쿠션페이지로 보낸다
	public List<StudentTableDTO> getGroupSettingInfo(){
		StudentManagementDAO student_dao = sqlsession.getMapper(StudentManagementDAO.class);
		List<StudentTableDTO> groupsetting=  student_dao.getStudentGroupSetting();
		
		return groupsetting;
	}
	
	//조 나눈거 정보 가져오기 (ajax get)
		public List<StudentGroupDTO> getstudentGroup(String classCode){
			StudentManagementDAO student_dao = sqlsession.getMapper(StudentManagementDAO.class);
			List<StudentGroupDTO> groupList = student_dao.getStudentGroup(classCode);
			
			return groupList;
		}
	
	//조 나눈거 정보 저장 (ajax post)
	public void studentGroup(String[] emailArr, String[] positionArr, String[] tableArr){
		StudentManagementDAO student_dao = sqlsession.getMapper(StudentManagementDAO.class);
		/*
		 * String[] emailArr= email.split(",");	
				String[] orderArr = order.split(",");
				String[] tableArr = groupTable.split(",");
		 */
		//int result = student_dao.studentGroupping(emailArr, orderArr, tableArr);
		
		
		StudentGroupDTO sgroup  = new StudentGroupDTO();
		
		for(int i=0;i<emailArr.length;i++){
			sgroup.setEmail(emailArr[i]);
			sgroup.setPosition(positionArr[i]);
			sgroup.setGroupTable(tableArr[i]);		
			student_dao.studentGroupping(sgroup);
		}
	
	}

}
