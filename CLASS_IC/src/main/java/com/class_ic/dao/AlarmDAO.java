package com.class_ic.dao;

import com.class_ic.vo.All_Alarm_DTO;

public interface AlarmDAO {
	    //알림 해줘야 할것을 넣어주기
		public void insertAlarm(All_Alarm_DTO dto);
		//알림 확인할시에 해당 알림 지워주기 
		public void deleteAlarm(String user_id);
		
		public int totalCount(String user_id);
		
		public int insertMessage(All_Alarm_DTO dto);
		
		public All_Alarm_DTO selectMessageNum();
		
		public void insertMessageReceive(All_Alarm_DTO dto);
		
		public void insertMessageSend(All_Alarm_DTO dto);
		
		
		
}
