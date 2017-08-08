package com.class_ic.service_category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.MemoDAO;
import com.class_ic.vo.MemoVO;

@Service
public class MemoService {
   
   @Autowired
   private SqlSession sqlsession;
   
   //메모 등록
   public void insertMemo_Student(String email, String checkListItem) {
      
      MemoVO vo = new MemoVO();
      vo.setEmail(email);
      vo.setMemoText(checkListItem);
      
      MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
      int result = dao.insertMemo(vo);
      
   }
   
   //메모 출력
   public List<MemoVO> selectMemo_student(String email) {
      
      MemoVO vo = new MemoVO();
       vo.setEmail(email);
       
       MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
       List<MemoVO> memoList = dao.selectMemo(vo);
       
       return memoList;
       
   }
   
   //메모 삭제
   public void deleteMemo_Student(String email, int memoNo) {
      
      MemoVO vo = new MemoVO();
      vo.setEmail(email);
      vo.setMemoNo(memoNo);
      
      MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
      int result = dao.deleteMemo(vo);
      
   }
   

}