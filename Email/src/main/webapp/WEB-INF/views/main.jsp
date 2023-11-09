<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>이메일 인증 구현하기</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function sendNumber() {
		$("#mail_number").css("display", "block");
		$.ajax({
			url : "/mail",
			type : "post",
			dataType : "json",
			data : {
				"mail" : $("#mail").val()
			},
			success : function(data) {
				alert("인증번호 발송");
				$("#Confirm").attr("value", data);
			}
		});
	}

	function confirmNumber() {
		var number1 = $("#number").val();
		var number2 = $("#Confirm").val();

		if (number1 == number2) {
			alert("인증되었습니다.");
		} else {
			alert("번호가 다릅니다.");
		}
	}
</script>
<body>
	<div id="mail_input" name="mail_input">
		<input type="text" name="mail" id="mail" placeholder="이메일 입력">
		<button type="button" id="sendBtn" name="sendBtn"
			onclick="sendNumber()">인증번호</button>
	</div>
	<br>
	<div id="mail_number" name="mail_number" style="display: none">
		<input type="text" name="number" id="number" placeholder="인증번호 입력">
		<button type="button" name="confirmBtn" id="confirmBtn"
			onclick="confirmNumber()">이메일 인증</button>
	</div>
	<br>
	<input type="text" id="Confirm" name="Confirm" style="display: none"
		value="">
</body>
</html>



