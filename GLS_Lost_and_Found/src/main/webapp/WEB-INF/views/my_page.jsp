
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

<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		<!-- ne 는 != 하고 같다 -->
		<!-- 회원정보 수정 완료라고 알림창 뜨는 듯?!?-->
		
		<!-- 코드 사이트 출처:
			https://m.blog.naver.com/PostView.nhn?blogId=heartflow89&logNo=221115916689&proxyReferer=https:%2F%2Fwww.google.com%2F
		-->
		<!-- Old_ID, New_ID, Handong_mail, Confirm_ID-->
		<!-- 
		pw -> New_ID
		pw2 -> Confirm_ID
		-->
		
		if($("#pwForm").submit(function()
		{
			if($("#New_ID").val() !== $("#Confirm_ID").val()){
				alert("ID가 다릅니다.");
				$("New_ID").val("").focus();
				$("#Confirm_ID").val("");
				return false;
			}else if ($("#New_ID").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#New_ID").val("").focus();
				return false;
			}else if($.trim($("#New_ID").val()) !== $("#New_ID").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}
		<!-- 여기다 이제 한동구글 메일이 맞는지 확인하는 함수를 써야 한다. -->
		));
	})
</script>
<title>my_page</title>

</head>
<body>


    <%@include file="./modules/header.jsp"%>
    <%@include file="./modules/navbar.jsp"%>
    <!-- 모듈화  -->
    
    
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>ID 변경</h3>
			</div>
			<div>

				<form id="pwForm" action="../member/update_pw.do" method="post">
				<!--action 은 이 위치의 파일에서 해당 정보를 가지고 온다는 것 같다. . -->
					<input type="hidden" name="id" value="${ member.id }">

					<p>
						<label>새로운 ID</label> <input class="w3-input" id="New_ID"
							name="New_ID" type="text" required>
					</p>
					<p>
						<label>ID 재입력  </label> <input class="w3-input"
							id="Confirm_ID" name="Confirm_ID" type="text" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-round">ID
							변경하기</button>
					</p>
					
				</form>

				<form>
				
				
				<div class="w3-center w3-large w3-margin-top">
				<h3>작성한 게시판 목록 </h3>
				</div>
				
				<!-- 게시판 보기 및 삭제?-->

				<!-- 
				<%
			    String userID = null; 
				// 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
				//나중에 써 먹을 수 있지 않을까 싶어 일단 지우지는 않는다. 
			    if (session.getAttribute("userID") != null)
			    {
			        userID = (String)session.getAttribute("userID");
			    }
				%> 
				-->
	

				<div class="w3-center">
					<div class="row">
					
					<!--   <style>
					      table {
					        width: 100%;
					      }
					      table, th, td {
					        border: 1px solid #bcbcbc;
					      }
					    </style>
					    -->   
					    
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th style="background-color: #eeeeee; text-align: center;">제목</th>
									<th style="background-color: #eeeeee; text-align: center;">ID</th>
									<th style="background-color: #eeeeee; text-align: center;">작성일</th>
									<th style="background-color: #eeeeee; text-align: center;">설정 </th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>안녕하세요</td>
									<td>홍길동</td>
									<td>2021-01-04</td>
									<td>
									<a href="rewrite.jsp" class="btn w3-red btn-danger">삭제하기 </a> 
									<a href="rewrite.jsp" class="btn w3-blue btn-danger">수정하기</a>
									</td>
								</tr>
								
								<tr>
									<td>2</td>
									<td>지갑을 주웠습니다.</td>
									<td>길동이 </td>
									<td>2021-01-10 </td>
									<td>
									<a href="rewrite.jsp" class="btn w3-red btn-danger">삭제하기 </a> 
									<a href="rewrite.jsp" class="btn w3-blue btn-danger">수정하기</a>
									</td>
								</tr>
							</tbody>
						</table>
						</div>		    
					</div>
				</div>
				<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src="js/bootstrap.js"></script>
			
			    </form>

 				
 				
 				<!--채팅 목록  -->
 				
				<form>
				
				<div class="w3-center">
				<h3>채팅 목록 </h3>
				</div>
				
	
				<div class="w3-center">
					<div class="row">
					
					    <style>
					      table {
					        width: 100%;
					      }
					      table, th, td {
					        border: 1px solid #bcbcbc;
					      }
					    </style>
					    
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th style="background-color: #eeeeee; text-align: center;">글 </th>
									<th style="background-color: #eeeeee; text-align: center;">ID</th>
									<th style="background-color: #eeeeee; text-align: center;">작성일</th>
									<th style="background-color: #eeeeee; text-align: center;">채팅하기 </th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>안녕하세요</td>
									<td>총스 </td>
									<td>2021-01-10</td>
									<td>
									<a href="chatting.jsp" class="w3-button w3-block w3-yellow w3-brown w3-margin-top w3-round">채팅</a>
									</td>
								</tr>
								
								<tr>
									<td>2</td>
									<td>어디신가요 ?</td>
									<td>길동이 </td>
									<td>2021-01-10 </td>
									<td>
									<a href="chatting.jsp" class="w3-button w3-block w3-yellow w3-brown w3-margin-top w3-round">채팅</a>
									</td>
								</tr>
							</tbody>
			
						</table>
        				</div>
				</div>
				<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src="js/bootstrap.js"></script>
			
			    </form>


    <%@include file="./modules/footer.jsp"%>
</body>
</html>