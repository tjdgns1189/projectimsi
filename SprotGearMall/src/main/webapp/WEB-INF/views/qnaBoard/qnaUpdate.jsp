<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.qnaBoardTitle }</title>
</head>
<body>
<div class="container-fluid">
 <div class="row">
  <!-- 사이드바 메뉴 -->
  <jsp:include page="../includes/qna-sidebar.jsp" />
   <!-- 메인 콘텐츠 -->
   <div class="col-md-10">
   <h1>QNA게시판</h1>
	<h2>글 수정 페이지</h2>
	<form action="qnaUpdate" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="page" value="${page }">
		<div>
			<p>글 번호 : ${vo.qnaBoardId }</p>
			<input type="hidden" name="qnaBoardId" value="${vo.qnaBoardId }">
		</div>
		<div>
			<p>제목 : </p>
			<input type="text" name="qnaBoardTitle" value="${vo.qnaBoardTitle }">
		</div>
		<div>
			<p>작성자 : ${pageContext.request.userPrincipal.name}</p>
			<p>작성일 : ${vo.qnaBoardCreatedDate }</p>
		</div>
		<div>
			<textarea rows="20" cols="120" name="qnaBoardContent">${vo.qnaBoardContent }</textarea>
		</div>
		<div>
			<input type="submit" value="등록">
		</div>
	</form>	
</div>
</div>
</div>
</body>
</html>