package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ClassInfoServiceImpl;
import service.ClassPicServiceImpl;
import service.IClassInfoService;
import service.IClassPicService;
import vo.ClassInfoVO;
import vo.ClassPicVO;

@WebServlet("/viewClass")
public class AllClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IClassInfoService classInfoService = new ClassInfoServiceImpl();
		IClassPicService classPicService = new ClassPicServiceImpl();
		
		List<ClassInfoVO> classInfo = classInfoService.getClassInfo();
		
		List<ClassInfoVO> filteredClass = new ArrayList<>();
		
		for(ClassInfoVO Info : classInfo) {
			String classId = Info.getClassId();
	    	ClassPicVO pic = classPicService.getClassPic(classId);
	    	if (pic != null) {
	    		Info.setClassPicId(pic.getClassPicId());
	    		System.out.println(filteredClass);
	    	} else {
	    		 System.out.println("사진을 찾을 수 없습니다.");
	    	}
		}
		// JSP페이지로 데이터 전달
		request.setAttribute("filteredClass", filteredClass);
		// JSP 페이지로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/include/mainClass.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
