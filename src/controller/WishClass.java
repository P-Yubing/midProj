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

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.ClassInfoDaoImpl;
import service.ClassInfoServiceImpl;
import service.ClassPicServiceImpl;
import service.IClassInfoService;
import service.IClassPicService;
import vo.ClassInfoVO;
import vo.ClassPicVO;

@WebServlet("/WishClass")
public class WishClass extends HttpServlet {

	
		
  public WishClass() {
	  super();
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  request.setCharacterEncoding("UTF-8");
	  
	  IClassInfoService classInfoService = ClassInfoServiceImpl.getInstance();
	  IClassPicService classPicService = ClassPicServiceImpl.getInstance();
	  
	  List<ClassInfoVO> wishClass = classInfoService.getWishClass();
	  
	  List<ClassInfoVO> filteredWishClass = new ArrayList<>();
	  //class마다 사진정보 가져오기
	  for (ClassInfoVO classInfo : wishClass) {
		  String classId = classInfo.getClassId();
		  ClassPicVO picVO = classPicService.getClassPic(classId);
		  
		  classInfo.setPicVO(picVO);
		  
		  System.out.println("pic ========================================== " + classId);
	
		  if (picVO != null && classId.equals(picVO.getClassId())) {
			  filteredWishClass.add(classInfo);
		  }
		  //JSP페이지로 데이터 전달
		  request.setAttribute("filteredWishClass", filteredWishClass);
		
	  }
	  
	  RequestDispatcher rd = request.getRequestDispatcher("/classList-wish.jsp");
	  rd.forward(request, response);
  }


  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
	  doGet(request, response);
	 
	  
  }
}
