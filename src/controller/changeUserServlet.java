package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDaoImpl;
import service.IUserService;
import service.UserServiceImpl;
import vo.UserVO;

@WebServlet("/changeUserServlet")
public class changeUserServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = (String)req.getSession().getAttribute("loginCode");
		
		IUserService userService=UserServiceImpl.getInstance();
		
		UserVO uv = userService.getUser(userId);
		
		req.setAttribute("uv", uv);
		
		int cnt = userService.getupdateChangeE(uv);
		
		req.getRequestDispatcher("/Logout").forward(req, resp);

	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

        // 폼에서 전달된 회원 정보 가져오기
		String userId = (String)req.getSession().getAttribute("loginCode");
		
		System.out.println("changeUserServlet 실행여부");
       
	    // 가져온 회원 정보를 UserVO 객체에 저장
	    UserVO uservo = new UserVO(userId);

        // 회원 정보 업데이트를 위해 UserService 객체 생성
		IUserService userService = UserServiceImpl.getInstance();
		
        // 회원 정보 업데이트 수행
		int cnt = userService.getupdateChangeE(uservo);
		
		String msg = "";
		
		if(cnt > 0) {
			//성공
			msg = "성공";
			
		}else {
			//실패
			msg = "실패";
		}

		HttpSession session = req.getSession();
        session.setAttribute("msg", msg);

        // 업데이트 작업 이후에 userMypage.jsp로 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/changeUserServlet");

	}

}
