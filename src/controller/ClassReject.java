package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ClassServiceImpl;
import service.IClassService;

@WebServlet("/ClassReject")
public class ClassReject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		request.setCharacterEncoding("UTF-8");
		
		String classId = request.getParameter("classId");
	     String reason = request.getParameter("reason");

	     Map<String, Object> rejectMap = new HashMap<>();
	     
	     rejectMap.put("classId", classId);
	     rejectMap.put("rejectReason", reason);
	     
	     IClassService classService = ClassServiceImpl.getInstance();
	     classService.classReject(rejectMap);

	     response.setStatus(HttpServletResponse.SC_OK);
	}

}
