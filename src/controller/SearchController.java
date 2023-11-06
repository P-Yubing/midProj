package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import service.ClassPicServiceImpl;
import service.ClassServiceImpl;
import service.IClassPicService;
import service.IClassService;
import vo.ClassInfoVO;
import vo.ClassPicVO;
import vo.ClassVO;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/search")
public class SearchController extends HttpServlet {
    private SqlSessionFactory sqlSessionFactory;

    public void init() {
        // 마이바티스 설정 파일의 경로
        String configPath = "/WEB-INF/classes/config/mybatis-config.xml";

        // SqlSessionFactory 생성
        String realPath = getServletContext().getRealPath(configPath);
        try (InputStream inputStream = new FileInputStream(realPath)) {
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
       
        IClassPicService classPicService = ClassPicServiceImpl.getInstance();
        
        String searchType = request.getParameter("searchType");
        String searchAddr = request.getParameter("searchAddr");
        String searchKeyword = request.getParameter("searchKeyword");
        
//        try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
//           Map<String, Object> paramMap = new HashMap<>();
//           paramMap.put("searchKeyword", searchKeyword);
//           
//           List<ClassVO> classList = sqlSession.selectList("class.getClassInfo", paramMap);
//           
//           request.setAttribute("classList", classList);
//           System.out.println("searchKeyword >>>>>>>>>>>>>>>>>>>>>>>>" + searchKeyword);
//           request.getRequestDispatcher("searchResult.jsp").forward(request, response);
//        }
        
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            // SQL 쿼리문 실행을 위한 매개변수 맵 생성
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("searchType", searchType);
            paramMap.put("searchAddr", searchAddr);
            paramMap.put("searchKeyword", searchKeyword);

            // XML 매퍼에 정의된 쿼리문 호출 및 실행
            List<ClassInfoVO> classList = sqlSession.selectList("class.getClassTypeInfo", paramMap);

            // 각 클래스 정보에 대응하는 사진 정보를 가져와서 설정
            for (ClassInfoVO classInfo : classList) {
                String classId = classInfo.getClassId();
                ClassPicVO picVO = classPicService.getClassPic(classId);
                classInfo.setPicVO(picVO);
            }

            // 결과를 request 속성에 저장
            request.setAttribute("classList", classList);
            
            // 결과를 표시할 JSP로 포워드
            request.getRequestDispatcher("/searchResult.jsp").forward(request, response);
        }
  // 결과를 표시할 JSP로 포워드
        }
    }
