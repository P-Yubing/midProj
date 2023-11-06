package service;

import java.util.List;

import dao.IUserOrderClassInfo;
import dao.UserOrderClassInfoDao;
import vo.UserClassInfoVO;
import vo.UserOrderClassInfoVO;

public class UserOrderClassInfoService implements IUserOrderClassInfoService  {

	private IUserOrderClassInfo userOrderClassInfoDao;
	private static IUserOrderClassInfoService userOrderClassInfoService;
	
	private UserOrderClassInfoService() {
		userOrderClassInfoDao = UserOrderClassInfoDao.getInstance();
	}
	public static IUserOrderClassInfoService getInstance() {
		if(userOrderClassInfoService == null) userOrderClassInfoService = new UserOrderClassInfoService();
		return userOrderClassInfoService;
	}
	
	
	
	@Override
	public List<UserOrderClassInfoVO> getAllUOCInfoList() {
		
		return userOrderClassInfoDao.getAllUserOrderClassInfoList();
	}

	@Override
	public List<UserOrderClassInfoVO> getUIdOCInfoList(String userId) {
		
		return userOrderClassInfoDao.getUserIdOrderClassInfo(userId);
	}
	@Override
	public List<UserClassInfoVO> getAllUCInfoList() {
		
		return userOrderClassInfoDao.getAllUserClassInfoList();
	}
	@Override
	public List<UserClassInfoVO> getUIdCInfoList(String userId) {
		
		return userOrderClassInfoDao.getUserIdClassInfoList(userId);
	}

}
