<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>

<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>게시글 작성하기</title>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
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

form, .mb-3 {
	margin: 30px 0px;
}

h2 {
	color: #036;
}
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>게시글 작성하기</h2>
			<form name="form" id="form3" role="form" method="post">
				<input type="hidden" name="boardNo">
				<div class="mb-3">
					<label for="title">제목</label>
					<c:choose>
						<c:when test="${vo.boardTitle == null}">
							<input type="text" class="form-control" name="boardTitle"
								id="title" placeholder="제목을 입력해 주세요">
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" name="boardTitle"
								id="title" value="${vo.boardTitle}">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<c:choose>
						<c:when test="${vo.boardContents == null}">
							<textarea class="form-control" rows="5" name=boardContents
								id="content" placeholder="내용을 입력해 주세요"></textarea>
						</c:when>
						<c:otherwise>
							<input class="form-control" rows="5" name="boardContents"
								id="content" value="${vo.boardContents}"></input>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
			<div>
				<c:choose>
					<c:when test="${vo.boardNo == null}">
						<button type="button"
							onclick="insertBoard()">저장</button>
					</c:when>
					<c:otherwise>
						<button type="button"
							onclick="updateBoard('${vo.boardNo}')">저장</button>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</article>
</body>
<script>
	function insertBoard() {
		var form = $('#form3')[0];
		form.action = 'boardInsert';
		form.submit();
	}
	function updateBoard(boardNo) {
		var form = $('#form3')[0];
		console.log("수정 함수 실행");
		form.action = 'boardUpdate';
		form.boardNo.value = boardNo;
		form.submit();
	}
</script>
</html>
