<%@page import="db.BookmarkGroupDAO"%>
<%@page import="db.BookmarkGroup"%>
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
	
	.margin-top-10 {
		margin-top: 10px;
	}
	.note_btn {
	    text-align: center;
	}
	
	.padding_2 {
		padding: 2px;
	}
	
</style>
</head>
<body>
	<h1>와이파이 정보 구하기</h1>
	
	<%@ include file="header.jsp" %>
	
	<div class="margin-top-10">
		<button type="button" onClick="location.href='bookmark-group-add.jsp'">북마크 그룹 이름 추가</button>
	</div>
	
	<%
		BookmarkGroupDAO bgDAO = new BookmarkGroupDAO();
		List<BookmarkGroup> bgList = bgDAO.getBookmarkGroupList();	
	%>
	<div class="table-div">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>북마크 이름</th>
					<th>순서</th>
					<th>등록일자</th>
					<th>수정일자</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (bgList == null || bgList.size() == 0) {
				%>
					<tr>
						<td colspan="6" class ="is_not_info" >정보가 존재하지 않습니다.</td>
					</tr>  
				<%						
					} else {
						for(BookmarkGroup bg: bgList) {
					%>
						<tr>
							<td><%=bg.getId()%></td>
							<td><%=bg.getName()%></td>
							<td><%=bg.getOrder()%></td>
							<td><%=bg.getRegDate()%></td>
							<td>
								<%=bg.getLastUpdated() == null? "" : bg.getLastUpdated()%>
							</td>
							<td class="note_btn">
								<a href="bookmark-group-edit.jsp?id=<%=bg.getId()%>" class="padding_2">수정</a>
								<a href="bookmark-group-delete.jsp?id=<%=bg.getId()%>" class="padding_2">삭제</a>
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