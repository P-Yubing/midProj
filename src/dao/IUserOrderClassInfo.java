package dao;

import java.util.List;

import vo.UserClassInfoVO;
import vo.UserOrderClassInfoVO;

public interface IUserOrderClassInfo {

	public List<UserOrderClassInfoVO> getAllUserOrderClassInfoList();
	
	List<UserOrderClassInfoVO> getUserIdOrderClassInfo(String userId);
	
	public List<UserClassInfoVO> getAllUserClassInfoList();
	
	List<UserClassInfoVO> getUserIdClassInfoList(String userId);
	
	
}
