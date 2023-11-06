package dao;

import vo.ClassPicVO;

public interface IClassPicDao {

	public ClassPicVO getClassPic(String classId);

	public int insertClassPic(ClassPicVO cpv);
	
}
