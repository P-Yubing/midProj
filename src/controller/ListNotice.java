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

import dao.INoticeDao;
import dao.NoticeDaoImpl;
import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;

@WebServlet(value = "/list.html")

public class ListNotice extends HttpServlet {

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
		
		String msg = req.getParameter("msg");


        // 1. 서비스 객체 생성하기
        INoticeService noticeService = NoticeServiceImpl.getInstance();

        // 2. 공지사항 목록 조회하기
        List<NoticeVO> noticeList = noticeService.noticeList();

        // 3. JSP가 사용할 수 있도록 요청 객체에 저장하기
        req.setAttribute("noticeList", noticeList);
        
    	req.setAttribute("msg", msg);

        // 4. JSP 화면으로 포워딩 처리하기
        RequestDispatcher rd = req.getRequestDispatcher("/notilist.jsp");
        rd.forward(req, resp);
//        System.out.println(noticeList);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	    resp.setCharacterEncoding("UTF-8");
    	    req.setCharacterEncoding("UTF-8");
    	    
    	    
    	    resp.sendRedirect(req.getContextPath() + "/list.jsp");
        doGet(req, resp);
    }
}
