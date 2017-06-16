package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.CalendarDto;

public interface CalendarDao {
      
      //일정 등록 
      public int CalendarWrite(CalendarDto calendar);
      
      //일정 출력
      public ArrayList<CalendarDto> CalendarList();
      
      //일정 삭제
      public int CalendarDelete(int calendar_id);
      
      

   }   