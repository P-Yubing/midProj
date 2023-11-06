package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IUserService;
import service.UserServiceImpl;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@WebServlet("/FindPw")
public class FindPw extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId").trim();
		String userTel = request.getParameter("userTel").trim();
		String userEmail = request.getParameter("userEmail").trim();
	
		Map<String, Object> findPwMap = new HashMap<>();
		
		findPwMap.put("userId", userId);
		findPwMap.put("userTel", userTel);
		
		IUserService userService = UserServiceImpl.getInstance();
		String findPw = userService.findPw(findPwMap);
//		findPw.substring(0, 2) + findPw.replace(findPw.substring(3, findPw.length()), "*");
		String findPw1 = findPw.substring(3, findPw.length());
//    	System.out.println(findPw1);
    	
    	Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("Today.Do.Day3@gmail.com", "xdtfqcbawyhnjowd"); // 보내는 사람 주소
            }
        });

        String title = "비밀번호 찾기 결과입니다."; // 제목
        String content="";
        if(findPw == null) {
        	
        	content = "일치하는 조회 결과가 없어 비밀번호 찾기에 실패하였습니다.";
        }else {
        	
        	content = "<h3>안녕하세요. Today? Do day!입니다.</h3><p>비밀번호 찾기 결과를 알려드립니다. <br> 비밀번호는 " + findPw.substring(0, 3) + findPw1.replaceAll("." ,"*") + "입니다. <br> 정보가 제대로 조회되지 않았거나 문제가 있으시면 사이트 오른쪽 하단의 챗봇으로 관리자에게 문의해주세요.<br>감사합니다.</p>"; // 내용
        }
        Message message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress("Today.Do.Day3@gmail.com", "Today? Do Day!", "utf-8")); // 보내는 메일주소, 보내는 사람 이름
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject(title);
            message.setContent(content, "text/html; charset=utf-8");

            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("/pwResult.jsp");
		rd.forward(request, response);
    }
}
