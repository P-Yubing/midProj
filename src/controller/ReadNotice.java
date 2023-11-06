package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;

@WebServlet(value = "/read.html")

public class ReadNotice extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
    	String notiId = req.getParameter("notiId");
//    	String notiId = "a001";
    	
    	
    	INoticeService noticeService = NoticeServiceImpl.getInstance();
    			

        // 공지사항 ID를 기반으로 공지사항 정보 조회
        NoticeVO notice = noticeService.getNoticeById(notiId);

        // 조회된 공지사항 정보를 요청 객체에 저장
        req.setAttribute("notice", notice);

        // 상세 페이지로 포워딩 처리
       req.getRequestDispatcher("/notiread.jsp").forward(req, resp);
       
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	
    	req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }
}
