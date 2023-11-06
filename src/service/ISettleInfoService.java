package service;

import java.util.List;

import vo.SettleVO;

public interface ISettleInfoService {

	public List<SettleVO> getsettleList();
	
	public List<SettleVO> getsettleUserList(String userId);
}
