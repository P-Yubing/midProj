package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.MyBatisDao;
import vo.SettleVO;

public class SettleInfoDaoImpl extends MyBatisDao implements ISettleInfoDao{
	
	private static ISettleInfoDao settleInfoDaoImpl;
	
	public SettleInfoDaoImpl() {}
	
	public static ISettleInfoDao getInstance() {
		if(settleInfoDaoImpl == null) settleInfoDaoImpl = new SettleInfoDaoImpl();
		return settleInfoDaoImpl;
	}

	@Override
	public List<SettleVO> getsettleList() {

		List<SettleVO> settleList = new ArrayList<SettleVO>();
		
		settleList = selectList("settle.getsettleList");
		
		return settleList;
	}

	@Override
	public List<SettleVO> getsettleUserList(String userId) {

		List<SettleVO> settleList = new ArrayList<SettleVO>();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId",userId);
		
		settleList = selectList("settle.getsettleUserList",map);
		
		return settleList;
	}
	
	

}
