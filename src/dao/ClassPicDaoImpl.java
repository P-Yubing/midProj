package dao;

import org.apache.ibatis.annotations.Insert;

import common.MyBatisDao;
import vo.ClassPicVO;

public class ClassPicDaoImpl extends MyBatisDao implements IClassPicDao {
	
	private static IClassPicDao classPicDao;
	
	public ClassPicDaoImpl() {
		
	}
	
	public static IClassPicDao getInstance() {
		if(classPicDao == null) {
			classPicDao = new ClassPicDaoImpl();
		}
		
		return classPicDao;
	}
	
	
	@Override
	public ClassPicVO getClassPic(String classId) {

		
		ClassPicVO pic = selectOne("classpic.getClassPic", classId);
		
		return pic;
	}

	@Override
	public int insertClassPic(ClassPicVO cpv) {

		int cnt = insert("classpic.insertClasspic", cpv);
		
		return cnt;
	}

}
