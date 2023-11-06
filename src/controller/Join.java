package controller;

import java.io.IOException;

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

@WebServlet("/Join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Join() {
        super();
    }
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userNName = request.getParameter("userNName");
		String userTel = request.getParameter("userTel");
		String userEmail = request.getParameter("userEmail");
		String userBirth = request.getParameter("userBirth");
		String userType = request.getParameter("userType");
		
		IUserService userService = UserServiceImpl.getInstance();
		
		UserVO userVO 
			= new UserVO(userId, userPw, userName, userNName, userTel, userEmail, userBirth, userType);
	
		int cnt = userService.joinUser(userVO);
		
		String msg = "";
		if(cnt > 0) {
			// 성공
			msg = "성공";
		}else {
			// 실패
			msg = "실패";
		}
		
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "login.jsp");
		
		
	}

}
