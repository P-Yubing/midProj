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
import service.UserOrderClassInfoService;
import vo.UserClassInfoVO;

@WebServlet("/AllUserClassInfo")
public class AllListUserClassInfoController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	req.setCharacterEncoding("UTF-8");
	
	IUserOrderClassInfoService userClassInfoService = UserOrderClassInfoService.getInstance();
	
	List<UserClassInfoVO> userClassList = userClassInfoService.getAllUCInfoList();
	
	req.setAttribute("userClassList", userClassList);

	RequestDispatcher rd= req.getRequestDispatcher("/selectAllUserClassInfo.jsp");
	rd.forward(req, resp);
	
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
}
