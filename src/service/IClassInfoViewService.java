package service;

import java.util.List;

import vo.ClassInfoVO;
import vo.NoticeVO;

public interface IClassInfoViewService {

	public ClassInfoVO getClassInfoById(String classId);


	public List<ClassInfoVO> classInfoViewList(ClassInfoVO civ); 

	
	public int classWishCount(int classId);
}
