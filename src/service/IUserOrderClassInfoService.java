package service;

import java.util.List;

import vo.UserClassInfoVO;
import vo.UserOrderClassInfoVO;

public interface IUserOrderClassInfoService {

	public List<UserOrderClassInfoVO> getAllUOCInfoList();

	public List<UserOrderClassInfoVO> getUIdOCInfoList(String userId);
	
	public List<UserClassInfoVO> getAllUCInfoList();

	public List<UserClassInfoVO> getUIdCInfoList(String userId);
	
}
