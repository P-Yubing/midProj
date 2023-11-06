package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ClassServiceImpl;
import service.IClassService;
import vo.ClassVO;

@WebServlet("/ClassConfirm")
public class ClassConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClassConfirm() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IClassService classService = ClassServiceImpl.getInstance();
		
		List<ClassVO> classConfirmList = classService.classConfirmList();
		
		request.setAttribute("classConfirmList", classConfirmList);
		
		RequestDispatcher rd = request.getRequestDispatcher("classConfirmList.jsp");
		rd.forward(request, response);
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classId = request.getParameter("classId");

        // classConfirm 메서드를 호출하여 승인 상태를 업데이트하는 코드 추가
        IClassService classService = ClassServiceImpl.getInstance();
        classService.classConfirm(classId);

        response.setStatus(HttpServletResponse.SC_OK);
	
	
	
	
	
	}

}
