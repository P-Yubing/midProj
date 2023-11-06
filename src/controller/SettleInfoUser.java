package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ISettleInfoService;
import service.IUserService;
import service.SettleInfoServiceImpl;
import service.UserServiceImpl;
import vo.SettleVO;
import vo.UserVO;

@WebServlet("/SettleInfoUser")
public class SettleInfoUser extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = req.getParameter("msg");
		
		String userId = (String)req.getSession().getAttribute("loginCode");
		IUserService userService=UserServiceImpl.getInstance();
		UserVO uv = userService.getUser(userId);
		req.setAttribute("uv", uv);

		ISettleInfoService settleInfoService = SettleInfoServiceImpl.getInstance();
		
		List<SettleVO> settleList = settleInfoService.getsettleUserList(userId);
		System.out.println("settleList : " + settleList);
		
		req.setAttribute("settleList", settleList);
		req.setAttribute("msg", msg);

		RequestDispatcher rd= req.getRequestDispatcher("/settleInfoUser.jsp");
		rd.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
