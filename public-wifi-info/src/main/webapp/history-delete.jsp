<%@page import="db.LocalHistoryDAO"%>
<%@page import="db.LocalHistory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		width: 100%;
   		border-collapse: collapse;
	}
	
	th, td {
	    border: 1px solid #ccc;
	    padding: 10px;
	}
	
	th {
	    background-color: #00ab6f;
	    color: white;
	    text-align: center;
	}
	
	tr:nth-child(even) {
	    background-color: #f2f2f2;
	}
	
	tr:nth-child(odd) {
	    background-color: #ffffff;
	}
	
	.no-data {
		text-align: center;
        vertical-align: middle;
        height: 100px;
        font-style: italic;
	}
	
	.table-div {
		margin-top: 20px;
	}
	
	.table-botton {
		text-align: center;
	}
	
</style>
</head>
<body>
	<h1>와이파이 정보 구하기</h1>
	
	<%@ include file="header.jsp" %>
	
	<%
		int id = Integer.valueOf(request.getParameter("id"));
	
		LocalHistoryDAO historyDAO = new LocalHistoryDAO();
		LocalHistory history = historyDAO.getLocalHistory(id);
	%>
	
	<form action="history-delete-submit.jsp" method="post">
		<input type="hidden" name="id" value="<%=id%>">
		<div class="table-div">
			<table class="table table-striped">
				<colgroups>
					<col style="width: 20%"/>
					<col style="width: 80%"/>
				</colgroups>
				<tbody>
					<tr>
						<th>X좌표</th>
						<td><%=history.getX()%></td>
					</tr>
					<tr>
						<th>Y좌표</th>
						<td><%=history.getY()%></td>
					</tr>
					<tr>
						<th>조회일자</th>
						<td><%=history.getSearchDate()%></td>
					</tr>
					<tr class="table-botton">
						<td colspan="2">
							<a href="history.jsp">돌아가기</a>
							 | 
							<input type="submit" value="삭제">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>