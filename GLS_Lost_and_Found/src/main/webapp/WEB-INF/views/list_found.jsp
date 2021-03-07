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
</script>


<style>
#editButton {
	width: 80px;
	margin: auto;
	color: white;
	border: 1px #81BEF7;
	background: white;
	padding: 5px 5px;
	text-align: center;
	font-weight: bold;
	display: inline-block;
}

.panel-primary>.panel-heading {
	background-color: darkslategray;
	border-color: white;
}

.panel-primary {
	border-color: black;
}

#deleteButton {
	width: 80px;
	margin: auto;
	border: 1px #E2A9F3;
	background: lightgrey;
	padding: 5px 5px;
	text-align: center;
	font-weight: bold;
	display: inline-block;
}

#buttonArea {
	text-align: center;
	padding: 10px;
}

div.card {
	width: 95%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: left;
	margin: 14px;
	position: relative;
	float: left;
}

div.header {
	background-color: #4CAF50;
	color: white;
	padding: 10px;
	font-size: 40px;
}

div.description {
	padding: 10px;
}

#desc1 {
	font-size: 20px;
	text-align: left;
	font-weight: 700;
	padding-left: 5%;
}

@media only screen and (min-width: 520px) {
	div.card {
		width: 44%;
	}
}

@media only screen and (min-width: 768px) {
	div.card {
		width: 29%;
	}
}

@media only screen and (min-width: 1024px) {
	div.card {
		width: 22%;
	}
}
</style>

</head>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
<script>
  //auth2 is initialized with gapi.auth2.init() and a user is signed in.
  function checkLoginStatus() {
    var loginBtn = document.querySelector('#loginBtn');
    var nameTxt = document.querySelector('#name');

    if (gauth.isSignedIn.get()) {
      console.log('logged in');
      loginBtn.value = "Logout";
      var profile = gauth.currentUser.get().getBasicProfile();
      nameTxt.innerHTML = 'Welcome <strong>' + profile.getName() + '</strong>';
    } else {
      console.log('logged out');
      loginBtn.value = 'Login';
      nameTxt.innerHTML = '';
    }
  }

  function init() {
    console.log('init');
    gapi
        .load(
            'auth2',
            function() {
              console.log('auth2');
              window.gauth = gapi.auth2
                  .init({
                    client_id : '60396027837-iev9qsg4ud3cb4plotgs65c6co5q9si9.apps.googleusercontent.com'
                  });

              gauth.then(function() {
                console.log("googleAuth success");
                checkLoginStatus();

                if (gauth.isSignedIn.get()) {
                  var profile = gauth.currentUser.get().getBasicProfile();
                  console.log('ID: ' + profile.getId());
                  console.log('Full Name: ' + profile.getName());
                  console.log('Given Name: ' + profile.getGivenName());
                  console.log('Family Name: ' + profile.getFamilyName());
                  console.log('Image URL: ' + profile.getImageUrl());
                  console.log('Email: ' + profile.getEmail());
                }
              }, function() {
                console.log("googleAuth fail");

              });
            });
    /* document.addEventListener("DOMContentLoaded", function(event) { 
      	document.getElementById("loginBtn").value = "Logout";
    }); */
    document.getElementById("loginBtn").value = "Logout";
  }
  /* function changeBtnValue(){
   document.getElementById("loginBtn").value = "Logout";
   } */
</script>

<body onload="changeBtnValue()">
	<input type="button" id="loginBtn" value="checking..."
		onclick="
	if(this.value === 'Login'){
		gauth.signIn().then(function(){
			console.log('signed in');
			checkLoginStatus();
		});
	} else {
		gauth.signOut().then(function(){
			console.log('signed out');
			checkLoginStatus();
			location.href = '../login/login';
		});
	}
	
">

	<span id="name"> </span>
	<%
		//out.write("<h1> hi there </h1>");
	if (session.getAttribute("userid") == null) {
		out.write("<location.href ='../login/login'>");
		/* out.write("<h1> hi there </h1>"); */
	} else {
		String userid = (String) session.getAttribute("userid");
		out.write("<span> welcome" + "<strong> " + userid + "</strong> </span>");
	}
	%>
	<%@include file="./modules/header.jsp"%>
	<%@include file="./modules/navbar.jsp"%>
	


	<table id="list" width="90%">
		<c:forEach items="${list}" var="u">
			<c:if test="${u.lost}">
				<!-- u.lost가 1인 경우 == found인 경우 -->
				<div class="card">
					<div class="seq">${u.seq}</div>
					<div class="image">
						<img src=${u.photourl
									}
							style="box-sizing: border-box; width: 100%; height: 230px" />
					</div>
					<div class="description">

						<span style="background-color:#CBECBB; padding:1.5px 3px; border-radius: 3px;">Found</span>

						<span class="title">${u.title}</span>

						<div class="name">상품명 : ${u.category}</div>

						<div class="price">가격 : ${u.writer}</div>

						<div class="other" style="box-sizing: border-box; height: 80px;">비고
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
			</c:if>


		</c:forEach>
	</table>




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
	<br>

	<%@include file="./modules/footer.jsp"%>

</body>
</html>