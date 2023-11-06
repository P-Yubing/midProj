package dao;

import java.util.List;

import vo.ClassInfoVO;

public interface IClassInfoViewDao {

	ClassInfoVO getClassInfoById(String classId);


	List<ClassInfoVO> classInfoViewList(ClassInfoVO civ);

	int classWishCount(int classId);
	
}
