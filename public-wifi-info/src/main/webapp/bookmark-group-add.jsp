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
	
	<div class="table-div">
		<form action="bookmark-group-add-submit.jsp" method="get">
			<table class="table table-striped">
				<colgroups>
					<col style="width: 20%"/>
					<col style="width: 80%"/>
				</colgroups>
				<tbody>
					<tr>
						<th>북마크 이름</th>
						<td><input type="text" name="bookmark_name"></td>
					</tr>
					<tr>
						<th>순서</th>
						<td><input type="text" name="order"></td>
					</tr>
					<tr class="table-botton">
						<td colspan="2">
							<button type="submit">추가</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
</body>
</html>