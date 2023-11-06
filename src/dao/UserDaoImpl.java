package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import vo.ClassInfoVO;
import vo.OrdersVO;
import vo.UserVO;

public class UserDaoImpl extends MyBatisDao implements IUserDao {

	private static IUserDao userDao;
	
	private UserDaoImpl(){}
	
	public static IUserDao getInstance() {
		if(userDao == null) userDao = new UserDaoImpl();
		return userDao;
	}
	
	@Override
	public UserVO loginChk(Map<String, Object> loginChkMap) throws SQLException {
		return selectOne("users.loginChk", loginChkMap);
	}

	@Override
	public UserVO getUser(String user_id) {

		UserVO uv = selectOne("users.getUser", user_id);
		
		return uv;
	}

	@Override
	public ClassInfoVO getClass(String class_id) {
		
		ClassInfoVO civ = selectOne("classinfo.getClass", class_id);
		
		return civ;
	}

	@Override
	public OrdersVO getOrder(OrdersVO ordersVO) {

		OrdersVO ov = selectOne("orders.getOrder", ordersVO);
		
		return ov;	
		
	}

	@Override
	public int getUpdate(UserVO uv) {
		
		int cnt = update("users.getUpdate", uv);
		
		return cnt;
	}

	@Override
	public int getupdateChangeE(UserVO uv) {
	
		int cnt = update("users.updateChangeE", uv);
		
		return cnt;
	}

	@Override
	public int joinUser(UserVO userVO) {
		
		int cnt = insert("users.join", userVO);
		
		return cnt;
	}

	@Override
	public String findId(Map<String, Object> findIdMap) {

		String userId = selectOne("users.findId", findIdMap);
		
		return userId;
	}

	@Override
	public String findPw(Map<String, Object> findPwMap) {

		String userPw = selectOne("users.findPw", findPwMap);
		
		return userPw;
	}

	@Override
	public List<UserVO> getAllUserList() {
		
		List<UserVO> userList = new ArrayList<UserVO>();
		
		userList = selectList("users.getAllUserList");
		
		return userList;
	}

	


}
