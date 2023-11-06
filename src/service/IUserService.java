package service;

import java.util.List;
import java.util.Map;

import vo.ClassInfoVO;
import vo.OrdersVO;
import vo.UserVO;

public interface IUserService {

	public UserVO loginChk(Map<String, Object> loginChkMap);

	public UserVO getUser(String user_id);
	
	public ClassInfoVO getClass(String class_id);
	
	public OrdersVO getOrder(OrdersVO ordersVO);
	
	public int getUpdate(UserVO uv);

	public int getupdateChangeE(UserVO uv);
	
	public int joinUser(UserVO userVO);
	
	public String findId(Map<String, Object> findIdMap);
	
	public String findPw(Map<String, Object> findPwMap);
	
	public List<UserVO> getUserList();
	

}
