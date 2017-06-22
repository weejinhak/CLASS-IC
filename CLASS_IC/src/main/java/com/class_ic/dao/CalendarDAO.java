package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.TodayClassDTO;

public interface CalendarDAO {

      //일정 등록  완료
      public int CalendarWriteOk(CalendarDTO dto);
      
      //일정 보기
      public ArrayList<CalendarDTO> CalendarList();
      
      //일정 수정
      public void CalendarEdit(CalendarDTO dto);
      
      //일정 삭제 
      public int CalendarDelete(int calendar_id);
      
      //오늘의 수업 보기
      public ArrayList<String> CalendarTodayClass(String clickdate);

   }   