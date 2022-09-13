<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- script문장 실행을 위함 -->
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>

<!DOCTYPE html>
<html>
<head>
<meta  http-equiv = "Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
	 <% 
	 	String userID = null;
	 	
	 	// session.getAttribute()로 부여받은 세션값이 null이 아니라면 부여받은 값을 변수에 저장
	 	if (session.getAttribute("userID") != null ) {
	 		userID = (String) session.getAttribute("userID");
	 		
	 	}
	 	
	 	if (userID == null) {
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('로그인이 필요합니다.')");
	 		script.println("location.href='login.jsp'");
	 		script.println("</script>");
	 		
	 	} 
		int bbsID = 0;
		
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));	
		}
		
		if (bbsID == 0) {
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('유효하지 않은 글입니다.')");
	 		script.println("location.href='bbs.jsp'");
	 		script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('권한이 없습니다.')");
	 		script.println("location.href='bbs.jsp'");
	 		script.println("</script>");
		} else {
		 	// 입력되지 않은 곳 체크
		 	if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null || request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('입력이 안 된 사항이 있습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 		
		 	} else {
		 		BbsDAO bbsDAO = new BbsDAO(); //BbsDAO 패키지 사용을 위해 인스턴스 생성
			 	// bbsDAO 안에 update함수에 정보 전달
		 	 	int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
			 	
			 	// result로 가져온 값에 따라 실행
			 	if (result == -1) {
			 		PrintWriter script = response.getWriter();
			 		script.println("<script>");
			 		script.println("alert('글 수정 실패')");
			 		script.println("history.back()");
			 		script.println("</script>");
			 		
			 	} else {
			 		PrintWriter script = response.getWriter();
			 		script.println("<script>");
			 		script.println("location.href='bbs.jsp'");
			 		script.println("</script>");
			 		
			 	}
		 		
		 	}	
	 	}
	 	
	 %>
</body>
</html>