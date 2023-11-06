package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ClassInfoViewServiceImpl;
import service.ClassPicServiceImpl;
import service.IClassInfoViewService;
import service.IClassPicService;
import service.IQuestionService;
import service.IReportService;
import service.IReviewService;
import service.IUserService;
import service.QuestionServiceImpl;
import service.ReportServiceImpl;
import service.ReviewServiceImpl;
import service.UserServiceImpl;
import vo.ClassInfoVO;
import vo.ClassPicVO;
import vo.QuestionVO;
import vo.ReviewVO;
import vo.UserVO;

@WebServlet("/ClassDetailInfo")
public class ClassDetailInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClassDetailInfo() {
        super();
    }

    //클래스 상세 페이지의 전체를 담당하는 컨트롤러
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = (String) request.getSession().getAttribute("loginCode");
//		String classId = "6";
//		String userId = "dbqls";
		String classId = request.getParameter("classId");

//		String classId = request.getParameter("classId");
		
		IClassInfoViewService classInfoService = ClassInfoViewServiceImpl.getInstance();
		IClassPicService classPicService = ClassPicServiceImpl.getInstance();
		IQuestionService queService = QuestionServiceImpl.getInstance();
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		IUserService userService = UserServiceImpl.getInstance();
		IReportService reportService = ReportServiceImpl.getInstance();
		
		ClassInfoVO classInfoVO = classInfoService.getClassInfoById(classId);
		ClassPicVO classPicVO = classPicService.getClassPic(classId);
		List<QuestionVO> queList = queService.queListByClassId(classId);
		List<ReviewVO> reviewList = reviewService.getReviewByClassId(classId);
		UserVO userVO = userService.getUser(userId);
		
		
		request.setAttribute("classInfoVO", classInfoVO);
		request.setAttribute("classPicVO", classPicVO);
		request.setAttribute("queList", queList);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("userVO", userVO);
		
		request.getRequestDispatcher("/classDetail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
