package service;

import vo.ClassPicVO;

public interface IClassPicService {
	
	public ClassPicVO getClassPic(String classId);

	
	public int insertClassPic(ClassPicVO cpv);
}
