<%@page import="db.BookmarkDAO"%>
<%@page import="db.Bookmark"%>
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
	<h1>와이파이 정보 구하기</h1>
	
	<%@ include file="header.jsp" %>
	
	<%
		BookmarkDAO bookmarkDAO = new BookmarkDAO();
		List<Bookmark> bookmarkList = bookmarkDAO.getBookmarkList();	
	%>
	<div class="table-div">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>북마크 이름</th>
					<th>와이파이명</th>
					<th>등록일자</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (bookmarkList == null || bookmarkList.size() == 0) {
				%>
					<tr>
						<td colspan="5" class ="is_not_info" >정보가 존재하지 않습니다.</td>
					</tr>  
				<%						
					} else {
						for(Bookmark bookmark: bookmarkList) {
					%>
						<tr>
							<td><%=bookmark.getId()%></td>
							<td><%=bookmark.getBookMarkame()%></td>
							<td>
								<a href="wifi-detail.jsp?mgrNo=<%=bookmark.getWifiManagerNo()%>">
									<%=bookmark.getWifiName()%>
								</a>
							</td>
							<td><%=bookmark.getRegDate()%></td>
							<td class="note_btn">
								<a href="bookmark-delete.jsp?id=<%=bookmark.getId()%>" class="padding_2">삭제</a>
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