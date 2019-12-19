<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
div {
	border-bottom: 3px solid #036;
	margin: 10px;
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
	margin: 4px;
	cursor: pointer;
	border-radius: 10px;
	float: right;
	cursor: pointer;
}

article {
	margin: 10px 50px;
}
</style>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<form id="form1" name="form1" method="post">
		<input type="hidden" name="boardNo">
		<section>
			<div>
				<h4>
					<c:out value="${vo.userId}" />
					<small class="text-muted"><c:out value="${vo.lastDate}" /></small>
					<button type="button" style="background-color: #95a5a6;"
						onclick="deleteBoard('${vo.boardNo}')">삭제</button>
					<button type="button" style="background-color: #369;"
						onclick="updateBoard('${vo.boardNo}')">수정</button>
				</h4>
				<h2>
					<c:out value="${vo.boardTitle}" />
				</h2>
			</div>
			<article>
				<c:out value="${vo.boardContents}" />
			</article>
		</section>
	</form>
</body>
<script>
	function updateBoard(boardNo) {
		var form = $('#form1')[0];
		form.action = 'boardUpdateForm';
		form.boardNo.value = boardNo;
		form.submit();
	}
	function deleteBoard(boardNo) {
		var confirmDelete = confirm("해당 게시물을 정말 삭제하시겠습니까?");
		if (confirmDelete) {
			var form = $('#form1')[0];
			form.action = 'boardDelete';
			form.boardNo.value = boardNo;
			form.submit();
		}
	}
</script>
</html>