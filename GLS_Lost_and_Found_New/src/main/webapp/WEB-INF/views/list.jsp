<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<%-- <link rel="stylesheet" href="${path}/resources/css/style.css"> --%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/uikit@3.5.16/dist/css/uikit.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
  function delete_ok(id) {
    var a = confirm("정말로 삭제하겠습니까?");
    if (a)
      location.href = 'deleteok/' + id;
  }

  <c:if test="${process_result == 'write success'}">
  alert("작성하신 글이 정상적으로 등록되었습니다.");
  </c:if> // 쓰기 메세지 처리

  <c:if test="${process_result == 'update success'}">
  alert("글 수정이 정상적으로 처리되었습니다.");
  </c:if> // 수 메세지 처리

  <c:if test="${process_result == 'delete success'}">
  alert("글 삭제가 정상적으로 처리되었습니다.");
  </c:if> // 삭제 메세지 처리

  //이전 버튼 이벤트
  function fn_prev(page, range, rangeSize) {
    var page = ((range - 2) * rangeSize) + 1;
    var range = range - 1;

    var url = "${pageContext.request.contextPath}/board/list";
    url = url + "?page=" + page;
    url = url + "&range=" + range;

    location.href = url;
  }

  //페이지 번호 클릭
  function fn_pagination(page, range, rangeSize, searchType, keyword) {
    var url = "${pageContext.request.contextPath}/board/list"
    url = url + "?page=" + page;
    url = url + "&range=" + range;

    location.href = url;
  }

  //다음 버튼 이벤트
  function fn_next(page, range, rangeSize) {
    var page = parseInt((range * rangeSize)) + 1;
    var range = parseInt(range) + 1;

    var url = "${pageContext.request.contextPath}/board/list";
    url = url + "?page=" + page;
    url = url + "&range=" + range;

    location.href = url; 
  }
</script>




</head>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer>
</script>
 
<body>

	<span id="name"> </span>
	
	<span class="username"> welcome <strong> ${login.username} </strong> </span>
	
	<%@include file="./modules/header.jsp"%>
	<%@include file="./modules/navbar.jsp"%>

	<div id="list_area">
	<table id="list" width="100%">
		<c:forEach items="${list}" var="u">

			<div class="card">
				<div class="seq">${u.seq}</div>
				<div class="image">

					<img
						src="${pageContext.request.contextPath}/resources/upload/${u.photourl}"
						style="box-sizing: border-box; width: 100%; height: 230px" />
				</div>
				<div class="description">

					<script>
            var lf = ${u.lost};
            if (lf)
              document.write('<span style="background-color:#CBECBB; padding:1.5px 3px; border-radius: 3px;">Found</span>');
            else
              document.write('<span style="background-color:#F1CBC2; padding:1.5px 3px; border-radius: 3px;">Lost</span>');
          </script>

					<span class="title">${u.title}</span>
					
					<div class="name">상품명 : ${u.category}</div>

					<div class="price">가격 : ${u.writer}</div>

					<div class="other" style="box-sizing: border-box; height: 50px;">비고
						: ${u.content}</div>

					<div class="regdate">작성일자 : ${u.regdate}</div>

					<div id="buttonArea">
						<div id="editButton">
							<a id="fontcolor" href="editform/${u.seq}">Edit</a>
						</div>

						<div id="deleteButton">
							<a id="fontcolor" href="javascript:delete_ok('${u.seq}')">Delete</a>
						</div>

					</div>

				</div>


			</div>
		</c:forEach>
	</table>
	
	</div>




	<%-- <div class="container">
		<div class="row">
			<table id="list" width="90%">
				<c:forEach items="${list}" var="u">
					<div class="col-sm-4">
						<div class="panel panel-primary">

							<div class="panel-heading">${u.seq}</div>
							<div class="panel-heading">${u.title}</div>
							<div class="panel-body"
								style="box-sizing: border-box; width: 300px; height: 300px;">
								<img src=${u.photourl
									}
									style="box-sizing: border-box; width: 100%; height: 100%;" />
							</div>
							<div class="panel-footer">상품명 : ${u.category}</div>
							<div class="panel-footer">가격 : ${u.writer}</div>
							<div class="panel-footer"
								style="box-sizing: border-box; height: 100px;">비고 :
								${u.content}</div>
							<div class="panel-footer">${u.regdate}</div>
							<div class="panel-footer">
								<div id="buttonArea">
									<div id="editButton">
										<a id="fontcolor" href="editform/${u.seq}">Edit</a>
									</div>

									<div id="deleteButton">
										<a id="fontcolor" href="javascript:delete_ok('${u.seq}')">Delete</a>
									</div>

								</div>



							</div>
						</div>
					</div>

				</c:forEach>
			</table>


		</div>
	</div>
 --%>
	<br>

	<!-- pagination{s} -->

	<div id="paginationBox"  align="center"">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>


			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="idx">
				<li
					class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
					class="page-link" href="#"
					onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
						${idx} </a></li>
			</c:forEach>

			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->
	
	<br>

	<%@include file="./modules/footer.jsp"%>

</body>
</html>