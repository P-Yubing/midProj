package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.INoticeService;
import service.IUserService;
import service.NoticeServiceImpl;
import service.UserServiceImpl;
import vo.NoticeVO;
import vo.UserVO;
@MultipartConfig
@WebServlet(value = "/write.html")
public class InsertNotice extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
		String userId = (String)req.getSession().getAttribute("loginCode");
		
		IUserService userService=UserServiceImpl.getInstance();
		
		UserVO uv = userService.getUser(userId);
		
		req.setAttribute("uv", uv);
		
		RequestDispatcher rd = req.getRequestDispatcher("notiwrite.jsp");
		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String notiContent = req.getParameter("notiContent");
		String userId = (String)req.getSession().getAttribute("loginCode");
		String notiId = req.getParameter("notiId");
		String notiTitle = req.getParameter("notiTitle");

		INoticeService noticeService = NoticeServiceImpl.getInstance();
		IUserService userService = UserServiceImpl.getInstance();

		NoticeVO noticevo = new NoticeVO();

//		noticevo = noticeService.noticeList(req);

//		UserVO uservo = new UserVO();
//		
//		uservo = userService.saveUser(req);
//        

		// 등록
		NoticeVO notice = new NoticeVO(notiId, notiTitle, notiContent, userId);

		// 아무것도 첨부하지 않은것
		if (noticevo != null) {
			notice.setNotiId(noticevo.getNotiId());
		}

		int cnt = noticeService.insertNotice(notice);

		String msg = "";

		if (cnt > 0) {
			// 성공
			msg = "성공";

		} else {
			// 실패
			msg = "실패";
		}

		HttpSession httpSession = req.getSession();

		httpSession.setAttribute("msg", msg);
		// 4. 목록 조회하면으로 이동
		resp.sendRedirect(req.getContextPath() + "/list.html");
	}
}
