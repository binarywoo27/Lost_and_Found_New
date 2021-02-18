<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>


	<h1>수정하기</h1>
	<form:form commandName="u" method="POST" action="../editok">
		<form:hidden path="seq" />
		<table id="list">
			<tr>
				<td id="definition">Lost/Found</td>
				<td><input type="radio" id="lost" name="lost" value="0" checked>
					<label for="lost">Lost</label> <input type="radio" id="found"
					name="lost" value="1"> <label for="found">Found</label></td>
			</tr>
			<tr>
				<td id="definition">제목</td>
				<td><form:input path="title" /></td>
			</tr>
			<tr>
				<td id="definition">상품명</td>
				<td><form:input path="category" /></td>
			</tr>
			<tr>
				<td id="definition">사진 URL</td>
				<td><form:input path="photourl" /></td>
			</tr>
			<tr>
				<td id="definition">분실/습득 날짜</td>
				<td><input type="date"
					id="lost_found_date" name="lost_found_date"></td>
			</tr>
			<tr>
				<td id="definition">글쓴이</td>
				<td><form:input path="writer" /></td>
			</tr>
			<tr>
				<td id="definition">내용</td>
				<td><form:textarea cols="50" rows="5" path="content" /></td>
			</tr>
			<tr>
				<td id="definition">특징</td>
				<td><form:textarea cols="50" rows="5" path="feature" /></td>
			</tr>
		</table>
		<br />
		<input type="submit" id="editOkButton" value="수정하기" />
		<input type="button" id="cancelButton" value="취소하기"
			onclick="history.back()" />
	</form:form>

</body>
</html>
