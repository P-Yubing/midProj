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
import service.IOrdersService;
import service.IPaymentService;
import service.OrdersServiceImpl;
import service.PaymentServiceImpl;
import service.UserServiceImpl;
import vo.ClassInfoVO;
import vo.OrdersVO;
import vo.PaymentVO;
import vo.UserVO;

@WebServlet("/PaymentSuccess")
public class PaymentSuccess extends HttpServlet {
   
   private static final long serialVersionUID = 1L;
   
   public PaymentSuccess() {
      super();
   }
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      RequestDispatcher rd = request.getRequestDispatcher("/paymentsuccess.jsp");
      rd.forward(request, response);
   
   }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      request.setCharacterEncoding("UTF-8");
      
      String classId = request.getParameter("classId");
      String ordersId = request.getParameter("ordersId");
      System.out.println("classId: " + classId);
      System.out.println("ordersId: " + ordersId);
      String payDate = request.getParameter("payDate");
      String payAmount = request.getParameter("payAmount");
//      int payAmount = Integer.parseInt(request.getParameter("payAmount"));
      String payName = request.getParameter("payName");
      String opt = request.getParameter("opt");
      
      //(String)request.getSession().getAttribute("userId");
      
      IOrdersService ordersService = OrdersServiceImpl.getInstance();
      IPaymentService paymentService = PaymentServiceImpl.getInstance();
      IUserService userService = UserServiceImpl.getInstance();
      
      //todo1. request.getAttribute("getClass");하기 위해 메소드 연결하고 데이터 가져오기 필요
      
      
      PaymentVO paymentVO = new PaymentVO (payDate, payAmount, payName);
      paymentVO.setOrdersId(ordersId);
      paymentVO.setClassId(classId);
      int cnt = paymentService.paymentInfo(paymentVO);
      
     
      HttpSession httpSession = request.getSession();
      //httpSession.setAttribute("msg", msg);
      httpSession.setAttribute("classId", classId);
      httpSession.setAttribute("ordersId", ordersId);
      httpSession.setAttribute("payDate", payDate);
      httpSession.setAttribute("payAmount", payAmount);
      httpSession.setAttribute("payName", payName);
      
      request.getSession().setAttribute("loginCode", "dbqls"); // 임시로 로그인 처리...(테스트)
      
      if(opt.equals("1")) {
    	  // 경제 내역 페이지
    	  response.sendRedirect(request.getContextPath() +  "/UserIdOrderClassInfo");
      }else if(opt.equals("2")) {
    	  // main
    	  response.sendRedirect(request.getContextPath() +  "/index.jsp");
      }
      
      
      
      
   }
   
   
   
   
   
   
   

}
