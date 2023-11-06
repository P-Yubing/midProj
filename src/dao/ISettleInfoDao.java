package dao;

import java.util.List;

import vo.SettleVO;

public interface ISettleInfoDao {
	
	public List<SettleVO> getsettleList();

	public List<SettleVO> getsettleUserList(String userId);

}
