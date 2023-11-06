package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import service.ClassServiceImpl;
import service.IClassService;
import util.SqlSessionUtil;
import vo.ClassVO;

@WebServlet("/classcreate")
public class CreateClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GET 요청에 대한 처리 로직을 구현
        
        // classcreate.jsp로 이동
        RequestDispatcher dispatcher = request.getRequestDispatcher("/classcreate.jsp");
        dispatcher.forward(request, response);
    }
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
//        // 로그인한 사용자의 USER_ID 가져오기
        String userId = (String) request.getSession().getAttribute("loginCode");
//
        ClassVO classVO = new ClassVO();
        classVO.setClassstatus("N");  // 클래스 상태 설정
        classVO.setUserid(userId);  // 사용자 아이디 설정

        // MyBatis를 사용하여 데이터베이스에 클래스 정보 삽입
        try (SqlSession sqlSession = SqlSessionUtil.getSqlSession()) {
            // 클래스 정보 삽입
            sqlSession.insert("class2.createClass", classVO);

            // 클래스 테이블 생성 후 commit
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}