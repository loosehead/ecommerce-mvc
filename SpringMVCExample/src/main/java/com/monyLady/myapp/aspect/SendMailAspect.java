package com.monyLady.myapp.aspect;

import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.monyLady.myapp.model.Users;

@Aspect
public class SendMailAspect {

	@Autowired
	private JavaMailSender mailSender;
//	@Autowired
//	private VelocityEngine velocityEngine;
	@Autowired
	private SimpleMailMessage templateMessage;
	@Autowired
	private SpringTemplateEngine templateEngine;
	@Autowired
	private Users user;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

//	public void setVelocityEngine(VelocityEngine velocityEngine) {
//		this.velocityEngine = velocityEngine;
//	}

	public void setTemplateMessage(SimpleMailMessage templateMessage) {
		this.templateMessage = templateMessage;
	}

	//@Around("mailInvocationPointcut()")
	@Around("execution(* com.monyLady.myapp.metier.UsersManagerImpl.saveUser(..))")
	public void sendMail(Mail mail) throws MessagingException {

		final Context ctx = new Context();
		// ctx.setVariable("name", recipientName);
		ctx.setVariable("subscriptionDate", new Date());
		// ctx.setVariable("hobbies", Arrays.asList("Cinema", "Sports",
		// "Music"));
		// ctx.setVariable("imageResourceName", imageResourceName);
		// MimeMessageHelper messageHelper = new
		// MimeMessageHelper(mailSender.createMimeMessage());
		final MimeMessage mimeMessage = mailSender.createMimeMessage();
		final MimeMessageHelper message = new MimeMessageHelper(mimeMessage);

		message.setFrom("hayatt.bechir@gmail.com");
		message.setTo("aboubecrine@gmail.com");
		message.setSubject("Mail de bienvennue");
		message.setText("This is the message body");

		// Create the HTML body using Thymeleaf
//		final String htmlContent = this.templateEngine.process(
//				"emailtemplate.html", ctx);
//		message.setText(htmlContent, true); // true = isHtml

//		 final InputStreamSource imageSource = new
//		 ByteArrayResource(imageBytes);
//		 message.addInline(imageResourceName, imageSource, imageContentType);

		// Send mail
		this.mailSender.send(mimeMessage);

		
	}
	
	
	@Pointcut ("execution(* com.monyLady.myapp.metier.UsersManagerImpl.saveUser(..))")
	public void mailInvocationPointcut() {
	}

}
