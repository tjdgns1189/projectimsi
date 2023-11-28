package edu.spring.mall.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

public class SecurityHandshakeInterceptor implements HandshakeInterceptor {

	   @Override
	    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
	                                   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
	        if (request instanceof ServletServerHttpRequest) {
	            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
	            HttpSession httpSession = servletRequest.getServletRequest().getSession();
	            SecurityContext securityContext = (SecurityContext) httpSession.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
	            if (securityContext != null && securityContext.getAuthentication() != null) {
	                attributes.put("SPRING_SECURITY_CONTEXT", securityContext);
	            }
	        }
	        return true;
	    }

	    @Override
	    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
	                               WebSocketHandler wsHandler, Exception exception) {
	    }

}
