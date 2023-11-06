package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.INoticeService;
import service.NoticeServiceImpl;

@WebServlet("/delete.html")
public class DeleteNotice extends HttpServlet{
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String notiId = req.getParameter("notiId");
//		String notiId = "99";
	
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		int cnt = noticeService.deleteNotice(notiId);
		
		
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
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}