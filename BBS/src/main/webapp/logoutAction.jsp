<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta  http-equiv = "Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
	 <% 
	 	// 현재 이 페이지에 접속한 회원의 세션 값을 지워 로그아웃 기능 수행
	 	session.invalidate();
	 %>
	 <script>
	 	location.href = "main.jsp";
	 </script>
</body>
</html>