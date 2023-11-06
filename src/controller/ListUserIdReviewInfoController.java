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

import dao.IReviewDao;
import service.IReviewService;
import service.IUserOrderClassInfoService;
import service.IUserService;
import service.ReviewServiceImpl;
import service.UserOrderClassInfoService;
import service.UserServiceImpl;
import vo.UserClassInfoVO;
import vo.UserIdReviewInfoVO;
import vo.UserVO;

@WebServlet("/UserIdReviewInfo")
public class ListUserIdReviewInfoController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String userId = (String)req.getSession().getAttribute("loginCode");
		
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		
		List<UserIdReviewInfoVO> srInfo = reviewService.getUIdReviewInfo(userId);
		
		IUserService userService=UserServiceImpl.getInstance();
		
		UserVO uv = userService.getUser(userId);
		
		req.setAttribute("srInfo", srInfo);
		req.setAttribute("uv", uv);

		String payId = (String) req.getSession().getAttribute("payId");
//		String payId = "111";
		req.setAttribute("payId", payId);
		
	    // ReviewInsertController로 리다이렉트하면서 payId를 쿼리 파라미터로 전달
		RequestDispatcher rd = req.getRequestDispatcher("/selectUserIdReviewInfo.jsp");
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
	    
	    IReviewService reviewService = ReviewServiceImpl.getInstance();
	    
	    List<UserIdReviewInfoVO> srInfo = reviewService.getUIdReviewInfo(userId);
	    
		HttpSession session = req.getSession();

        // 업데이트 작업 이후에 userMypage.jsp로 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/selectUserIdReviewInfo.jsp");
		
	}
}
