package controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	public static void main(String[] args) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("Today.Do.Day3@gmail.com", "xdtfqcbawyhnjowd"); //보내는 사람 주소
			}
		});

		String receiver = "p_yb24@naver.com"; // 메일 받을 주소
		String title = "비밀번호 찾기 결과입니다."; //제목
		String content = "<h2>안녕하세요</h2>"; //내용
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("Today.Do.Day3@gmail.com", "Today? Do Day!", "utf-8")); //보내는 메일주소, 보내는 사람 이름
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html; charset=utf-8");

			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
