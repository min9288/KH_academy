package api.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	public String mailSend(String email) {
		boolean result = false;
		Random r = new Random();
		
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i<6;i++) {
			// 숫자/대문자/소문자 랜덤배치를 위한 랜덤수
			int flag = r.nextInt(3);
			if(flag == 0) {
				// 숫자
				int randomNum = r.nextInt(10);
				sb.append(randomNum);
			}else if(flag == 1) {
				char randomChar = (char)(r.nextInt(26)+65);
				sb.append(randomChar);
			}else if(flag == 2) {
				char randomChar = (char)(r.nextInt(26)+97);
				sb.append(randomChar);
			}
		}
		
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", true);
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		// prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				PasswordAuthentication pa = new PasswordAuthentication("khtest9288@gmail.com", "minw_9288");
				return pa;
			}
		});
		MimeMessage msg = new MimeMessage(session);
		
		try {
			//메일 전송날짜 설정
			msg.setSentDate(new Date());
			//보내는사람 정보
			msg.setFrom(new InternetAddress("khtest9288@gmail.com","스테이위드 인증메일"));
			//받는사람정보
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			//이메일 제목설정
			msg.setSubject("인증메일","UTF-8");
			//이메일 내용설정
			msg.setContent("<h3>인증번호는[<span style='color:red;'>"+sb.toString()+"</span>]입니다.</h3>","text/html;charset=UTF-8");
			//이메일 전송
			Transport.send(msg);
			result = true;
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if(result) {
			return sb.toString();
		} else {
			return null;
		}
	}
}
