<%@page import="db.WifiDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	WifiDAO wifiDao = new WifiDAO();
	int wifiCnt = wifiDao.loadWifi();
%>

<div style="text-align: center;">
<!-- 
	<%
		if (wifiCnt > 0) {
	%>
		<h1>N 개의 WIFI 정보를 정상적으로 저장하였습니다.</h1>
	<%
		} else {
	%>
		<h1>N 개의 WIFI 정보를 정상적으로 저장하였습니다.</h1>
	<%
		}
	%>
 -->
 		<h1><%=wifiCnt%>개의 WIFI 정보를 정상적으로 저장하였습니다.</h1>
		<a href="index.jsp">홈으로 가기</a>
</div>

</body>
</html>