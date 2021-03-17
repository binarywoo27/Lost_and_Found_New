
<!-- 코드가 위 그리고 그것을 설명하는 주석이 아래 식으로 배치하겠다.  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"	
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 웹에 사용하는 메타태그 -->

<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<!--  두번째 게시판에서 참조하는 style인데 이걸 써? 말아? -->

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
    
</head>
<body>

    <%@include file="./modules/header.jsp"%>
    <%@include file="./modules/navbar.jsp"%>
    <!-- 모듈화  -->
    
    
	<div class ="container bootstrap snippet"> 
		<div class="row">
			<div class ="col-xs-12">
				<div class ="portlet portlet-default">
					<div class = "protlet-heading"> 
						<div class= "portlet-title">
							<h4>실시간 채팅</h4>
						</div>
						<div class ="clearfix"></div>
					</div>
					<div id = "chat" class="panel-collapse collapse in">
						<div id="chatlist" class="porlet-body chat-widget" style="overflow-y: auto; width : auto; height: 200px;">
						</div>
						<div class="portlet-footer">
							<div class = "row">
							
							</div>
							<div class ="row" style ="height: 90px;">
								<div class ="form-group col-xs-10">
									<textarea style="height:80px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlenght="100"></textarea>
								</div>
								<div class ="form-group col xs-2">
									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();"> 전송 </button>
									<div class "clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div claaa ="alert alert-success" id="successMessage" style="display: none;">
	<strong>메시지 전송에 성공했습니다. </strong>
	</div>
	<div claaa ="alert alert-danger" id="dangerMessage" style="display: none;">
	<strong>이름과 내용을 모두 입력해주세요. </strong>
	</div>
	<div claaa ="alert alert-warning" id="warningMessage" style="display: none;">
	<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>
	
	
    <%@include file="./modules/footer.jsp"%>
      <!-- 모듈화  -->
</body>
</html>