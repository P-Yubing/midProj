package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IUserOrderClassInfoService;
import service.IUserService;
import service.UserOrderClassInfoService;
import service.UserServiceImpl;
import vo.UserClassInfoVO;
import vo.UserVO;

@WebServlet("/UserIdClassInfo")
public class ListUserIdClassInfoController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String userId = (String)req.getSession().getAttribute("loginCode");
		
		IUserOrderClassInfoService userOrderClassInfoService = UserOrderClassInfoService.getInstance();
		
		List<UserClassInfoVO> userClassList = userOrderClassInfoService.getUIdCInfoList(userId);
		
		IUserService userService=UserServiceImpl.getInstance();
		
		UserVO uv = userService.getUser(userId);
		List<UserClassInfoVO> uocv = userOrderClassInfoService.getUIdCInfoList(userId);
		
		req.setAttribute("uocv", uocv);
		req.setAttribute("uv", uv);

		
		RequestDispatcher rd = req.getRequestDispatcher("/selectUserIdClassInfo.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

        // 폼에서 전달된 회원 정보 가져오기
		String userId = (String)req.getSession().getAttribute("loginCode");
		
		System.out.println("UserIdClassInfo 실행여부");
       
	    // 가져온 회원 정보를 UserVO 객체에 저장
	    UserClassInfoVO uservo = new UserClassInfoVO(userId);
	    
		IUserOrderClassInfoService userClassInfoService = UserOrderClassInfoService.getInstance();

		List<UserClassInfoVO> cnt = userClassInfoService.getUIdCInfoList(userId);

		HttpSession session = req.getSession();

        // 업데이트 작업 이후에 userMypage.jsp로 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/selectUserIdClassInfo.jsp");
		
	}
}
