package dao;

import java.util.ArrayList;
import java.util.List;

import common.MyBatisDao;
import vo.UserClassInfoVO;
import vo.UserOrderClassInfoVO;

public class UserOrderClassInfoDao extends MyBatisDao implements IUserOrderClassInfo{

	private static IUserOrderClassInfo userOrderClassInfoDao;
	
	public UserOrderClassInfoDao() {}

	public static IUserOrderClassInfo getInstance() {
		if(userOrderClassInfoDao == null) userOrderClassInfoDao = new UserOrderClassInfoDao();
		return userOrderClassInfoDao;
	}
	
	
	
	@Override
	public List<UserOrderClassInfoVO> getAllUserOrderClassInfoList() {

		List<UserOrderClassInfoVO> uocList =new ArrayList<UserOrderClassInfoVO>();
		
		uocList = selectList("userOrderClassInfo.getAlluserOrderClassInfoList");
		
		
		return uocList;
	}

	@Override
	public List<UserOrderClassInfoVO> getUserIdOrderClassInfo(String userId) {

		List<UserOrderClassInfoVO> uIdocList =new ArrayList<UserOrderClassInfoVO>();
		
		uIdocList = selectList("userOrderClassInfo.getuserIdOrderClassInfoList",userId);
		
		return uIdocList;
	}

	@Override
	public List<UserClassInfoVO> getAllUserClassInfoList() {

		List<UserClassInfoVO> ucList = new ArrayList<UserClassInfoVO>();
		
		ucList = selectList("userOrderClassInfo.getAllUserClassInfoList");
		return ucList;
	}

	@Override
	public List<UserClassInfoVO> getUserIdClassInfoList(String userId) {

		List<UserClassInfoVO> uIcList = new ArrayList<UserClassInfoVO>();
		
		uIcList = selectList("userOrderClassInfo.getUserIdClassInfoList",userId);
		
		return uIcList;
		
		
	}

}
