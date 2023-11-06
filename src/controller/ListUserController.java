package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IUserService;
import service.UserServiceImpl;
import vo.UserVO;

@WebServlet("/UserList")
public class ListUserController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String msg = req.getParameter("mag");
		
		IUserService userService = UserServiceImpl.getInstance();
		
		List<UserVO> userList = userService.getUserList();
		
		req.setAttribute("userList", userList);
		req.setAttribute("msg", msg);
		
		RequestDispatcher rd = req.getRequestDispatcher("/selectUserInfo.jsp");
		rd.forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
}
