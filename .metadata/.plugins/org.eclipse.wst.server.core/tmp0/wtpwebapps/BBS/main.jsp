<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- script문장 실행을 위함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
<style>
	* {margin : 0 auto; padding : 0; list-style : none; text-decoration : none; box-sizing : border-box;}
</style>
</head>
<body>
	<%
		String userID = null;
	
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	 <header id = "h-wrap" class = "w-[80%] h-[82px]">
		<div class = "w-[100%] h-[100%] border-solid border-b-2 border-black">
			<a href = "main.jsp" class="font-bold text-2xl leading-[72px] p-[10px]">JSP 게시판</a>
			<a href = "main.jsp" class = "p-[20px]">메인</a>
			<a href = "bbs.jsp">게시판</a>
			<% if (userID == null) { %>
			<div class="float-right">
				<button id = "dropdownDefault" data-dropdown-toggle = "dropdown" class = "w-[100px] h-[82px] float-right text-black " type = "button">접속하기<svg class="w-4 h-4 float-right mt-[4px]" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button>
				<!-- Dropdown menu -->
				<div id = "dropdown" class = "hidden w-[100px] h-[100px] border-2 border-black rounded">
					<ul id="downlist" class = "text-center" aria-labelledby="dropdownDefault">
						<li class = "py-[12px]"><a href = "login.jsp">로그인</a></li>
						<li class = "py-[12px]"><a href = "join.jsp">회원가입</a></li>
					</ul>
				</div>
			</div>
			<% } else { %>
			<div class="float-right">
				<button id = "dropdownDefault" data-dropdown-toggle = "dropdown" class = "w-[100px] h-[82px] float-right text-black " type = "button">회원관리<svg class="w-4 h-4 float-right mt-[4px]" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button>
				<!-- Dropdown menu -->
				<div id = "dropdown" class = "hidden w-[100px] h-[100px] border-2 border-black rounded">
					<ul id="downlist" class = "text-center" aria-labelledby="dropdownDefault">
						<li class = "pt-[35px]"><a href = "logoutAction.jsp">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<% } %>
		</div>
	</header> 
</body>
</html>