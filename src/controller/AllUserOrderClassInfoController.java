package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IUserOrderClassInfoService;
import service.IUserService;
import service.UserOrderClassInfoService;
import service.UserServiceImpl;
import vo.UserOrderClassInfoVO;
import vo.UserVO;

@WebServlet("/AllUserOrderClassInfo")
public class AllUserOrderClassInfoController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String msg = req.getParameter("mag");
		
		IUserOrderClassInfoService userOrderClassInfoService = UserOrderClassInfoService.getInstance();
		
		List<UserOrderClassInfoVO> userOderClassList = userOrderClassInfoService.getAllUOCInfoList();
		
		req.setAttribute("userOderClassList", userOderClassList);
		req.setAttribute("msg", msg);
		
		RequestDispatcher rd = req.getRequestDispatcher("/selectAllClassOrderInfo.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
}
