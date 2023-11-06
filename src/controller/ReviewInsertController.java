package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.IReviewService;
import service.IUserService;
import service.ReviewServiceImpl;
import service.UserServiceImpl;
import vo.ReviewVO;
import vo.UserIdReviewInfoVO;
import vo.UserVO;
import config.MyBatisUtil;

@MultipartConfig
@WebServlet("/reviewInsert.html")
public class ReviewInsertController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  
    	 req.setCharacterEncoding("UTF-8");
    	    
    	    String userId = (String) req.getSession().getAttribute("loginCode");
    	    String payId = req.getParameter("payId");
    	    System.out.println("ReviewInsertController->payId : " + payId);
    	    
    	    IReviewService reviewService = ReviewServiceImpl.getInstance();
    	    
    	    List<UserIdReviewInfoVO> srInfo = reviewService.getUIdReviewInfo(userId);
    	    
    	    IUserService userService = UserServiceImpl.getInstance();
    	    
    	    UserVO uv = userService.getUser(userId);
    	    
    	    req.setAttribute("srInfo", srInfo);
    	    req.setAttribute("payId", payId);
    	    req.setAttribute("uv", uv);

    	    // ReviewInsertController로 리다이렉트하면서 payId를 쿼리 파라미터로 전달
//    	    resp.sendRedirect(req.getContextPath() + "/reviewInsert.jsp");
    	    RequestDispatcher rd = req.getRequestDispatcher("reviewInsert.jsp");
    		rd.forward(req, resp);
    	}
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
//        String payId = "64";
	    String payId = req.getParameter("payId");
        String reviewContent = req.getParameter("reviewContent");
        String reviewStar = req.getParameter("reviewStar");
        //payId : null, reviewContent : 헐 대박, reviewStar : 
        System.out.println("payId : " + payId + ", reviewContent : " + reviewContent + ", reviewStar : " + reviewStar);
        ReviewVO rv = new ReviewVO(payId, reviewContent, reviewStar);
        
        IReviewService reviewService = ReviewServiceImpl.getInstance();
        
        int cnt = reviewService.getinsertReviewService(rv);
  
        String msg = "";
        
        if(cnt > 0) {
           msg = "성공";
           
        }else {
           msg = "실패";
        }

        HttpSession httpSession = req.getSession();
        httpSession.setAttribute("msg", msg);
        
        // 리뷰 목록 조회 페이지로 리다이렉트
//	    resp.sendRedirect(req.getContextPath() + "/reviewInsert.html?payId=" + payId);
	    resp.sendRedirect(req.getContextPath() + "UserIdReviewInfo");
    }
}