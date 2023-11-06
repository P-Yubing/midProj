package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IOrdersService;
import service.IPaymentService;
import service.OrdersServiceImpl;
import service.PaymentServiceImpl;
import vo.OrdersVO;


//insert: 클레스정보를 조회하고 수량 넣은 후 Orders에 정보를 넣기

@WebServlet("/PaymentAmount")
public class PaymentAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public PaymentAmount() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/payment.jsp");
		rd.forward(request, response);
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String classId = request.getParameter("classId");
		String ordersQty = request.getParameter("ordersQty");
		String ordersDate = request.getParameter("ordersDate");
		String ordersAmountStr = request.getParameter("ordersAmount");
		int ordersAmount = Integer.parseInt(ordersAmountStr);
		
		//String userId = "dbqls" ;
		String userId = (String) request.getSession().getAttribute("loginCode");
		request.getSession().getAttribute("userId");
		
		IOrdersService ordersService = OrdersServiceImpl.getInstance();
		
		OrdersVO ordersVO = new OrdersVO (ordersQty);
		ordersVO.setClassId(classId);
		ordersVO.setUserId(userId);
		ordersVO.setOrdersDate(ordersDate);
		ordersVO.setOrdersAmount(ordersAmount);
		
		int cnt = ordersService.paymentAmount(ordersVO);
		
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
		
		response.sendRedirect(request.getContextPath() + "paymentselect.jsp?ordersId=" + ordersVO.getOrdersId() + "&classId=" + classId);
		
	}
	
	

}
