package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ClassPicServiceImpl;
import service.IClassPicService;
import service.IOrdersService;
import service.IPaymentService;
import service.IUserService;
import service.OrdersServiceImpl;
import service.PaymentServiceImpl;
import service.UserServiceImpl;
import vo.ClassInfoVO;
import vo.ClassPicVO;
import vo.OrdersVO;
import vo.UserVO;




@WebServlet(value = "/PaymentSuccessView") 
public class PaymentSuccessView extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//1. 서비스 객체 생성하기
		IUserService userService = UserServiceImpl.getInstance();
		IOrdersService ordersService = OrdersServiceImpl.getInstance();
		IPaymentService paymentService = PaymentServiceImpl.getInstance();
		
		//2. 회원정보 목록 조회하기
		String userId = (String) request.getSession().getAttribute("userId");
		//String userId = "dbqls";
        UserVO getUser = userService.getUser(userId);
        
        String classId = request.getParameter("classId");
        //String classId = "6";
        ClassInfoVO getClass = userService.getClass(classId);
         
        String ordersId = request.getParameter("ordersId");
        //String ordersId = "111";
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setClassId(classId);
        ordersVO.setUserId(userId);
        ordersVO.setOrdersId(ordersId);
        
        
        OrdersVO getOrder = ordersService.getOrder(ordersVO);
		//3. jsp가 사용할 수 있도록 요청객체에 저장하기
        request.setAttribute("getUser", getUser);
        request.setAttribute("getClass", getClass);
		request.setAttribute("getOrder", getOrder);
		
		//4. jsp화면으로 포워딩 처리하기
		RequestDispatcher rd = request.getRequestDispatcher("paymentsuccess.jsp");
		rd.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
