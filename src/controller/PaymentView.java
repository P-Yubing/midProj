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

import service.ClassInfoServiceImpl;
import service.ClassPicServiceImpl;
import service.IClassInfoService;
import service.IClassPicService;
import service.IUserService;
import service.UserServiceImpl;
import vo.ClassInfoVO;
import vo.ClassPicVO;
import vo.OrdersVO;
import vo.SettleVO;
import vo.UserVO;




@WebServlet(value = "/paymentBeforeInfo") ///member/list.do
public class PaymentView extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 서비스 객체 생성하기
		IUserService userService = UserServiceImpl.getInstance();
		IClassPicService picService = ClassPicServiceImpl.getInstance();
	
		
		//2. 회원정보 목록 조회하기
		String userId = (String) request.getSession().getAttribute("loginCode");
		UserVO uv = userService.getUser(userId);
		request.setAttribute("uv", uv);
		String classId = request.getParameter("classId");
		System.out.println("PaymentView->classId : " + classId);

		//String classId = request.getParameter("classId");
		ClassInfoVO getClass = userService.getClass(classId);

		System.out.println("getClass : " + getClass);

        //classId = "6";
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setClassId(classId);
        ordersVO.setUserId(userId);
        
        //OrdersVO getOrder = userService.getOrder(ordersVO);
        
        //classId = "6";
        ClassPicVO getClassPic = picService.getClassPic(classId);
        
		//3. jsp가 사용할 수 있도록 요청객체에 저장하기
        //request.setAttribute("getUser", getUser);
        request.setAttribute("getClass", getClass);
		request.setAttribute("classId", classId);
        request.setAttribute("getClassPic", getClassPic);
		
		//4. jsp화면으로 포워딩 처리하기
		RequestDispatcher rd = request.getRequestDispatcher("/payment.jsp"); ///views/member/list.jsp
		rd.forward(request, response);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
