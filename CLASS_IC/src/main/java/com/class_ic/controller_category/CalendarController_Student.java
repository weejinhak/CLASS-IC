/*
* @FileName		:	CalendarController_Student.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.26
* @Author		:   박소현,노지영
*/
package com.class_ic.controller_category;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.CalendarDAO;
import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.TodayLectureVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "student", method = RequestMethod.POST)
public class CalendarController_Student {

	@Autowired
	private SqlSession sqlSession;


	/*
	 * @description : DB에 저장된 일정들을 캘린더에 출력
	 */
	@RequestMapping(value = "CalendarList.htm", method = RequestMethod.GET)
	public void CalendarIList(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute CalendarDTO dto2) throws ParseException {

		CalendarDAO calendardao = sqlSession.getMapper(CalendarDAO.class);

		ArrayList<CalendarDTO> calendarlist = calendardao.CalendarList();

		JSONArray array = new JSONArray();

		for (int i = 0; i < calendarlist.size(); i++) {

			JSONObject obj = new JSONObject();
			obj.put("id", calendarlist.get(i).getCalNo());
			obj.put("title", calendarlist.get(i).getCalTitle());

			String start = calendarlist.get(i).getCalStart();
			obj.put("start", start);
			String end = calendarlist.get(i).getCalEnd();
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");

			Calendar cal = Calendar.getInstance();

			java.util.Date date = sdformat.parse(end);

			cal.setTime(date);
			cal.add(Calendar.DATE, +1);

			end = sdformat.format(cal.getTime());

			obj.put("end", end);

			obj.put("className", calendarlist.get(i).getColor());

			array.add(obj);
		}

		try {
			response.getWriter().print(array);

		} catch (IOException e) {

			e.printStackTrace();
		}

	}
	
	/*
	 * @description : 오늘의 강의 출력
	 */
	@RequestMapping(value = "todayclass.htm", method = RequestMethod.POST)
	public void CalendarTodayClass(HttpServletRequest request, HttpServletResponse response) throws IOException {

		JSONArray todatlist = new JSONArray();
		CalendarDAO calendardao = sqlSession.getMapper(CalendarDAO.class);
		String cdate = request.getParameter("clickdate");
		String cday = cdate.substring(8, 10);
		String cmonth = cdate.substring(4, 7);
		String cyear = cdate.substring(11, 15);

		String clickdate = "";
		String[] monthlist = { "Jan", "Feb", "Mar", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
		for (int i = 0; i < monthlist.length; i++) {

			if (cmonth.equals(monthlist[i])) {
				cmonth = String.valueOf(i + 1);
			}

		}

		cmonth = '0' + cmonth;

		clickdate = cyear + "-" + cmonth + "-" + cday;

		ArrayList<TodayLectureVO> todaylist = calendardao.CalendarTodayClass(clickdate);
		JSONArray array = new JSONArray();
		for (TodayLectureVO value : todaylist) {
			JSONObject obj = new JSONObject();
			obj.put("todayTitle", value.getLectureTitle());
			obj.put("lectureNum", value.getLectureNo());
			array.add(obj);
		}

		response.getWriter().print(array);

	}

	/*
	 * @description : DB에 저장된 일정들을 히스토리에 출력
	 */
	@RequestMapping(value = "historyList.htm", method = RequestMethod.GET)

	public ModelAndView HistoryList(HttpServletRequest request, HttpServletResponse response) {

		CalendarDAO calendartdao = sqlSession.getMapper(CalendarDAO.class);

		ArrayList<CalendarDTO> historylist = calendartdao.HistoryList();

		ModelAndView model = new ModelAndView();

		model.addObject("list", historylist);
		model.setViewName("student.history");

		return model;

	}

}