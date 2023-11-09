# GmailCode
지메일 인증코드 완성

##Gmail 인증코드

1. main -> 이메일 인증 구현 html

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

2. MainController 

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MailController {

    private final MailService mailService;

    @GetMapping("/")
    public String MailPage(){
        return "main";
    }

    @ResponseBody
    @PostMapping("/mail")
    public String MailSend(String mail){

       int number = mailService.sendMail(mail);

       String num = "" + number;

       return num;
    }
}


3. MailService

@Service
@RequiredArgsConstructor
public class MailService {

    private final JavaMailSender javaMailSender;
    private static final String senderEmail= "gohwangbong@gmail.com";
    private static int number;

    public static void createNumber(){
       number = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
    }

    public MimeMessage CreateMail(String mail){
        createNumber();
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);
            message.setRecipients(MimeMessage.RecipientType.TO, mail);
            message.setSubject("이메일 인증");
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }

    public int sendMail(String mail){

        MimeMessage message = CreateMail(mail);

        javaMailSender.send(message);

        return number;
    }
}

%% 사용 시 아이디, 앱 비밀번호 기입 필수 %%
