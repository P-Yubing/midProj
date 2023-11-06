package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.ClassInfoVO;
import vo.OrdersVO;
import vo.UserVO;

public interface IUserDao {
	
	//로그인 체크 (id = pw 검증)
	public UserVO loginChk(Map<String, Object> loginChkMap) throws SQLException;

	public UserVO getUser(String user_id);
	
	public ClassInfoVO getClass(String class_id);
	
	public OrdersVO getOrder(OrdersVO ordersVO);
	
	public int getUpdate(UserVO uv);

	public int getupdateChangeE(UserVO uv);
	
	public int joinUser(UserVO userVO);
	
	public String findId(Map<String, Object> findIdMap);

	public String findPw(Map<String, Object> findPwMap);
	
	public List<UserVO> getAllUserList();

	

}
