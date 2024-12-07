<%@page import="db.LocalHistoryDAO"%>
<%@page import="db.LocalHistory"%>
<%@page import="java.util.List"%>
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
	
	.is_not_info {
	    text-align: center;
	    padding: 20px;
	}
	.note_btn {
	    text-align: center;
	}
</style>
</head>
<body>
	<h1>위치 히스토리 목록</h1>
	
	<%@ include file="header.jsp" %>
	<div class="table-div">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>X좌표</th>
					<th>Y좌표</th>
					<th>조회일자</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<%
					LocalHistoryDAO historyDAO = new LocalHistoryDAO();
					List<LocalHistory> historyList = historyDAO.getLocalHistoryList();	
					
					if (historyList == null || historyList.size() == 0) {
				%>
					<tr>
						<td colspan="5" class ="is_not_info" >정보가 존재하지 않습니다.</td>
					</tr>  
				<%						
					} else {
						for(LocalHistory history: historyList) {
					%>
						<tr>
							<td><%=history.getId()%></td>
							<td><%=history.getX()%></td>
							<td><%=history.getY()%></td>
							<td><%=history.getSearchDate()%></td>
							<td class="note_btn">
								<a href="history-delete.jsp?id=<%=history.getId()%>" class="padding_2">삭제</a>
							</td>
						</tr>
					<%
						}
					}
				%>
			</tbody>
		</table>
	</div>
	
</body>
</html>