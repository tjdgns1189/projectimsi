<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>



<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>



<h1>
	실험용  예비 페이지
</h1>


<P>  The time on the server is ${serverTime}. </P>
<sec:authorize access="isAuthenticated()">
    로그인한 사용자: <sec:authentication property="principal.username"/>
    <c:forEach var="authority" items="${authorities}">
    	${authority.authority}<br/>
	</c:forEach>
     <c:url var="logoutUrl" value="/logout"/>
      <form class="form-inline" action="${logoutUrl}" method="post">
          <input type="submit" value="Log out" />
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </form>
	<a href="member/mypage" >마이페이지</a>
</sec:authorize>
<sec:authorize access="isAnonymous()">
<a href="member/loginForm">로그인</a>
<a href="member/register">회원가입</a>
</sec:authorize>



<footer>
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</footer>
</body>
</html>
