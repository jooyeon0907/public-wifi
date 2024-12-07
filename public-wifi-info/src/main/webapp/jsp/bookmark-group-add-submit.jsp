<%@page import="db.BookmarkGroupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	 	request.setCharacterEncoding("UTF-8");
	    
		String name = request.getParameter("bookmark_name");
		int order = Integer.valueOf(request.getParameter("order"));
	
		BookmarkGroupDAO bgDao = new BookmarkGroupDAO();
		int res = bgDao.createBookmarkGroup(name, order);
				
		String message = res > 0 ? "북마크 그룹 정보를 추가하였습니다." : "북마크 그룹 정보 추가를 실패하였습니다.";
	    String redirectURL = res > 0 ? "bookmark-group.jsp" : "bookmark-group-add.jsp";
	%>
	
	
</body>
<script>
    alert("<%= message %>");
    window.location.href = "<%= redirectURL %>";
</script>
</html>