package com.class_ic.websocket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {

	private Map<Object, WebSocketSession> users = new ConcurrentHashMap();
	private Map<String, String> ids = new ConcurrentHashMap();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log("접속 성공" + session.getId() + "웹소켓 세션 아이디");
		String userid = (String) session.getAttributes().get("userId");

		System.out.println("userID" + userid);

		users.put(userid, session);
		ids.put(session.getId(), userid);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log((String) session.getAttributes().get("userId"));

		users.remove("parammsg");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println("---------------------------------");

		System.out.println("받은 ID값 : " + message.getPayload());

		String msg = message.getPayload();

		for (WebSocketSession s : users.values()) {
			System.out.println("--------선택받은사람-----------");
			System.out.println("아이디>" + msg + "<");
			System.out.println("---------------------");
			System.out.println(msg + "에게 메세지 전송!");
			if (ids.get(s.getId()).equals(msg)) {

				s.sendMessage(message);

			} else {

			}
			log(s.getId() + "에게 메시지 전송");
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log((String) session.getAttributes().get("userId") + " 에러 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
