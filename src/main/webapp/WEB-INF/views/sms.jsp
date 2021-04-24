<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>문자 인증</title>
</head>
<body>
	<input type="text" name="phoneNumber" id="phoneNumber" placeholder="받는 사람 번호" />
	<button id="sendPhoneNumber">전송</button>
	<br />
	<br />
	<input type="text" name="sms" id="sms" placeholder="인증 번호 입력" />
	<button id="checkBtn">인증</button>
	<script> 
	$("#sendPhoneNumber").click(function(){
		
		let phoneNumber = $("#phoneNumber").val();
		alert("인증번호 전송 완료!");
		
		$.ajax({ 
			url: "<%=request.getContextPath()%>/sendSms", 
			data: { phoneNumber: phoneNumber }, 
			type: "get", 
			dataType : "json",
			success: function(result) { // numStr로 받음

				$("#checkBtn").click(function(){
					if($.trim(result.numStr) == $("#sms").val()){
						alert("인증성공!, 휴대폰 인증이 정상적으로 완료되었습니다.");
					} else {
						alert("인증번호가 올바르지 않습니다.");
					}
				});
			} 
		}); 
	});  
	
	</script>
</body>
</html>

