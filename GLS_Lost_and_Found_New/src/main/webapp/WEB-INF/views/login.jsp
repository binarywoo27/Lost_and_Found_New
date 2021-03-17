<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
img, label {
	display: inline-block;
}

label {
	width: 130px;
}

#Lost {
	color: orange;
}

#Found {
	color: skyblue;
}

button {
	background-color: white;
	color: #6D6F74;
	font-size: 13.5px;
	padding: 12px 29px;
	border: 0;
	outline: 0;
	box-shadow: 0 2.5px 3px 0 rgba(0, 0, 0, 0.2);
}

.g-signin2 {
	width: 100%;
}

.g-signin2>div {
	margin: 0 auto;
}
.google {
	text-align: center;
	position: relative;
	height: 300px;
	width: 400px;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	width: 400px;
	left: 0;
	right: 0;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<meta name="google-signin-client_id"
	content="60396027837-iev9qsg4ud3cb4plotgs65c6co5q9si9.apps.googleusercontent.com">
</head>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
<!-- <script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script> -->
<!-- <script>
function init(){
	console.log('init');
	gapi.load('auth2', function(){
		console.log('auth2');
		window.gauth = gapi.auth2.init({
			client_id: '60396027837-iev9qsg4ud3cb4plotgs65c6co5q9si9.apps.googleusercontent.com'
		})
	});
}
</script> -->

<body>
	<div
		style='width: 100%; text-align: center; padding-top: 100px; display: inline;'>
		<form method="post" action="loginOk" id="frm">
			<h1 id=headername style="font-size: 35px;">
				<span id="Lost" style="font-size: 35px;">Lost</span> & <span
					id="Found" style="font-size: 35px;">Found</span>
			</h1>
			<div>
				<label>User Id: </label><input type='text' name='userid' value='a'/>
			</div>
			<br>
			<div>
				<label>Password: </label><input type='password' name='password' value='a'/>
			</div>
			<br>
			<button type='submit'>회원 로그인</button>

		</form>

	</div>

	<br>

	<div class="google">
		<button type="button" onclick="location.href='google'">
			<i class="fa fa-google" aria-hidden="true"></i> 구글 로그인
		</button>
	</div>

</body>

</html>