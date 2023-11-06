package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.IUserDao;
import dao.UserDaoImpl;
import vo.ClassInfoVO;
import vo.OrdersVO;
import vo.UserVO;

public class UserServiceImpl implements IUserService {
	
	private IUserDao userDao;
	private static IUserService userService;
	
	private UserServiceImpl() {
		userDao = UserDaoImpl.getInstance();
	}
	
	public static IUserService getInstance() {
		if(userService == null) userService = new UserServiceImpl();
		return userService;
	}

	@Override
	public UserVO loginChk(Map<String, Object> loginChkMap) {

		UserVO userVO = new UserVO();
		try {
			userVO = userDao.loginChk(loginChkMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userVO;
	}

	@Override
	public UserVO getUser(String user_id) {

		return userDao.getUser(user_id);
	}

	@Override
	public ClassInfoVO getClass(String class_id) {
		
		return userDao.getClass(class_id);
	}

	@Override
	public OrdersVO getOrder(OrdersVO ordersVO) {
		
		return userDao.getOrder(ordersVO);
	}

	@Override
	public int getUpdate(UserVO uv) {
		return userDao.getUpdate(uv);
	}

	@Override
	public int getupdateChangeE(UserVO uv) {
		return userDao.getupdateChangeE(uv);
	}

	@Override
	public int joinUser(UserVO userVO) {

		return userDao.joinUser(userVO);
	}

	@Override
	public String findId(Map<String, Object> findIdMap) {

		return userDao.findId(findIdMap);
	}

	@Override
	public String findPw(Map<String, Object> findPwMap) {

		return userDao.findPw(findPwMap);
	}

	@Override
	public List<UserVO> getUserList() {
		
		return userDao.getAllUserList();
	}

	
	
}
