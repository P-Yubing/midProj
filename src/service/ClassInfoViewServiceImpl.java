package service;

import java.util.ArrayList;
import java.util.List;

import dao.ClassInfoViewDaoImpl;
import dao.IClassInfoViewDao;
import vo.ClassInfoVO;

public class ClassInfoViewServiceImpl implements IClassInfoViewService{

	private IClassInfoViewDao classinfoviewDao;
	private static IClassInfoViewService classinfoviewService;
	
	private ClassInfoViewServiceImpl() {
		
		classinfoviewDao = ClassInfoViewDaoImpl.getInstance();
	}
	
	public static IClassInfoViewService getInstance() {
		if(classinfoviewService == null)
			classinfoviewService = new ClassInfoViewServiceImpl();
		return classinfoviewService;
	}
	
	
	
	@Override
	public ClassInfoVO getClassInfoById(String classId) {
		return classinfoviewDao.getClassInfoById(classId);
	}
	
	   @Override
	    public List<ClassInfoVO> classInfoViewList(ClassInfoVO civ) {
	       return classinfoviewDao.classInfoViewList(civ);
	    }

	@Override
	public int classWishCount(int classId) {
		return classinfoviewDao.classWishCount(classId);
	}




}
