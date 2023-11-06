package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IUserService;
import service.UserServiceImpl;
import vo.UserVO;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RequestDispatcher disp = request.getRequestDispatcher("login.jsp");
//		disp.forward(request, response);
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uId = request.getParameter("userId");
		String uPw = request.getParameter("userPw");
	
//		System.out.println("넘어온 유저정보 >> " + uId + "/" + uPw);
	
		Map<String, Object> loginMap = new HashMap<String, Object>();
		loginMap.put("uId", uId);
		loginMap.put("uPw", uPw);
				
		IUserService userService = UserServiceImpl.getInstance();
		UserVO userVO = userService.loginChk(loginMap);
//		System.out.println("userVO : " + userVO);
		
		if (userVO != null && userVO.getUserId() != null) {
		    String userType = userVO.getUserType();
//		    console.log("userType : " + userType);

		    if (!"E".equals(userType)) {
		        HttpSession session = request.getSession();
		        session.setAttribute("loginCode", userVO.getUserId());
		        session.setAttribute("userVO", userVO);
		        request.getRequestDispatcher("/").forward(request, response);
		    } else {
		        // 유저 타입이 "E"인 경우 로그인을 막음
		        response.sendRedirect("login.jsp?error=E");
		    }
		} else {
		    response.sendRedirect("login.jsp?error=invalid");
		}
		
	}

}
