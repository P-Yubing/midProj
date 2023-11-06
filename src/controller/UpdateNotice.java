package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;
@MultipartConfig

@WebServlet("/update.html")
public class UpdateNotice extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


	String notiId = req.getParameter("notiId");
//	String notiId = "183";
	
	//1.서비스 생성
	INoticeService noticeService = NoticeServiceImpl.getInstance();
	
	
	
	//2.공지사항 생성
	NoticeVO notice = noticeService.getNoticeById(notiId);
	
	
	//3.요청객체에 데이터 저장 
	req.setAttribute("notice", notice);
	
	req.getRequestDispatcher("/notiupdate.jsp").forward(req, resp);
	
	
    
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String notiId = req.getParameter("notiId");
		String notiTitle = req.getParameter("notiTitle");
		String notiContent = req.getParameter("notiContent");
		String notiDate = req.getParameter("notiDate");
//		String userId = req.getParameter("userId");
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		
		NoticeVO noticeVO = null;
		
		
		NoticeVO notice = new NoticeVO(notiId, notiTitle, notiContent, notiDate);
		
		int cnt = noticeService.updateNotice(notice);
		
		String msg = "";
		
		if(cnt > 0) {
			//성공
			msg = "성공";
			
		}else {
			//실패
			msg = "실패";
		}


		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		
		resp.sendRedirect(req.getContextPath() + "/list.html");
		
	
	}
	
	
	
	
	
}
