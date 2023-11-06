package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IReportService;
import service.ReportServiceImpl;
import vo.ReportVO;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 신고 처리 로직 구현
        String questionId = request.getParameter("questionId");
        String reportReason = request.getParameter("reportReason");
        
        // 신고 내용 저장 등의 로직을 수행
        IReportService reportService = ReportServiceImpl.getInstance();
        ReportVO reportVO = new ReportVO();
        
        reportService.doReport(reportVO);
        
        reportVO.setQueId(questionId);
        reportVO.setReportReason(reportReason);
        
        
        // 페이지 리다이렉트
        response.sendRedirect(request.getContextPath() + "/classDetail.jsp");
    }
}
