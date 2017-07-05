package com.class_ic.dao;

import java.util.ArrayList;
import java.util.List;

import com.class_ic.vo.ClassByLectureDTO;
import com.class_ic.vo.ClassDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

public interface TeacherMainDAO {
	
//선생님 메인화면 출력
public ClassDTO teacherMain(String email,String classCode);

//선생님 기수에 물려있는 학생들의 수
public int memberCountByTeacher(String email);
}
