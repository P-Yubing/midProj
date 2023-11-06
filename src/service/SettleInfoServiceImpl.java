package service;

import java.util.List;

import dao.ISettleInfoDao;
import dao.SettleInfoDaoImpl;
import vo.SettleVO;

public class SettleInfoServiceImpl implements ISettleInfoService {
	
	private ISettleInfoDao settleInfoDao;
	private static ISettleInfoService settleInfoService;
	
	private SettleInfoServiceImpl() {
		settleInfoDao = SettleInfoDaoImpl.getInstance();
	}
	public static ISettleInfoService getInstance() {
		if(settleInfoService == null) settleInfoService = new SettleInfoServiceImpl();
		return settleInfoService;
	}
	
	
	

	@Override
	public List<SettleVO> getsettleList() {
		
		return settleInfoDao.getsettleList();
	}
	
	@Override
	public List<SettleVO> getsettleUserList(String userId) {
		
		return settleInfoDao.getsettleUserList(userId);
	}
	 
	

}
