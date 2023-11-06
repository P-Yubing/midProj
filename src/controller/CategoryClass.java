package controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/CategoryClass")
public class CategoryClass extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IClassInfoService classInfoService; // IClassInfoService 인터페이스를 사용하여 서비스 객체를 선언
    private IClassPicService classPicservice = ClassPicServiceImpl.getInstance();
    
    @Override
    public void init() throws ServletException {
        super.init();

        // ClassInfoServiceImpl 객체를 생성하여 classInfoService에 할당
        classInfoService = new ClassInfoServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GET 요청 처리
        String classCategory = request.getParameter("classCategory");

        if (classCategory != null) {
            // classInfoService를 사용하여 작업 수행
            // getCategoryClass 메서드를 호출하여 카테고리별 클래스 정보를 가져오는 작업 수행
            List<ClassInfoVO> categoryClass = classInfoService.getCategoryClass(classCategory);
            for(ClassInfoVO classInfo : categoryClass) {
            	String classId = classInfo.getClassId();
            	ClassPicVO pic = classPicservice.getClassPic(classId);
            	if(pic != null) {
            		classInfo.setClassPicId(pic.getClassPicId());
            	}else {
            		System.out.println("사진을 찾을수 없습니다.");
            	}
            	// 결과를 request에 저장
            	request.setAttribute("categoryClass", categoryClass);
            	request.setAttribute("getClassPic", pic);
            }

        }

        // classList-Category.jsp로 포워딩
        request.getRequestDispatcher("/classList-Category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // POST 요청 처리
        request.setCharacterEncoding("UTF-8");
        String classCategory = request.getParameter("classCategory");
        
        
        
        // classInfoService를 사용하여 작업 수행
        // getCategoryClass 메서드를 호출하여 카테고리별 클래스 정보를 가져오는 작업 수행
        List<ClassInfoVO> categoryClass = classInfoService.getCategoryClass(classCategory);
        
        
        // 결과를 request에 저장
        request.setAttribute("categoryClass", categoryClass);
        // classList-Category.jsp로 포워딩
        request.getRequestDispatcher("/classList-Category.jsp").forward(request, response);
    }
}
