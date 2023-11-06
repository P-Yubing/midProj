package service;

import java.util.List;
import java.util.Map;

import dao.ClassDaoImpl;
import dao.IClassDao;
import vo.ClassVO;

public class ClassServiceImpl implements IClassService {

	private static IClassService classService;
	
	private IClassDao dao;
	
	public ClassServiceImpl() {
		
		dao = ClassDaoImpl.getInstance();
	}
	
	public static IClassService getInstance() {
		if(classService == null) {
			classService = new ClassServiceImpl();
		}
		return classService;
	}
	
	@Override
	public int createClass(ClassVO cv) {
		
		return dao.createClass(cv);
	}


//	@Override
//	public List<ClassVO> searchClass(String keyword) {
//		
//		return dao.searchClass(keyword);
//	}


	@Override
	public List<ClassVO> searchClassType(String typeList) {

		return dao.searchClassType(typeList);
	}

	@Override
	public int classConfirm(String classId) {

		return dao.classConfirm(classId);
	}

	@Override
	public List<ClassVO> classConfirmList() {

		return dao.classConfirmList();
	}

	@Override
	public int classReject(Map<String, Object> rejectMap) {

		return dao.classReject(rejectMap);
	}

	//후기시 필요
    @Override
    public ClassVO getClassid(String className) {
        return dao.getClassid(className);
    }
}

