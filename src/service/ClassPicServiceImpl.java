package service;

import java.util.UUID;

import dao.ClassPicDaoImpl;
import dao.IClassPicDao;
import vo.ClassPicVO;

public class ClassPicServiceImpl implements IClassPicService{
	
	private IClassPicDao classPicDao;
	
	private static IClassPicService picService;
	
	public ClassPicServiceImpl() {
		
		classPicDao = ClassPicDaoImpl.getInstance();
	}
		
	public static IClassPicService getInstance() {
		if(picService == null) {
			picService = new ClassPicServiceImpl();
		}
		
		return picService;
	}
	
	
	
	

	@Override
	public ClassPicVO getClassPic(String classId) {
		
		return classPicDao.getClassPic(classId);
	}
	
	public static void main(String[] args) {
		System.out.println(UUID.randomUUID().toString());
	}

	@Override
	public int insertClassPic(ClassPicVO cpv) {

		return classPicDao.insertClassPic(cpv);
	}
}
