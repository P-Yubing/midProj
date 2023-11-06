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

@WebServlet("/RecentClass")
public class RecentClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IClassInfoService classInfoService;
	private IClassPicService classPicService;
	
	@Override
	  public void init() throws ServletException {
	    super.init();
	  // 필요한 서비스나 의존성 주입 등의 초기화 작업 수행
	  classInfoService = new ClassInfoServiceImpl();
	  classPicService = new ClassPicServiceImpl();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<ClassInfoVO> recentClass = classInfoService.getRecentClass();
		
		List<ClassInfoVO> filteredRecentClass = new ArrayList<>();
		
		for (ClassInfoVO classInfo : recentClass) {
			String classId = classInfo.getClassId();
			ClassPicVO picVO = classPicService.getClassPic(classId);
			
			classInfo.setPicVO(picVO);
			
			if (picVO != null && classId.equals(picVO.getClassId())) {
				filteredRecentClass.add(classInfo);
		      }
			request.setAttribute("filteredRecentClass", filteredRecentClass);
		}
		//JSP페이지로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/classList-Recent.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
