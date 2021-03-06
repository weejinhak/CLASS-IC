/*
* @FileName		:	WebSocketHandshakeInterceptor.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.24
* @Author		:	위진학
*/
package com.class_ic.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;


public class WebSocketHandshakeInterceptor extends HttpSessionHandshakeInterceptor{

    @Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {     
    
        
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
 

        System.out.println("beforehandshake 시작");        
        String email = (String)req.getSession().getAttribute("email");
        System.out.println(email); 
                
        //로그인한 사람 아이디 뽑기
		
        attributes.put("userId",email);  
      
        System.out.println("인터셉터 id:"+ email);

 
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
  
    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
    	
        System.out.println("After Handshake");
  
        super.afterHandshake(request, response, wsHandler, ex);
    }
    
}
