package org.ani.mail;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

	private MailSender mailSender;
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	//mailSending 
	@RequestMapping(value="/mailSending.do", produces="text/plain;charset=utf-8")
	public void mailSending(String email) {
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		
		mailMessage.setFrom("animamundi-ceo@daum.net");
		mailMessage.setTo(email);
		mailMessage.setSubject("[AnimaMundi]가입을 환영합니다.");
		mailMessage.setText("AnimaMundi 가입을 환영합니다. 고객님 좋은 인연 만들어가시기 바랍니다! ^^*");
		try {
			mailSender.send(mailMessage);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}
