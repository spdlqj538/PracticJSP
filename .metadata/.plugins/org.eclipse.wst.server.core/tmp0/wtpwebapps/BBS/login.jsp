<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 <header id = "h-wrap" class = "w-[80%] h-[82px]">
		<div class = "w-[100%] h-[100%] border-solid border-b-2 border-black">
			<a href = "main.jsp" class="font-bold text-2xl leading-[72px] p-[10px]">JSP 게시판</a>
			<a href = "main.jsp" class = "p-[20px]">메인</a>
			<a href = "bbs.jsp">게시판</a>
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
		</div>
	</header>
	<section class="w-[80%] h-[600px]">
		<h2 class="text-center text-2xl leading-[150px]">로그인 폼</h2>
		<div class="w-full max-w-xs">
	  		<form method="post" action="loginAction.jsp" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
	    		<div class="mb-4">
	      			<label class="block text-gray-700 text-sm font-bold mb-2" for="username">아이디</label>
	      			<input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="userID" id="username" type="text" placeholder="아이디">
	    		</div>
	    		<div class="mb-6">
	      			<label class="block text-gray-700 text-sm font-bold mb-2" for="password">비밀번호</label>
	      			<input class="shadow appearance-none border  rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" name="userPassword" id="password" type="password" placeholder="비밀번호">
	    		</div>
	    		<div class="flex items-center justify-between">
	      			<input class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit" value="로그인">
	    		</div>
	  		</form>
		</div>
	</section>	
</body>
</html>