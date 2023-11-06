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
import service.SettleInfoServiceImpl;
import vo.SettleVO;

@WebServlet("/SettleInfo")
public class SettleInfo extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = req.getParameter("mag");

		ISettleInfoService settleInfoService = SettleInfoServiceImpl.getInstance();
		
		List<SettleVO> settleList = settleInfoService.getsettleList();
		
		req.setAttribute("settleList", settleList);
		req.setAttribute("msg", msg);

		RequestDispatcher rd= req.getRequestDispatcher("/settleInfo.jsp");
		rd.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
