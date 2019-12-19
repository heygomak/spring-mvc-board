<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<meta charset="UTF-8">
<title>게시물 리스트</title>
<style>
table {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	text-align: center;
}

tr td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

button {
	width: 70px;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
	display: inline-block;
	font-size: 12px;
	margin: 12px 24px;
	cursor: pointer;
	border-radius: 10px;
	float: right;
	cursor: pointer;
	background-color: #369;
}
</style>
</head>
<body>
	<form id="form1" name="form1" method="post"
		style="background-color: inherit; border: 0px">
		<input type="hidden" name="boardNo">
		<table>
			<thead class="thead-light">
				<tr>
					<th style="width: 5%;">글번호</th>
					<th style="width: 50%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 10%;">등록일</th>
					<th style="width: 10%;">수정일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="boardItem" items="${boardList}">
					<tr>
						<th><c:out value="${boardItem.boardNo}" /></th>
						<td style="text-align: left"><a style="cursor: pointer;"
							onclick="viewBoard('${boardItem.boardNo}')">${boardItem.boardTitle}</a></td>
						<td><c:out value="${boardItem.userId}" /></td>
						<td><c:out value="${boardItem.registDate}" /></td>
						<td><c:out value="${boardItem.lastDate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" onclick="insertBoard()">작성</button>
	</form>
</body>
<script>
	function viewBoard(boardNo) {
		var form = $('#form1')[0];
		form.action = 'boardOne';
		form.boardNo.value = boardNo;
		form.submit();
	}
	function insertBoard() {
		location = './boardInsertForm';
	}
</script>
</html>