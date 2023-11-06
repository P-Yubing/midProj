package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IUserService;
import service.UserServiceImpl;

@WebServlet("/FindId")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindId() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher rd = request.getRequestDispatcher("/findId.jsp");
		rd.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String userTel = request.getParameter("userTel");
	
		Map<String, Object> findIdMap = new HashMap<>();
		
		findIdMap.put("userName", userName);
		findIdMap.put("userTel", userTel);
		
		IUserService userService = UserServiceImpl.getInstance();
		String findId = userService.findId(findIdMap);
		
		request.setAttribute("findId", findId);
		
		RequestDispatcher rd = request.getRequestDispatcher("/idResult.jsp");
		rd.forward(request, response);
	
	}

	
	
}
